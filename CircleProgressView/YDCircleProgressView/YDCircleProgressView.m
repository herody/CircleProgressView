//
//  YDCircleProgressView.m
//  Test
//
//  Created by 侯亚迪 on 17/7/21.
//  Copyright © 2017年 杭州魔品科技. All rights reserved.
//

#import "YDCircleProgressView.h"

@interface YDCircleProgressView ()
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) CGFloat progressDelta;
@property (nonatomic, assign) NSInteger runCount;
@property (nonatomic, copy) CompletionBlock completion;
@end

@implementation YDCircleProgressView

#pragma mark - 初始化方法

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //赋初始值
        self.circleBorderWidth = 4.0f;
        self.circleColor = [UIColor blackColor];
        self.progressColor = [UIColor cyanColor];
        self.pointRadius = 2.5f;
        self.pointBorderWidth = 0.5f;
        self.pointColor = [UIColor whiteColor];
        self.pointBorderColor = [UIColor lightGrayColor];
        self.curProgress = 0.0f;
    }
    return self;
}

#pragma mark - 懒加载

- (CGFloat)circleRadius
{
    if (!_circleRadius) {
        self.circleRadius = self.bounds.size.width * 0.5 - MAX(self.pointRadius, self.circleBorderWidth * 0.5);
    }
    return _circleRadius;
}

#pragma mark - setter方法

- (void)setCurProgress:(CGFloat)curProgress
{
    //安全判断
    if (curProgress < 0 || curProgress > 1) {
        return;
    }
    _curProgress = curProgress;
    
    //刷新UI
    [self setNeedsDisplay];
}

#pragma mark - drawRect

- (void)drawRect:(CGRect)rect
{
    //背景圆
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.bounds.size.width * 0.5 - self.circleRadius, self.bounds.size.width * 0.5 - self.circleRadius, self.circleRadius * 2, self.circleRadius * 2) cornerRadius:self.circleRadius];
    [self.circleColor setStroke];
    circlePath.lineWidth = self.circleBorderWidth;
    [circlePath stroke];

    //进度条
    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5) radius:self.circleRadius startAngle:-M_PI_2 endAngle:M_PI * 2 * self.curProgress - M_PI_2 clockwise:YES];
    [self.progressColor setStroke];
    progressPath.lineWidth = self.circleBorderWidth;
    [progressPath stroke];
    
    //小圆点
    UIBezierPath *pointPath = [UIBezierPath bezierPathWithArcCenter:progressPath.currentPoint radius:self.pointRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [self.pointColor setFill];
    [pointPath fill];
    [self.pointBorderColor setStroke];
    pointPath.lineWidth = self.pointBorderWidth;
    [pointPath stroke];
}

#pragma mark - 公开方法

- (void)updateProgress:(CGFloat)progress duration:(NSTimeInterval)duration completion:(CompletionBlock)completion
{
    //安全判断
    if (progress < 0 || progress > 1) {
        return;
    }
    
    //保存属性值
    self.duration = duration;
    self.progressDelta = progress - self.curProgress;
    self.runCount = 0;
    self.completion = completion;
    
    //停止定时器
    self.displayLink.paused = YES;
    [self.displayLink invalidate];
    
    //开启定时器
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

#pragma mark - 定时器事件

- (void)updateDisplay
{
    //更新计数器
    self.runCount++;
    
    //计算定时器运行次数
    NSInteger count = ceil(self.duration / self.displayLink.duration);
    count = count > 0 ? count : 1;
    
    //更新进度
    self.curProgress += self.progressDelta / count;
    
    //停止计时器
    if (self.runCount == count) {
        self.displayLink.paused = YES;
        [self.displayLink invalidate];
        if (self.completion) self.completion();
    }
}

@end
