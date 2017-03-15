//
//  FirstViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "FirstViewController.h"
#import "SYNavigationHeader.h"
#import "SYScrollImageView.h"
#import "SYUIBuilderHeader.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationTitle:@"标题"];
    [self addNavigationLeft:[UIImage imageNamed:@"back_black"] clickBlock:nil];
    [self addNavigationRight:@"协议" clickBlock:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    scrollImageUnLimit.seconds(2.0).indicatorStyle(ScrollImageIndicatorStyleDot).addUrls(@[@"http://192.168.1.24:8080/resources/banner/6102ea9b0bd4412eb0f728c5fa6188b4.jpg",@"http://192.168.1.24:8080/resources/banner/0e3fe7190b104eeeb1499036b8dab991.png",@"http://p2.so.qhimgs1.com/t019f0a9e88ea82026e.jpg"]).click(^(NSInteger index){
        NSLog(@"click: %ld",index);
    }).scrollBlock(^(NSInteger indx){
        NSLog(@"scroll: %ld",indx);
    }).xywh(0,200,[UIScreen mainScreen].bounds.size.width,230).intoView(self.view).bgColor(rgb(0x666666));
//    
//    ImageView.img([UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://192.168.1.24:8080/resources/banner/6102ea9b0bd4412eb0f728c5fa6188b4.jpg"]]]).xywh(100,300,80,80).intoView(self.view);
}

@end
