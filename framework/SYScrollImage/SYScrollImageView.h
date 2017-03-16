//
//  SYScrollImageView.h
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ScrollImageIndicatorStyle) {
    ScrollImageIndicatorStyleDot     = 0,
    ScrollImageIndicatorStyleLine = 1,
};

#define scrollImageLimit scrollImage(YES)
#define scrollImageUnLimit scrollImage(NO)

@interface SYScrollImageView : UIView

/**
 初始化构建器
 @param limit 是否无限循环
 @return 构造器
 */
SYScrollImageView *scrollImage(BOOL limit);

/**
 构建滚动图片的时间间隔
 @return 构造器
 */
- (SYScrollImageView *(^)(CGFloat))second;

/**
 构建滚动的frame
 @return 构造器
 */
- (SYScrollImageView *(^)(CGRect))srollFrame;

/**
 提供自己下载图片的block，可以在外面使用SDWebImage自己下载，否则使用系统自带方式下载
 @return 构造器
 */
- (SYScrollImageView *(^)(void (^)(UIImageView *imageView, NSString *url)))loadImageWithUrl;

/**
 构建滚动图片指示器的Y轴的offset
 @return 构造器
 */
- (SYScrollImageView *(^)(CGFloat))indicatorOffset;

/**
 构建指示器样式：ScrollImageIndicatorStyleDot（点） ScrollImageIndicatorStyleLine(线）
 @return 构造器
 */
- (SYScrollImageView *(^)(ScrollImageIndicatorStyle))indicatorStyle ;

/**
 构建指示器的不选中的颜色
 @return 构造器
 */
- (SYScrollImageView *(^)(UIColor *))indicatorNormalColor ;

/**
 构建指示器当前选择的颜色
 @return 构造器
 */
- (SYScrollImageView *(^)(UIColor *))indicatorCurrentColor ;

/**
添加滚动图片名称/URL(本地图片名称）数组
 @return 构造器
 */
- (SYScrollImageView *(^)(NSArray *))addUrls ;

/**
 添加滚动图片名称/URL(本地图片名称）
 @return 构造器
 */
- (SYScrollImageView *(^)(NSString *))addUrl ;

/**
 添加滚动图片名称(本地图片名称）
 @return 构造器
 */
- (SYScrollImageView *(^)(NSString *))addImageName ;

/**
 构建滚动图片点击事件
 @return 构造器
 */
- (SYScrollImageView *(^)(void (^)(NSInteger index)))click ;

/**
 滚动图片位置回调
 @return 构造器
 */
- (SYScrollImageView *(^)(void (^)(NSInteger index)))scrollBlock ;


//应用例子
/*
UIView *v = scrollImageUnLimit.addUrls(@[@"http://192.168.1.24:8080/resources/banner/6102ea9b0bd4412eb0f728c5fa6188b4.jpg",@"http://192.168.1.24:8080/resources/banner/0e3fe7190b104eeeb1499036b8dab991.png",@"http://p2.so.qhimgs1.com/t019f0a9e88ea82026e.jpg"]).scrollBlock(^(NSInteger index){
    NSLog(@"index: %ld",index);
}).click(^(NSInteger index){
    NSLog(@"click: %ld",index);
}).second(5).addUrl(@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489653619810&di=3f4a1e5cd74e046107f86e2beb7b236c&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Ftouxiang%2F201703%2F2017031520341425.jpg").indicatorOffset(2).indicatorNormalColor([UIColor redColor]).indicatorCurrentColor([UIColor blueColor]).indicatorStyle(ScrollImageIndicatorStyleLine).srollFrame(CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 200)).loadImageWithUrl(^(UIImageView *imageView, NSString *url){
    NSLog(@"图片：%@ - url:%@",imageView,url);
    [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
});
[self.view addSubview:v];
*/

@end
