//
//  ViewController.m
//  HTSegmentedScrollViewDemo
//
//  Created by iOS_zzy on 2018/3/28.
//  Copyright © 2018年 runThor. All rights reserved.
//

#import "ViewController.h"
#import "HTSegmentedScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HTSegmentedScrollView *segView = [[HTSegmentedScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:segView];
    
    [segView addSegmentedItems:@[@"红色", @"黄色", @"蓝色"]];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    
    [segView addScrollViews:@[redView, yellowView, blueView]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
