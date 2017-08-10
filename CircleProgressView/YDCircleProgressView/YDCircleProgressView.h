//
//  YDCircleProgressView.h
//  Test
//
//  Created by 侯亚迪 on 17/7/21.
//  Copyright © 2017年 杭州魔品科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompletionBlock)(void);

@interface YDCircleProgressView : UIView
@property (nonatomic, assign) CGFloat circleRadius;  //背景圆半径
@property (nonatomic, assign) CGFloat circleBorderWidth; //背景圆线条宽度
@property (nonatomic, strong) UIColor *circleColor; //背景圆颜色

@property (nonatomic, strong) UIColor *progressColor; //进度条颜色

@property (nonatomic, assign) CGFloat pointRadius;  //小圆点半径
@property (nonatomic, assign) CGFloat pointBorderWidth;  //小圆点边框宽度
@property (nonatomic, strong) UIColor *pointColor;  //小圆点颜色
@property (nonatomic, strong) UIColor *pointBorderColor; //小圆点边框色

@property (nonatomic, assign) CGFloat curProgress;  //当前进度值

/**
 更新进度

 @param progress 更新后的进度值
 */
- (void)updateProgress:(CGFloat)progress;

/**
 更新进度动画

 @param progress 更新后的进度值
 @param duration 动画时间
 @param completion 动画结束回调
 */
- (void)updateProgress:(CGFloat)progress duration:(NSTimeInterval)duration completion:(CompletionBlock)completion;

@end
