//
//  XQQView.m
//  XQQProgressDemo
//
//  Created by XQQ on 16/9/21.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQView.h"

@interface XQQView()

@property (nonatomic, assign) CGRect myFrame;

@end

@implementation XQQView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _myFrame = frame;
        //[self setNeedsDisplay];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
     NSLog(@"%f",_progress);
        
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, self.frame.size.width/2, self.frame.size.height/2);
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, self.frame.size.width/2 - 10, -M_PI_2, 2 * M_PI * _progress - M_PI_2, NO);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextDrawPath(context, kCGPathFill);
}
@end
