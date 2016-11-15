//
//  ViewController.h
//  Demo2
//
//  Created by JC iPhone on 15/11/18.
//  Copyright © 2015年 zhouqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
//屏幕尺寸
#define iPhoneHeight [[UIScreen mainScreen] bounds].size.height
#define iPhoneWidth  [[UIScreen mainScreen] bounds].size.width
#import "SlideView.h"

@interface ViewController : UIViewController
{
    SlideView *slide;
}

@end

