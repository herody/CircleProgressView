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
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) CGFloat curProgress;
@end

@implementation YDCircleProgressView

#pragma mark - 初始化方法

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor blackColor];
        self.progressColor = [UIColor cyanColor];
        self.pointColor = [UIColor whiteColor];
        self.pointBorderColor = [UIColor lightGrayColor];
        
        self.circleRadius = self.bounds.size.width * 0.5 - 10;
        self.circleBorderWidth = 4.0;
        self.pointRadius = 2.5;
        self.pointBorderWidth = 0.5;
    }
    return self;
}

#pragma mark - 重写drawRect

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.bounds.size.width * 0.5 - self.circleRadius, self.bounds.size.width * 0.5 - self.circleRadius, self.circleRadius * 2, self.circleRadius * 2) cornerRadius:self.circleRadius];
    [self.circleColor setStroke];
    circlePath.lineWidth = self.circleBorderWidth;
    [circlePath stroke];

    UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5) radius:self.circleRadius startAngle:-M_PI_2 endAngle:M_PI * 2 * self.curProgress - M_PI_2 clockwise:YES];
    [self.progressColor setStroke];
    progressPath.lineWidth = self.circleBorderWidth;
    [progressPath stroke];
    

    UIBezierPath *pointPath = [UIBezierPath bezierPathWithArcCenter:progressPath.currentPoint radius:self.pointRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [self.pointColor setFill];
    [pointPath fill];
    [self.pointBorderColor setStroke];
    pointPath.lineWidth = self.pointBorderWidth;
    [pointPath stroke];
}

#pragma mark - 公开方法

- (void)runToProgress:(CGFloat)progress duration:(NSTimeInterval)duration
{
    self.progress = progress;
    self.duration = duration;
    self.curProgress = 0;
    
    self.displayLink.paused = YES;
    [self.displayLink invalidate];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

#pragma mark - 定时器事件

- (void)updateDisplay
{
    self.curProgress += self.progress / (self.duration / self.displayLink.duration);
    if (self.curProgress >= self.progress) {
        self.displayLink.paused = YES;
        [self.displayLink invalidate];
    }
    [self setNeedsDisplay];
}

@end
