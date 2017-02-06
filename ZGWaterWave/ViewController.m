//
//  ViewController.m
//  ZGWaterWave
//
//  Created by zhanggui on 2017/2/6.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "ViewController.h"
#import "ZGWaterView.h"
@interface ViewController ()

@property (nonatomic,strong)ZGWaterView *waterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"波纹";
    [self.waterView setFrame:self.view.frame];
   
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIImageView *navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:220/255.0f green:20/255.0f blue:60/255.0f alpha:1];
    self.navigationController.navigationBar.translucent = NO;
}
// 寻找导航栏下的黑线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
#pragma mark - lazy load
- (ZGWaterView *)waterView {
    if (!_waterView) {
        _waterView = [[ZGWaterView alloc] initWithFrame:CGRectZero];
        _waterView.backgroundColor = [UIColor colorWithRed:220/255.0f green:20/255.0f blue:60/255.0f alpha:1];
        [self.view addSubview:_waterView];
    }
    return _waterView;
}
@end
