//
//  ThirdViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "ThirdViewController.h"
#import "SYUIBuilderHeader.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    AlphaKer *mk = alphaBuilder().addColor([UIColor redColor]).addColor([UIColor blueColor]).startPoint(0.5, 1.0).endPoint(0.5, 0.5);
    View.xywh(20,100,200,50).targetSel(self,@selector(click)).makerAlpha(mk).intoView(self.view);
}

- (void)click {
    NSLog(@"click");
}

@end
