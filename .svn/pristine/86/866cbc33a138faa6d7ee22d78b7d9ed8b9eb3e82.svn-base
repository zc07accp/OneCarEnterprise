//
//  UIButoon+Style.h
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/17.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (style)
/**
 获取一个新创建的button
 */
+ (UIButton*)buttonWithTitle:(NSString*)title
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color;


+ (UIButton*)buttonWithTitle:(NSString*)title
                 withTitleColor:(UIColor*)tcolor
                 withSize:(CGFloat)size
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color;

/**

 设置是否禁用
 */
- (void)setDisabled:(BOOL)b;


/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;


@end









