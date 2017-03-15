//
//  ThirdViewController.m
//  SYFrameWork
//
//  Created by 王声远 on 17/3/10.
//  Copyright © 2017年 王声远. All rights reserved.
//

#import "ThirdViewController.h"
#import "SYUIBuilderHeader.h"
#import "SYLineBtnBuilder.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES];
    
    AlphaKer *mk = alphaBuilder().addColor([UIColor redColor]).addColor([UIColor blueColor]).startPoint(0, 0.5).endPoint(1, 0.5);
    View.xywh(20,100,200,200).bgColor(color(@"0xfff400,0.3")).intoView(self.view).makerAlpha(mk).targetSel(self,@selector(click));
    
    lineBtnBuilder.addTitleIcon(@"文字",@"icon_financial_share").addTitleIcon(@"文字1",@"icon_financial_share").addTitleIcon(@"文字1",@"icon_financial_share").click(^(NSInteger index){
        NSLog(@"click > %ld",index);
    }).intoView(self.view).xywh(100,400,200,86).bgColor(rgb(0xdddd11)).borderWidthRadius(rgb(0xd36251),@1,@5);
}

- (void)click {
    NSLog(@"click");
}

@end
