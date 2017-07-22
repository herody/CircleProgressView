//
//  YDCircleProgressView.h
//  Test
//
//  Created by 侯亚迪 on 17/7/21.
//  Copyright © 2017年 杭州魔品科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YDCircleProgressView : UIView
@property (nonatomic, strong) UIColor *circleColor; //背景圆颜色
@property (nonatomic, strong) UIColor *progressColor; //进度条颜色
@property (nonatomic, strong) UIColor *pointColor;  //小圆点颜色
@property (nonatomic, strong) UIColor *pointBorderColor; //小圆点边框色

@property (nonatomic, assign) CGFloat circleRadius;  //背景圆半径
@property (nonatomic, assign) CGFloat circleBorderWidth;  //背景圆线条宽度

@property (nonatomic, assign) CGFloat pointRadius;  //小圆点半径
@property (nonatomic, assign) CGFloat pointBorderWidth;  //小圆点边框宽度


/**
 开始进度跳转动画

 @param progress 将要跳转到的进度
 @param duration 动画时间
 */
- (void)runToProgress:(CGFloat)progress duration:(NSTimeInterval)duration;

@end
