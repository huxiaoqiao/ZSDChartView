//
//  ZSDChartView.m
//  ZSDChartView
//
//  Created by 胡晓桥 on 15/2/4.
//  Copyright (c) 2015年 Qian100. All rights reserved.
//

#import "ZSDChartView.h"
#import "Lines.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//#define COLUMN_WIDTH ((SCREEN_WIDTH - 32) / 11.0)

@interface ZSDChartView()
{
    
    UILabel *_titleLabel;
    CGFloat COLUMN_WIDTH;
    NSMutableArray *pointArray;
}
@end

@implementation ZSDChartView

- (void)awakeFromNib
{
    [self initSet];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSet];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i = 0;i < _months;i ++)
    {
        const CGPoint points[] = {16 + COLUMN_WIDTH * i,61,16 + COLUMN_WIDTH * i,61+114};
        
        
        CGContextAddLines(context, points, 2);
        CGContextSetLineWidth(context, 0.5);
        [[UIColor lightGrayColor] setStroke];
        CGContextDrawPath(context, kCGPathStroke);
    }
    
    //画横坐标标题
    for (int i = 0; i < _months; i++) {
        NSString *str;
        if (i <9) {
            str = [NSString stringWithFormat:@"0%d月",i+1];
            
        }else
        {
            str = [NSString stringWithFormat:@"%d月",i+1];
            
        }
        
        
        [str drawAtPoint:CGPointMake(8+COLUMN_WIDTH * i, 61+114) withAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:11]}];
    }
    
    //画纵坐标标题
    NSInteger accuracy;
    switch (self.moneyAccuracy) {
            case kMoneyAccuracy10:
            accuracy = 10;
            break;
            case kMoneyAccuracy20:
            accuracy = 20;
            break;
            case kMoneyAccuracy50:
            accuracy = 50;
            break;
            case kMoneyAccuracy100:
            accuracy = 100;
            break;
            case kMoneyAccuracy200:
            accuracy = 200;
            break;
            case kMoneyAccuracy500:
            accuracy = 500;
            break;
            case kMoneyAccuracy1000:
            accuracy = 1000;
            break;
        default:
            break;
    }
    
    for (int i = 0; i < 6; i ++) {
        CGPoint point = CGPointMake(20, 58+21*i);
        
        NSString *moneyStr = [NSString stringWithFormat:@"%ld",accuracy*(6-i)];
        [moneyStr drawAtPoint:point withAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:10]}];
        
        const CGPoint points[] = {42,65+21*i,SCREEN_WIDTH - 10,65+21*i};
        CGContextAddLines(context, points, 2);
        CGContextSetLineWidth(context, 0.5);
        [[UIColor lightGrayColor] setStroke];
        CGContextDrawPath(context, kCGPathStroke);
        
        const CGPoint points2[] = {16,65+21*i,20,65+21*i};
        CGContextAddLines(context, points2, 2);
        CGContextSetLineWidth(context, 0.5);
        [[UIColor lightGrayColor] setStroke];
        CGContextDrawPath(context, kCGPathStroke);
    }
    //画数据折线
    pointArray = [NSMutableArray array];
    
    if (_dataArray.count > 0) {
        
        for (int i = 0; i < _dataArray.count; i ++) {
            CGFloat x = 16 + COLUMN_WIDTH * i;
            CGFloat money = [_dataArray[i] floatValue];
            CGFloat y;
            if (money <= accuracy) {
                y = 175 - money * 21 / accuracy;
            }else
            {
                y = 175 - money * 5 / accuracy;
            }
            CGPoint point = CGPointMake(x, y);
            NSString *pointStr = [NSString stringWithFormat:@"%@",NSStringFromCGPoint(point)];
            [pointArray addObject:pointStr];

        }
    }
    Lines *line = [[Lines alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    line.color = [UIColor orangeColor];
    line.lineWidth = 2;
    line.points = pointArray;
    [self addSubview:line];
    
}

- (void)initSet
{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.bounds = CGRectMake(0, 0, 120, 30);
    _titleLabel.center = CGPointMake( SCREEN_WIDTH / 2, 28);
    _titleLabel.text = @"2014年度收益趋势";
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = [UIColor lightGrayColor];
   _months = 12;
    COLUMN_WIDTH = (SCREEN_WIDTH - 32) / ((_months-1)*1.0);
    self.moneyAccuracy = kMoneyAccuracy200;
    [self addSubview:_titleLabel];
    
}

- (void)setMonths:(int)months
{
    if (_months != months) {
        COLUMN_WIDTH = (SCREEN_WIDTH - 32) / (months * 1.0);
        [self setNeedsDisplay];
    }
}

- (void)setChartTitle:(NSString *)chartTitle
{
    if (_chartTitle != chartTitle) {
        _titleLabel.text = chartTitle;
    }
}

- (void)setMoneyAccuracy:(enum kMoneyAccuracy)moneyAccuracy
{
    if (_moneyAccuracy != moneyAccuracy) {
        _moneyAccuracy = moneyAccuracy;
        [self setNeedsDisplay];
    }
}

- (void)setDataArray:(NSArray *)dataArray
{
    if (_dataArray != dataArray) {
        _dataArray = dataArray;
        [self setNeedsDisplay];
    }
}


@end
