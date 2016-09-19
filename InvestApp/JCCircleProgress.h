//
//  JCCircleProgress.h
//  TzgApp
//
//  Created by 张久成 on 15/8/24.
//  Copyright (c) 2015年 TZG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCCircleProgress : UIView <CAAnimationDelegate>
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) BOOL isShade;

- (void)startAnimation;
- (id)initWithFrame:(CGRect)frame withProgress:(CGFloat)p withLineWidth:(CGFloat)w withIsShade:(BOOL)b;
@end
