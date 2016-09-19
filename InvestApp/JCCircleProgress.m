//
//  JCCircleProgress.m
//  TzgApp
//
//  Created by 张久成 on 15/8/24.
//  Copyright (c) 2015年 TZG. All rights reserved.
//

#import "JCCircleProgress.h"

@implementation JCCircleProgress 

+ (Class)layerClass
{
    return [CAGradientLayer class];
}

- (id)initWithFrame:(CGRect)frame withProgress:(CGFloat)p withLineWidth:(CGFloat)w withIsShade:(BOOL)b
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.progress = p;
        self.lineWidth = w;
        self.isShade = b;
        [self setupMulticolor];
        self.layer.mask = [self produceCircleShapeLayer];
    }
    return self;
}


- (void)setupMulticolor
{
    CAGradientLayer *gradientLayer = (id)[self layer];
    
    // 设置颜色线条分布的方向
    gradientLayer.startPoint = CGPointMake(0.0, 0.0);
    gradientLayer.endPoint = CGPointMake(1.0, 0.0);
    
    // 创建颜色数组
    NSMutableArray *colors = [NSMutableArray array];
    if (self.isShade) {
        gradientLayer.colors = [NSArray arrayWithObjects:
                               (id)[UIColor colorWithRed:1
                                                   green:.4
                                                    blue:0
                                                   alpha:1].CGColor,
                                (id)[UIColor colorWithRed:1
                                                    green:.32
                                                     blue:0.29
                                                    alpha:1].CGColor,
                                (id)[UIColor colorWithRed:1
                                                    green:.32
                                                     blue:0.29
                                                    alpha:1].CGColor,
                                (id)[UIColor colorWithRed:1
                                                    green:.4
                                                     blue:0
                                                    alpha:1].CGColor,
                               nil];
    }else{
        for (NSInteger hue = 0; hue <= 360; hue++) {
            
            [colors addObject:(id)[UIColor colorWithRed:.9 green:0.9 blue:0.9 alpha:1].CGColor];
        }
        [gradientLayer setColors:[NSArray arrayWithArray:colors]];
        
    }
 
    
}

- (CAShapeLayer *)produceCircleShapeLayer
{
    
    
    // 生产出一个圆的路径
    CGFloat m = M_PI;
    CGFloat angle = m+M_PI*2*self.progress;
    CGPoint circleCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat circleRadius = self.bounds.size.width/2.0-self.lineWidth*2;
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:circleCenter
                                                              radius:circleRadius
                                                          startAngle:M_PI
                                                            endAngle:angle
                                                           clockwise:YES];
    
    // 生产出一个圆形路径的Layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = circlePath.CGPath;
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer.lineWidth = self.lineWidth;
    
    // 可以设置出圆的完整性
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 1.0;
    
    return shapeLayer;
}

#pragma mark - Animation

- (void)startAnimation
{
    
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration = 1.8;
    bas.delegate = self;
    bas.fromValue=[NSNumber numberWithInteger:0];
    bas.toValue=[NSNumber numberWithInteger:1];
    [self.layer.mask addAnimation:bas forKey:@"key"];
}

- (void)endAnimation
{
    [self.layer removeAllAnimations];
}

@end
