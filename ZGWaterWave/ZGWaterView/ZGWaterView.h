//
//  ZGWaterView.h
//  ZGWaterWave
//
//  Created by zhanggui on 2017/2/6.
//  Copyright © 2017年 zhanggui. All rights reserved.
//水波纹效果

#import <UIKit/UIKit.h>


@interface ZGWaterView : UIView

/**
 wave1的颜色
 */
@property (nonatomic,strong)UIColor *wave1Color;

/**
 wave2的颜色
 */
@property (nonatomic,strong)UIColor *wave2Color;
/**
 振幅
 */
@property (nonatomic,assign)CGFloat swingValue;

/**
 周期
 */
@property (nonatomic,assign)CGFloat waveCycleValue;


/**
 位移
 */
@property (nonatomic,assign)CGFloat displacementValue;

/**
 当前波浪高度
 */
@property (nonatomic,assign)CGFloat currentWaveHeight;


/**
 波浪速度
 */
@property (nonatomic,assign)CGFloat waveSpeed;

/**
 水波纹宽度
 */
@property (nonatomic,assign)CGFloat waveWidth;
@end
