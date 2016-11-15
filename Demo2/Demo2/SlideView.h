//
//  SlideView.h
//  Demo2
//
//  Created by JC iPhone on 15/11/18.
//  Copyright © 2015年 zhouqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define iPhoneHeight [[UIScreen mainScreen] bounds].size.height
#define iPhoneWidth  [[UIScreen mainScreen] bounds].size.width

@interface SlideView : UIView
{
    UIView  *moveView;
    
    CGPoint movePoint;
    
    CADisplayLink *displaylink;
}

- (void)push;

@end
