//
//  ViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/9.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "ViewController.h"
#import "SYAlertBuilder.h"
#import "SYNavigationHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //alert使用
//    AlertMaker().title(@"这里标题").message(@"这里内容").style(UIAlertControllerStyleAlert).cancelAction(@"取消",UIAlertActionStyleDefault,nil).addAction(@"Action",UIAlertActionStyleDefault,nil).show(self);
    
    [self addNavigationTitle:@"标题"];
    [self addNavigationLeft:[UIImage imageNamed:@"back_black"] clickBlock:nil];
    [self addNavigationRight:@"协议" clickBlock:nil];
    self.view.backgroundColor = [UIColor orangeColor];
}

@end
