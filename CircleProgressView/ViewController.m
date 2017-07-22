//
//  ViewController.m
//  CircleProgressView
//
//  Created by 侯亚迪 on 17/7/22.
//  Copyright © 2017年 杭州魔品科技. All rights reserved.
//

#import "ViewController.h"
#import "YDCircleProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) YDCircleProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.progressView = [[YDCircleProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _progressView.circleRadius = 30;
    _progressView.circleBorderWidth = 8;
    _progressView.circleColor = [UIColor orangeColor];
    _progressView.progressColor = [UIColor greenColor];
    _progressView.pointRadius = 5;
    _progressView.pointColor = [UIColor redColor];
    _progressView.pointBorderWidth = 1;
    _progressView.pointBorderColor = [UIColor blackColor];
    [self.view addSubview:_progressView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.progressView runToProgress:0.8 duration:0];
}

@end
