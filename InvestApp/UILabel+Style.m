//
//  UILabel+Style.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/17.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "UILabel+Style.h"

@implementation UILabel (style)
/**
 *  获取一个新创建的label
 */

+ (UILabel*)labelWithSize:(NSInteger)size
                withColor:(UIColor*)color
                 withText:(NSString*)text
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [AppStyleConfiguration appFont:size];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    label.text = text;
    return label;
}
@end
