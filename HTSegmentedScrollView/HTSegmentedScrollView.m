//
//  HTSegmentedScrollView.m
//  HTSegmentedScrollViewDemo
//
//  Created by iOS_zzy on 2018/3/28.
//  Copyright © 2018年 runThor. All rights reserved.
//

#import "HTSegmentedScrollView.h"

@interface HTSegmentedScrollView () <UIScrollViewDelegate>

@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) UIView *segmentMarkView;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation HTSegmentedScrollView

- (void)addSegmentedItems:(NSArray *)items {
    // 分段控件
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    self.segmentedControl.frame = CGRectMake(0, 0, 50 * items.count, 50);
    self.segmentedControl.center = CGPointMake(self.frame.size.width/2, 50);
    [self.segmentedControl addTarget:self
                              action:@selector(changeSegment:)
                    forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.tintColor = [UIColor clearColor];
    [self.segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17], NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [self.segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17], NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    [self addSubview:self.segmentedControl];
    
    self.segmentMarkView = [[UIView alloc] initWithFrame:CGRectMake(self.segmentedControl.frame.origin.x, self.segmentedControl.frame.origin.y + self.segmentedControl.frame.size.height, self.segmentedControl.frame.size.width/items.count, 5)];
    self.segmentMarkView.backgroundColor = [UIColor blackColor];
    self.segmentMarkView.layer.cornerRadius = 3;
    self.segmentMarkView.layer.masksToBounds = YES;
    [self addSubview:self.segmentMarkView];
}

- (void)addScrollViews:(NSArray *)views {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, self.frame.size.height - 100)];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * views.count, self.scrollView.frame.size.height);
    [self addSubview:self.scrollView];
    
    for (int i = 0; i < views.count; i++) {
        if (![views[i] isKindOfClass:[UIView class]]) {
            return;
        }
        
        [views[i] setFrame:CGRectMake(self.scrollView.frame.size.width * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        [self.scrollView addSubview:views[i]];
    }
}

#pragma mark - Actions

// 点击分段选项
- (void)changeSegment:(UISegmentedControl *)segmentedControl {
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.segmentMarkView.transform = CGAffineTransformMakeTranslation((self.segmentedControl.frame.size.width/self.segmentedControl.numberOfSegments) * segmentedControl.selectedSegmentIndex, 0);
        
        [self.scrollView setContentOffset:CGPointMake(segmentedControl.selectedSegmentIndex * self.scrollView.frame.size.width, 0)];
    } completion:nil];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.segmentMarkView.transform = CGAffineTransformMakeTranslation(scrollView.contentOffset.x/scrollView.frame.size.width * (self.segmentedControl.frame.size.width/self.segmentedControl.numberOfSegments), 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.segmentedControl.selectedSegmentIndex = (int)(scrollView.contentOffset.x/scrollView.frame.size.width);
}

@end
