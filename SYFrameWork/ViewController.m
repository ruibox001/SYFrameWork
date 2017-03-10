//
//  ViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "ViewController.h"
#import "SYUIFrameworkHeader.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //alert使用
//    AlertMaker().title(@"这里标题").message(@"这里内容").style(UIAlertControllerStyleAlert).cancelAction(@"取消",UIAlertActionStyleDefault,nil).addAction(@"Action",UIAlertActionStyleDefault,nil).show(self);
    
    //导航栏左右返回键定义
//    [self addNavigationTitle:@"标题"];
//    [self addNavigationLeft:[UIImage imageNamed:@"back_black"] clickBlock:nil];
//    [self addNavigationRight:@"协议" clickBlock:nil];
    
    //引导页使用
//    NSArray *imgs = @[@"640x1136page1",@"640x1136page2",@"640x1136page3"];
//    guiViewBuilder().images(imgs).btnBottonOffset(50).createBtn(@"立即体验",[UIColor redColor],[UIColor blackColor],8,CGSizeMake(100, 40),12,^(){
//        NSLog(@"click");
//    }).addImageName(@"640x1136page2").show();
    
    //渐变测试
//    [self.view viewAddAlphaColors:@[[UIColor redColor],[UIColor blueColor]] startPoint:CGPointMake(0.5, 0) endPoint:CGPointMake(0.5, 1.0)];

}

@end
