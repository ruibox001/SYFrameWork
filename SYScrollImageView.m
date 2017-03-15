//
//  SYScrollImageView.m
//
//  Created by 王声远 on 15/5/8.
//  Copyright (c) 2015年 王声远. All rights reserved.
//

#import "SYScrollImageView.h"
#import "UIImageView+WebCache.h"
#import "STKFinancialScrollIndicator.h"

@interface SYScrollImageView() <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) STKFinancialScrollIndicator *indicator;
@property (nonatomic,strong) NSTimer *timer;

//存放要循环显示的ScrollView的图片的名称
@property (nonatomic,strong) NSMutableArray *imageArray;

@property (nonatomic,strong) UIColor *pageNormalColor;
@property (nonatomic,strong) UIColor *pageCurrentColor;

@property (nonatomic,assign) BOOL limit;

@property (nonatomic,assign) ScrollImageIndicatorStyle style;

@property (nonatomic,assign) CGFloat scrollSeconds;

@property (nonatomic,strong) NSMutableArray *urlArray;

@property (nonatomic,copy) scrollImageClick clickBloc;
@property (nonatomic,copy) scrollImageClick scrollBloc;

@end

@implementation SYScrollImageView

SYScrollImageView *scrollImage(BOOL limit) {
    SYScrollImageView *s = SYScrollImageView.alloc.init;
    s.limit = limit;
    return s;
}

- (SYScrollImageView *(^)(CGFloat))seconds {
    return ^(CGFloat sec){
        self.scrollSeconds = sec;
        return self;
    };
}

- (SYScrollImageView *(^)(ScrollImageIndicatorStyle))indicatorStyle {
    return ^(ScrollImageIndicatorStyle s){
        self.style = s;
        return self;
    };
}

- (SYScrollImageView *(^)(UIColor *))indicatorNormalColor {
    return ^(UIColor *s){
        self.pageNormalColor = s;
        return self;
    };
}

- (SYScrollImageView *(^)(UIColor *))indicatorCurrentColor {
    return ^(UIColor *s){
        self.pageCurrentColor = s;
        return self;
    };
}

- (SYScrollImageView *(^)(NSArray *))addUrls {
    return ^(NSArray *url){
        [self.urlArray addObjectsFromArray:url];
        return self;
    };
}

- (SYScrollImageView *(^)(NSString *))addUrl {
    return ^(NSString *url){
        [self.urlArray addObject:url];
        return self;
    };
}

- (SYScrollImageView *(^)(void (^)(NSInteger index)))click {
    return ^(void (^block)(NSInteger index)){
        self.clickBloc = block;
        return self;
    };
}

- (SYScrollImageView *(^)(void (^)(NSInteger index)))scrollBlock {
    return ^(void (^block)(NSInteger index)){
        self.scrollBloc = block;
        return self;
    };
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setUrls:self.urlArray];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [self addSubview:_scrollView];
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor clearColor];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        [self addSubview:_pageControl];
        [self bringSubviewToFront:self.pageControl];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.hidesForSinglePage=YES;
        _pageControl.currentPage = 0;
    }
    return _pageControl;
}

