//
//  ViewController.m
//  Demo2
//
//  Created by JC iPhone on 15/11/18.
//  Copyright © 2015年 zhouqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSlider];
}

- (void)initSlider
{
    slide = [[SlideView alloc] initWithFrame:CGRectMake(iPhoneWidth, 0, iPhoneWidth, iPhoneHeight)];
    [self.view addSubview:slide];
    
    UIButton *shake = [[UIButton alloc]initWithFrame:CGRectMake(10, iPhoneHeight - 100, 100, 30)];
    [shake setTitle:@"shake" forState:UIControlStateNormal];
    [shake setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [shake setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    shake.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [shake addTarget:self action:@selector(shake) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shake];
}

- (void)shake
{
    [slide push];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
