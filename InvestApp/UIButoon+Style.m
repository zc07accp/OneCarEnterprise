//
//  UIButoon+Style.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/17.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "UIButoon+Style.h"

@implementation UIButton (style)

/**
 *  获取一个新创建的button
 *
 */
+ (UIButton*)buttonWithTitle:(NSString*)title
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[AppStyleConfiguration wenbenbai] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[AppStyleConfiguration appFont:15]];
    if (imgname.length) {
        [btn setImage:[UIImage imageNamed:imgname]
             forState:UIControlStateNormal];
    }else{
        [btn setBackgroundColor:color];
    }
    
     btn.layer.cornerRadius = 5;
    
    return btn;
}

+ (UIButton*)buttonWithTitle:(NSString*)title
              withTitleColor:(UIColor*)tcolor
                    withSize:(CGFloat)size
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color{
    
    UIButton *btn  = [UIButton buttonWithTitle:title
                                 withImageName:imgname
                                   withBGColor:color];
    if (tcolor) {
        [btn setTitleColor:tcolor forState:UIControlStateNormal];
    }
    if (size) {
        [btn.titleLabel setFont:[AppStyleConfiguration appFont:size]];
    }
    
    return btn;
}


/**
 *  设置是否禁用
 *
 *  @param b <#b description#>
 */
- (void)setDisabled:(BOOL)b{
    if (NO == b) {
        self.enabled = YES;
        self.backgroundColor = [AppStyleConfiguration anniuhong];
    }else{
        self.enabled = NO;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_butten_quxiao"]];
    }
}

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
{
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case MKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case MKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
