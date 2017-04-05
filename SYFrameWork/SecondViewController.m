//
//  SecondViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "SecondViewController.h"
#import "SYAlertBuilder.h"
#import "SYTabBarMaker.h"
#import "SYScrollImageView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIView *v = scrollImageUnLimit.addUrls(@[@"http://192.168.1.24:8080/resources/banner/6102ea9b0bd4412eb0f728c5fa6188b4.jpg",@"http://192.168.1.24:8080/resources/banner/0e3fe7190b104eeeb1499036b8dab991.png",@"http://p2.so.qhimgs1.com/t019f0a9e88ea82026e.jpg"]).scrollBlock(^(NSInteger index){
        NSLog(@"index: %ld",index);
    }).click(^(NSInteger index){
        NSLog(@"click: %ld",index);
    }).second(5).addUrl(@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1489653619810&di=3f4a1e5cd74e046107f86e2beb7b236c&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Ftouxiang%2F201703%2F2017031520341425.jpg").indicatorOffset(2).indicatorNormalColor([UIColor redColor]).indicatorCurrentColor([UIColor blueColor]).indicatorStyle(ScrollImageIndicatorStyleLine).srollFrame(CGRectMake(0, 74, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.5));
    [self.view addSubview:v];
}

- (void)click {
    //alert使用
    Sheet.title(@"这里标题").message(@"这里内容").cancelAction(@"取消",^(){
        
        [self hidenTabBar:YES];
        
    }).addAction(@"Action",^(){
        
        [self hidenTabBar:NO];
        
    }).show(self);
    
}

@end
