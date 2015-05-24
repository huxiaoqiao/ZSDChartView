//
//  ZSDChartView.h
//  ZSDChartView
//
//  Created by 胡晓桥 on 15/2/4.
//  Copyright (c) 2015年 Qian100. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ENUM(NSUInteger, kMoneyAccuracy){
    kMoneyAccuracy10 = 1,
    kMoneyAccuracy20,
    kMoneyAccuracy50,
    kMoneyAccuracy100,
    kMoneyAccuracy200,
    kMoneyAccuracy500,
    kMoneyAccuracy1000
};

@interface ZSDChartView : UIView

/**
 *  图表标题
 */

@property (nonatomic, copy) NSString *chartTitle;

/**
 *  纵坐标精确度
 */
@property (nonatomic, assign) enum kMoneyAccuracy moneyAccuracy;

/**
 *  月份数（显示1月-当前月份）
 */
@property (nonatomic, assign) int months;

/**
 *  数据数组(从一月份到当前月份的收益)
 */
@property (nonatomic, setter=setDataArray:) NSArray *dataArray;

@end
