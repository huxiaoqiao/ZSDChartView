//
//  Lines.h
//  ZSDChartView
//
//  Created by 胡晓桥 on 15/2/4.
//  Copyright (c) 2015年 Qian100. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lines : UIView

@property (nonatomic, assign) CGPoint startPoint; //线条起点
@property (nonatomic, assign) CGPoint endPoint;  //线条终点
@property (nonatomic, retain) NSArray *points; //多点连线数组
@property (nonatomic, retain) UIColor *color; //线条颜色
@property (nonatomic, assign) CGFloat lineWidth; //线条宽度

@end
