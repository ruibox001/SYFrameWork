//
//  SYScrollImageView.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SYScrollImageView.h"
#import "ScrollLineIndicator.h"
#import "ScrollDotIndicator.h"


typedef void (^scrollImageClick)(NSInteger index);
typedef void (^loadImageBlock)(UIImageView *imageView, NSString *url);

@interface SYScrollImageView() <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (nonatomic,strong) ScrollDotIndicator *dotIndicator;
@property (nonatomic,strong) ScrollLineIndicator *lineIndicator;
@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) NSMutableArray *imageArray;

@property (nonatomic,strong) UIColor *pageNormalColor;
@property (nonatomic,strong) UIColor *pageCurrentColor;

@property (nonatomic,assign) BOOL limit;

@property (nonatomic,assign) ScrollImageIndicatorStyle style;

@property (nonatomic,assign) CGFloat scrollSeconds;

@property (nonatomic,strong) NSMutableArray *urlArray;

@property (nonatomic,copy) scrollImageClick clickBloc;
@property (nonatomic,copy) scrollImageClick scrollBloc;

@property (nonatomic,assign) CGFloat scrollIndicatorOffset;

@property (nonatomic,copy) loadImageBlock loadImageBloc;

@end

@implementation SYScrollImageView

static dispatch_queue_t _loggingQueue;

SYScrollImageView *scrollImage(BOOL limit) {
    SYScrollImageView *s = SYScrollImageView.alloc.init;
    s.limit = limit;
    return s;
}

- (SYScrollImageView *(^)(CGFloat))second {
    return ^(CGFloat sec){
        self.scrollSeconds = sec;
        return self;
    };
}

- (SYScrollImageView *(^)(CGRect))srollFrame {
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (SYScrollImageView *(^)(void (^)(UIImageView *imageView, NSString *url)))loadImageWithUrl {
    return ^(loadImageBlock block) {
        self.loadImageBloc = block;
        return self;
    };
}

- (SYScrollImageView *(^)(CGFloat))indicatorOffset {
    return ^(CGFloat indicatorOffset){
        self.scrollIndicatorOffset = indicatorOffset;
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

- (SYScrollImageView *(^)(NSString *))addImageName{
    return ^(NSString *imageName){
        [self.urlArray addObject:imageName];
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
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (ScrollDotIndicator *)dotIndicator {
    if (!_dotIndicator) {
        _dotIndicator = [ScrollDotIndicator shareWithDotIndicatorWithFrame:CGRectMake(0, self.frame.size.height-10+self.scrollIndicatorOffset, self.frame.size.width, 2) numberOfPages:self.urlArray.count normalColor:self.pageNormalColor cColor:self.pageCurrentColor];
        [self addSubview:_dotIndicator];
    }
    return _dotIndicator;
}

- (ScrollLineIndicator *)lineIndicator {
    if (!_lineIndicator) {
        _lineIndicator = [ScrollLineIndicator shareWithFrame:CGRectMake(0, self.frame.size.height-5+self.scrollIndicatorOffset, self.frame.size.width, 2) numberOfLine:self.urlArray.count lineColor:self.pageNormalColor selectColor:self.pageCurrentColor];
        [self addSubview:_lineIndicator];
    }
    return _lineIndicator;
}

-(void) setUrls:(NSArray *)urls
{
    
    NSLog(@"frame: %@",NSStringFromCGRect(self.frame));
    [self.timer invalidate];
    self.timer = nil;
    
    
    NSInteger imageCount = urls.count;
    if (imageCount == 0) {
        CGRect rect = self.frame;
        rect.size.height = 0;
        self.frame = rect;
        return;
    }
    
    for (UIImageView *imgView in self.imageArray) {
        [imgView removeFromSuperview];
    }
    [self.imageArray removeAllObjects];
    
    for (int i = 0; i < imageCount; i ++)
    {
        NSString *item = urls[i];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = i;
        [self setImageFromURL:item imgView:imageView];
        [self.imageArray addObject:imageView];
    }
    
    if (!self.limit) {
        NSString *item = urls[imageCount - 1];
        UIImageView *lastImageView = [[UIImageView alloc] init];
        [self setImageFromURL:item imgView:lastImageView];
        [self.imageArray insertObject:lastImageView atIndex:0];
        lastImageView.tag = imageCount - 1;
        
        NSString *item1 = urls[0];
        UIImageView *firstImageView = [[UIImageView alloc] init];
        [self setImageFromURL:item1 imgView:firstImageView];
        [self.imageArray addObject:firstImageView];
        firstImageView.tag = 0;
    }
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * (self.imageArray.count), 0)];
    if (self.style == ScrollImageIndicatorStyleLine) {
        [self.lineIndicator drawSelectLineOfNumber:0];
    }
    else {
        [self.dotIndicator setPageIndex:0];
    }
    for (NSInteger i = 0; i < self.imageArray.count; i ++)
    {
        UIImageView * imageView = self.imageArray[i];
        [imageView setFrame:CGRectMake(i*width, 0, width, height)];
        [self.scrollView addSubview:imageView];
        [self view:imageView addClickWithTarget:self sel:@selector(clickImgView:)];
    }
    if (!self.limit) {
        [self.scrollView setContentOffset:CGPointMake(width, 0)];
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.scrollSeconds target:self selector:@selector(timeUpChangeScrollView) userInfo:nil repeats:YES];
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

        [self setCurrentPageIndex:page];
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
        
        [self setCurrentPageIndex:(page-1)];
    }
}

#pragma mark - 拖拉ScrollView结束时重新刷新
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.limit) {
        CGFloat scrollW = self.scrollView.frame.size.width;
        NSInteger page = self.scrollView.contentOffset.x / scrollW;

        [self.scrollView setContentOffset:CGPointMake(page * scrollW, 0)];
        
        [self setCurrentPageIndex:page];
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

        [self setCurrentPageIndex:(page-1)];
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

-(void) setImageFromURL:(NSString *)url imgView:(UIImageView *)imgView {
    if (![url hasPrefix:@"http"]) {
        [imgView setImage:[UIImage imageNamed:url]];
    }
    else {
        if (self.loadImageBloc) {
            self.loadImageBloc(imgView,url);
        }
        else {
            if (!_loggingQueue) {
                _loggingQueue = dispatch_queue_create("sf.scroll.image", DISPATCH_QUEUE_SERIAL);
            }
            dispatch_block_t block = ^{
                @autoreleasepool {
                    [self downLoadImageWithImageView:imgView url:url];
                }
            };
            dispatch_async(_loggingQueue, block);
        }
    }
}

- (void)downLoadImageWithImageView:(UIImageView *)imageView url:(NSString *)url {
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    dispatch_sync(dispatch_get_main_queue(), ^{
        imageView.image = img;
    });
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
    if (self.style == ScrollImageIndicatorStyleLine) {
        if (self.lineIndicator) {
            [self.lineIndicator drawSelectLineOfNumber:page];
        }
    }
    else {
        if (self.dotIndicator) {
            [self.dotIndicator setPageIndex:page];
        }
    }
    if (self.scrollBloc) {
        self.scrollBloc(page);
    }
}

@end
