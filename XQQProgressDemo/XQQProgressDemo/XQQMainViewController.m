//
//  XQQMainViewController.m
//  XQQProgressDemo
//
//  Created by XQQ on 16/9/21.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "XQQMainViewController.h"
#import "XQQView.h"
#import "XQQSecondView.h"
@interface XQQMainViewController ()
@property(nonatomic,strong)   NSTimer  * timer;
@property(nonatomic, assign)  CGFloat   progress;
@property(nonatomic, strong)  XQQView  *  drawView;
@property(nonatomic, strong)  XQQSecondView  *  secondView;
@end

@implementation XQQMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UI
    [self initUI];
    _progress = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
    //暂停
    [_timer setFireDate:[NSDate distantFuture]];
}
- (void)initUI{
    [self BtnWithTitle:@"开始" frame:CGRectMake(10, 100, 60, 40) addToView:self.view AndTag:1];
    [self BtnWithTitle:@"停止" frame:CGRectMake(100, 100, 60, 40) addToView:self.view AndTag:2];
    _drawView = [[XQQView alloc]initWithFrame:CGRectMake(100, 200, 150, 150)];
    _drawView.layer.cornerRadius = _drawView.frame.size.width * 0.5;
    _drawView.layer.masksToBounds = YES;
    _drawView.layer.borderWidth = 5;
    _drawView.layer.borderColor = [UIColor redColor].CGColor;
    _drawView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_drawView];
    _secondView = [[XQQSecondView alloc]initWithFrame:CGRectMake(100, CGRectGetMaxY(_drawView.frame)+10, 150, 44)];
    _secondView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_secondView];
}

//改变进度
- (void)changeProgress{
    _progress = _progress + 0.01;
    [self drawViewWithProgress:_progress];
    //画圆
    if (_progress >= 1) {
        [_timer setFireDate:[NSDate distantFuture]];
        _progress = 0;
        return;
    }
}

//画圆
- (void)drawViewWithProgress:(CGFloat)progress{
    _drawView.progress = progress;
    _secondView.progress = progress;
}

- (void)buttonDidPress:(UIButton*)button{
    switch (button.tag) {
        case 1:{//开始
            [_timer setFireDate:[NSDate distantPast]];
        }
            break;
        case 2:{//停止
            [_timer setFireDate:[NSDate distantFuture]];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (UIButton*)BtnWithTitle:(NSString*)title frame:(CGRect)frame addToView:(UIView*)view AndTag:(NSInteger)tag{
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.backgroundColor = [UIColor yellowColor];
    button.tag = tag;
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonDidPress:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return button;
}

@end