-(void) setUrls:(NSArray *)urls
{
    [self.timer invalidate];
    self.timer = nil;
    
    NSInteger imageCount = urls.count;
    if (imageCount == 0) {
        CGRect rect = self.frame;
        rect.size.height = 0;
        self.frame = rect;
        return;
    }
    
    self.pageControl.numberOfPages = imageCount;
    self.pageControl.currentPageIndicatorTintColor = self.pageCurrentColor;
    self.pageControl.pageIndicatorTintColor = self.pageNormalColor;
    
    for (int i = 0; i < imageCount; i ++)
    {
        NSString *item = urls[i];
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.tag = i;
        [self setImageFromURL:item imgView:imageView];
        [self.imageArray addObject:imageView];
        [self view:imageView addClickWithTarget:self sel:@selector(clickImgView:)];
    }
    
    if (!self.limit) {
        NSString *item = urls[imageCount - 1];
        UIImageView *lastImageView = [[UIImageView alloc] init];
        [self setImageFromURL:item imgView:lastImageView];
        [self.imageArray insertObject:lastImageView atIndex:0];
        lastImageView.tag = imageCount - 1;
        [self view:lastImageView addClickWithTarget:self sel:@selector(clickImgView:)];
        
        NSString *item1 = urls[0];
        UIImageView *firstImageView = [[UIImageView alloc] init];
        [self setImageFromURL:item1 imgView:firstImageView];
        [self.imageArray addObject:firstImageView];
        firstImageView.tag = 0;
        [self view:firstImageView addClickWithTarget:self sel:@selector(clickImgView:)];
    }
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    [self.scrollView setFrame:self.bounds];
    [self.pageControl setFrame:CGRectMake(0, height - 20, width, 20)];
    if (self.style == ScrollImageIndicatorStyleLine && !self.indicator && urls.count > 1) {
        self.indicator = [STKFinancialScrollIndicator shareWithFrame:CGRectMake(0, height-5, width, 2) numberOfLine:urls.count lineColor:self.pageNormalColor];
        [self addSubview:self.indicator];
        self.pageControl.hidden = YES;
    }

    
    imageCount = self.imageArray.count;
    width = self.scrollView.bounds.size.width;
    height = self.scrollView.bounds.size.height;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * (imageCount), 0)];
    for (NSInteger i = 0; i < imageCount; i ++)
    {
        UIImageView * imageView = self.imageArray[i];
        [imageView setFrame:CGRectMake(i*width, 0, width, height)];
        [self.scrollView addSubview:imageView];
    }
    if (!self.limit) {
        [self.scrollView setContentOffset:CGPointMake(width, 0)];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.scrollSeconds target:self selector:@selector(timeUpChangeScrollView) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark - 时间到时调用方法，重新刷新ScrollView的contentOffset
-(void)timeUpChangeScrollView
{
    //不是无限滚动
    if (self.limit) {
        NSInteger imageCount = self.imageArray.count;
        CGFloat scrollW = self.scrollView.frame.size.width;
        NSInteger page = self.scrollView.contentOffset.x / scrollW;
        page += 1;
        if (page == imageCount) {
            page = 0;
        }
        [self.scrollView setContentOffset:CGPointMake(page * scrollW, 0) animated:YES];
        
        self.pageControl.currentPage = page;
        [self setCurrentPageIndex:page];
        if (self.scrollBloc) {
            self.scrollBloc(page);
        }
    }
    else {
        NSInteger imageCount = self.imageArray.count - 2;
        CGFloat scrollW = self.scrollView.frame.size.width;
        NSInteger page = self.scrollView.contentOffset.x / scrollW;
        page += 1;
        
        if (page == 0 || page == (imageCount + 1))
        {
            if (page == 0) {
                page = imageCount; 
            }
            else
            {
                page = 1;
            }
            [self.scrollView setContentOffset:CGPointMake((page-1) * scrollW, 0)];
        }
        
        [self.scrollView setContentOffset:CGPointMake(page * scrollW, 0) animated:YES];
        
        self.pageControl.currentPage = page - 1;
        [self setCurrentPageIndex:(page-1)];
        if (self.scrollBloc) {
            self.scrollBloc(page-1);
        }
    }
}

#pragma mark - 拖拉ScrollView结束时重新刷新pageControl
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.limit) {
        CGFloat scrollW = self.scrollView.frame.size.width;
        NSInteger page = self.scrollView.contentOffset.x / scrollW;

        [self.scrollView setContentOffset:CGPointMake(page * scrollW, 0)];
        
        self.pageControl.currentPage = page;
        [self setCurrentPageIndex:page];
        if (self.scrollBloc) {
            self.scrollBloc(page);
        }
    }
    else {
        NSInteger imageCount = self.imageArray.count - 2;
        CGFloat scrollW = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / scrollW;
        
        if (page == 0 || page == (imageCount + 1)) {
            if (page == 0) {
                page = imageCount;
            }
            else
            {
                page = 1;
            }
            
            [self.scrollView setContentOffset:CGPointMake(page * scrollW, 0)];
        }
        self.pageControl.currentPage = page - 1;
        [self setCurrentPageIndex:(page-1)];
        if (self.scrollBloc) {
            self.scrollBloc(page-1);
        }
    }
}

#pragma mark - 开始拖拉ScrollView时就取消定时
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - 结束拖拉ScrollView时定时开始
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.scrollSeconds target:self selector:@selector(timeUpChangeScrollView) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 *  ScrollView的点击事件
 */
-(void)clickImgView:(UITapGestureRecognizer *)sender
{
    UIImageView *imgView = (UIImageView *)sender.view;
    if (self.clickBloc) {
        self.clickBloc(imgView.tag);
    }
}

-(void) setImageFromURL:(NSString *)fileURL imgView:(UIImageView *)imgView {
    if (![fileURL hasPrefix:@"http"]) {
        [imgView setImage:[UIImage imageNamed:fileURL]];
    }
    else {
        [imgView sd_setImageWithURL:[NSURL URLWithString:fileURL]];
    }
}

- (void)view:(UIView *)view addClickWithTarget:(id)target sel:(SEL)sec {
    UITapGestureRecognizer *gasture = [[UITapGestureRecognizer alloc] initWithTarget:target action:sec];
    view.userInteractionEnabled =YES;
    [view addGestureRecognizer:gasture];
}

- (NSMutableArray *)urlArray {
    if (!_urlArray) {
        _urlArray = [NSMutableArray array];
    }
    return _urlArray;
}

- (NSMutableArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

- (UIColor *)pageNormalColor {
    if (!_pageNormalColor) {
        _pageNormalColor = [UIColor grayColor];
    }
    return _pageNormalColor;
}

- (UIColor *)pageCurrentColor {
    if (!_pageCurrentColor) {
        _pageCurrentColor = [UIColor whiteColor];
    }
    return _pageCurrentColor;
}

- (CGFloat)scrollSeconds {
    if (_scrollSeconds < 1) {
        _scrollSeconds = 3.0;
    }
    return _scrollSeconds;
}

- (void)setCurrentPageIndex:(NSInteger)page {
    if (!self.pageControl.hidden) {
        [self bringSubviewToFront:self.pageControl];
    }
    if (self.indicator) {
        [self.indicator drawSelectLineOfNumber:page];
    }
}

@end
