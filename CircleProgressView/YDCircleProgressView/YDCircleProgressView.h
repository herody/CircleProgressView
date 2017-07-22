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
@property (nonatomic, strong) UIColor *progressColor; //进度颜色
@property (nonatomic, strong) UIColor *pointColor;  //圆点颜色
@property (nonatomic, strong) UIColor *pointBorderColor; //圆点边框色

@property (nonatomic, assign) CGFloat circleRadius;  //半径
@property (nonatomic, assign) CGFloat circleBorderWidth;  //线条宽度

@property (nonatomic, assign) CGFloat pointRadius;  //圆点半径
@property (nonatomic, assign) CGFloat pointBorderWidth;  //圆点边框宽度


/**
 开始进度跳转动画

 @param progress 将要跳转到的进度
 @param duration 动画时间
 */
- (void)runToProgress:(CGFloat)progress duration:(NSTimeInterval)duration;

@end
