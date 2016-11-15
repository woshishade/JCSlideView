//
//  SlideView.m
//  Demo2
//
//  Created by JC iPhone on 15/11/18.
//  Copyright © 2015年 zhouqiang. All rights reserved.
//

#import "SlideView.h"

@implementation SlideView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        movePoint = CGPointMake(iPhoneWidth - 40, iPhoneHeight / 2);
        
        moveView = [[UIView alloc]initWithFrame:CGRectMake(iPhoneWidth - 40, iPhoneHeight / 2, 40, 40)];
        moveView.backgroundColor = [UIColor redColor];
        moveView.hidden = YES;
        [self addSubview:moveView];
    }
    return self;
}

- (void)push
{
    CALayer *layer   =  (CALayer *)[self.layer presentationLayer];
    CGRect rect      = [[layer valueForKeyPath:@"frame"]CGRectValue];
    
    [UIView animateWithDuration:0.25 animations:^{
        if (rect.origin.x == 0) {
            [self.layer setValue:@(iPhoneWidth) forKeyPath:@"frame.origin.x"];
        }
        else{
            [self.layer setValue:@(0) forKeyPath:@"frame.origin.x"];
        }
    }];
    
    if (rect.origin.x != 0) {
        
        /** CAKeyframeAnimation找不出位移的准确位置，而且一次过后frame值就不变了，有待研究 */
//        CAKeyframeAnimation *key = [CAKeyframeAnimation animation];
//        key.duration = 0.75f;
//        key.keyPath  = @"position.x";
//        key.values   = @[@(iPhoneWidth / 2 - 100),@(iPhoneWidth / 2 + 50),@(iPhoneWidth / 2)];
//        key.keyTimes = @[@(0.33),@(0.66),@(1)];
        //设置动画执行完毕之后不删除动画
//        key.removedOnCompletion = NO;
//        key.fillMode = kCAFillModeForwards;
//        key.delegate = self;
//        [moveView.layer addAnimation:key forKey:@""];
        
        
        [UIView animateWithDuration:0.25 animations:^{
            [moveView.layer setValue:@(iPhoneWidth / 2 - 100) forKeyPath:@"frame.origin.x"];
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                [moveView.layer setValue:@(iPhoneWidth / 2 + 50) forKeyPath:@"frame.origin.x"];
            }completion:^(BOOL finished) {
                [UIView animateWithDuration:0.25 animations:^{
                    [moveView.layer setValue:@(iPhoneWidth / 2) forKeyPath:@"frame.origin.x"];
                }completion:^(BOOL finished) {
                    [displaylink invalidate];
                    displaylink = nil;
                }];
            }];
        }];
        
        displaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(actionMove)];
        [displaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [displaylink invalidate];
    displaylink = nil;
}

- (void)actionMove
{
    CALayer *layer   =  (CALayer *)[moveView.layer presentationLayer];
    CGRect rect      = [[layer valueForKeyPath:@"frame"]CGRectValue];
    
    movePoint = CGPointMake(rect.origin.x, iPhoneHeight / 2);
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    UIBezierPath *path = [UIBezierPath bezierPath];
    [[UIColor cyanColor] setFill];
    
    [path moveToPoint:CGPointMake(iPhoneWidth , iPhoneHeight)];
    [path addLineToPoint:CGPointMake(iPhoneWidth, 0)];
    [path addLineToPoint:CGPointMake(iPhoneWidth / 2, 0)];
    [path addQuadCurveToPoint:CGPointMake(iPhoneWidth / 2, iPhoneHeight) controlPoint:movePoint];
    [path closePath];
    [path fill];
    
    NSLog(@"%f",movePoint.x);
    
}


@end
