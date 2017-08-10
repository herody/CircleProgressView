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
    _progressView.backgroundColor = [UIColor redColor];
    _progressView.circleRadius = 40;
    _progressView.circleBorderWidth = 8;
    _progressView.circleColor = [UIColor orangeColor];
    _progressView.progressColor = [UIColor greenColor];
    _progressView.pointRadius = 4;
    _progressView.pointColor = [UIColor whiteColor];
    _progressView.pointBorderWidth = 0.5;
    _progressView.pointBorderColor = [UIColor lightGrayColor];
    [self.view addSubview:_progressView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.progressView updateProgress:self.progressView.curProgress + 0.1 duration:2.0 completion:^{
        NSLog(@"进度更新完成");
    }];
}

@end
