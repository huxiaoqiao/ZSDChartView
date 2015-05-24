//
//  ViewController.m
//  ZSDChartView
//
//  Created by 胡晓桥 on 15/2/4.
//  Copyright (c) 2015年 Qian100. All rights reserved.
//

#import "ViewController.h"
#import "ZSDChartView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZSDChartView *chartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.chartView.moneyAccuracy = kMoneyAccuracy100;
    self.chartView.dataArray = @[@"123",@"188",@"96",@"256",@"128",@"567",@"452",@"275",@"638",@"552",@"363",@"233"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
