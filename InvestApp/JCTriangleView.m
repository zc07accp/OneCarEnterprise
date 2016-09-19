//
//  JCTriangleView.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/25.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "JCTriangleView.h"

@implementation JCTriangleView

- (void)drawRect:(CGRect)rect {
    //设置背景颜色
    
    [[UIColor clearColor]set];
    
    UIRectFill([self bounds]);
    
    //拿到当前视图准备好的画板
    
    CGContextRef
    context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
    CGContextMoveToPoint(context,0, 0);//设置起点
    CGContextAddLineToPoint(context,165, 0);
    CGContextAddLineToPoint(context,165, 160);
//    CGContextAddLineToPoint(context,15, 30);
//    CGContextAddLineToPoint(context,0, 45);
//    CGContextAddLineToPoint(context,0, 0);
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [self.bgColor setFill]; //设置填充色
    [self.bgColor setStroke]; //设置边框颜色
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
}
- (void)setTriangleColor:(UIColor*)color{
    self.bgColor = color;
    [self setNeedsDisplay];
}
@end
