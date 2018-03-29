//
//  HTSegmentedScrollView.h
//  HTSegmentedScrollViewDemo
//
//  Created by iOS_zzy on 2018/3/28.
//  Copyright © 2018年 runThor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTSegmentedScrollView : UIView

// 添加Segment选项
- (void)addSegmentedItems:(NSArray *)items;

// 添加滚动页
- (void)addScrollViews:(NSArray *)views;

@end
