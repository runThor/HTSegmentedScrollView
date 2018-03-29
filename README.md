# HTSegmentedScrollView
一款分段视图控件，SegmentedControl与ScrollView联动，可通过点击SegmentedControl切换视图，也可以拖动ScrollView切换
## Show
![gif](https://github.com/runThor/HTSegmentedScrollView/raw/master/Other/HTSegmentedScrollView.gif)
## Usage
```Objective-C

// ViewController.m

#import "HTSegmentedScrollView.h"

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

```
