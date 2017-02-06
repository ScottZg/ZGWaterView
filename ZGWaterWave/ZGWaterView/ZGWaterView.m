//
//  ZGWaterView.m
//  ZGWaterWave
//
//  Created by zhanggui on 2017/2/6.
//  Copyright © 2017年 zhanggui. All rights reserved.
//

#import "ZGWaterView.h"
@interface ZGWaterView ()

/**
 计时器对象，它允许你的程序将其绘画与显示的刷新率同步
 */
@property (nonatomic,strong)CADisplayLink *displayLink;

/**
 第一个波纹
 */
@property (nonatomic,strong)CAShapeLayer *firstWaveLayer;

/**
 第二个波纹
 */
@property (nonatomic,strong)CAShapeLayer *secondWaveLayer;



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

@implementation ZGWaterView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [self initWV];
}
- (void)initWV {
   
    
    _waveWidth = self.bounds.size.width;
    
    
    self.firstWaveLayer.fillColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:250/255.0 alpha:0.5].CGColor;
    
    self.secondWaveLayer.fillColor = [UIColor whiteColor].CGColor;
    self.firstWaveLayer.strokeStart = 0.0;
    self.firstWaveLayer.strokeEnd = 0.8;
    
    self.secondWaveLayer.strokeStart = 0.0;
    self.secondWaveLayer.strokeEnd = 0.8;
//
    _waveSpeed = 0.02;
    
    _swingValue = 8;
    
    _waveCycleValue = 2* M_PI/self.bounds.size.width;
    
    
    _currentWaveHeight = self.bounds.size.height/2;
    
    
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
    
}
#pragma mark - private method
- (void)getCurrentWave {
    _displacementValue += _waveSpeed;
    [self setCurrentLayerPath];
    
}
- (void)setCurrentLayerPath {
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGFloat y = _currentWaveHeight;
    CGPathMoveToPoint(pathRef, NULL, 0, y);
    
    for (float i=0.0f; i<_waveWidth;i++) {
        y = _swingValue*sin(_waveCycleValue*i+_displacementValue) + _currentWaveHeight;
        CGPathAddLineToPoint(pathRef, NULL, i, y);
    }
    
    CGPathAddLineToPoint(pathRef, NULL, _waveWidth, self.bounds.size.height);
    
    CGPathAddLineToPoint(pathRef, NULL, 0, self.bounds.size.height);
    CGPathCloseSubpath(pathRef);
    self.firstWaveLayer.path = pathRef;
    CGPathRelease(pathRef);


    CGMutablePathRef path2Ref = CGPathCreateMutable();
    
    CGFloat y2 = _currentWaveHeight;
    CGPathMoveToPoint(path2Ref, NULL, 0, y2);
    
    for (float i=0.0f; i<_waveWidth;i++) {
        y2 = _swingValue*sin(_waveCycleValue*i+_displacementValue- _waveWidth/2) + _currentWaveHeight;
        CGPathAddLineToPoint(path2Ref, NULL, i, y2);
    }
    
    CGPathAddLineToPoint(path2Ref, NULL, _waveWidth, self.bounds.size.height);
    
    CGPathAddLineToPoint(path2Ref, NULL, 0, self.bounds.size.height);
    CGPathCloseSubpath(path2Ref);
    self.secondWaveLayer.path = path2Ref;
    CGPathRelease(path2Ref);


}
#pragma mark - lazy load
- (CAShapeLayer *)firstWaveLayer {
    if (!_firstWaveLayer) {
        _firstWaveLayer = [[CAShapeLayer alloc] init];
        [self.layer addSublayer:_firstWaveLayer];
    }
    return _firstWaveLayer;
}
- (CAShapeLayer *)secondWaveLayer {
    if (!_secondWaveLayer) {
        _secondWaveLayer = [[CAShapeLayer alloc] init];
        [self.layer addSublayer:_secondWaveLayer];
    }
    return _secondWaveLayer;
}


#pragma mark - delloc
- (void)dealloc {
    if (_displayLink) {
        [_displayLink invalidate];
    }
    
}




@end
