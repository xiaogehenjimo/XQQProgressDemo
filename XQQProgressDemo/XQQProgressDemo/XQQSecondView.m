//
//  XQQSecondView.m
//  XQQProgressDemo
//
//  Created by XQQ on 16/9/22.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQSecondView.h"

@implementation XQQSecondView

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
     CGRect fullRect = CGRectMake(0, 0, self.frame.size.width * _progress, self.frame.size.height);
     [[UIColor colorWithRed:49/255.0 green:194/255.0 blue:124/255.0 alpha:1] set];
     UIRectFillUsingBlendMode(fullRect, kCGBlendModeSourceIn);
    
    /*
     kCGBlendModeClear,                   R = 0
     kCGBlendModeCopy,                    R = S
     kCGBlendModeSourceIn,                R = S*Da
     kCGBlendModeSourceOut,               R = S*(1 - Da)
     kCGBlendModeSourceAtop,              R = S*Da + D*(1 - Sa)
     kCGBlendModeDestinationOver,         R = S*(1 - Da) + D
     kCGBlendModeDestinationIn,           R = D*Sa
     kCGBlendModeDestinationOut,          R = D*(1 - Sa)
     kCGBlendModeDestinationAtop,         R = S*(1 - Da) + D*Sa
     kCGBlendModeXOR,                     R = S*(1 - Da) + D*(1 - Sa)
     kCGBlendModePlusDarker,              R = MAX(0, (1 - D) + (1 - S))
     kCGBlendModePlusLighter
     */
    

}

@end
