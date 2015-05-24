//
//  Lines.m
//  ZSDChartView
//
//  Created by 胡晓桥 on 15/2/4.
//  Copyright (c) 2015年 Qian100. All rights reserved.
//

#import "Lines.h"

@implementation Lines


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSet];
    }
    return self;
}
#pragma mark - 初始化参数
- (void)initSet
{
    self.backgroundColor = [UIColor clearColor];
    self.startPoint = self.frame.origin;
    self.endPoint = self.frame.origin;
    self.color = [UIColor blueColor];
    self.lineWidth = 1.0f;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画连接线
    [self drawLineWithContext:context];
}

- (void)drawLineWithContext:(CGContextRef)context
{
    //设置线条宽度
    CGContextSetLineWidth(context, self.lineWidth);
    //设置平滑/抗锯齿
    CGContextSetShouldAntialias(context, YES);
    //设置线条颜色
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    
    if (self.startPoint.x == self.endPoint.x && self.endPoint.y == self.startPoint.y) {
        //定义多个点 画多点连线
        for (id item in self.points) {
            CGPoint currentPoint = CGPointFromString(item);
            if ((int)currentPoint.y < (int)self.frame.size.height && currentPoint.y>0) {
                if ([self.points indexOfObject:item] == 0) {
                    CGContextMoveToPoint(context, currentPoint.x, currentPoint.y);
                    continue;
                }
                CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
                CGContextStrokePath(context);//开始画线
                if ([self.points indexOfObject:item] < self.points.count) {
                    CGContextMoveToPoint(context, currentPoint.x, currentPoint.y);
                }
            }
            
        }
    }else {
        //定义两个点，画两点连线
        const CGPoint points[] = {self.startPoint,self.endPoint};
        CGContextStrokeLineSegments(context, points, 2);//绘制线段（默认不会绘制端点）
    }
}



@end
