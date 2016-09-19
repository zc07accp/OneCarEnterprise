//
//  NSString+Phone.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/23.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "NSString+Phone.h"

@implementation NSString (phone)

/**
 *  返回加星的手机号码
 */
- (NSString*)phoneHidden{
    
    NSString *phone = self;
    NSString *prefix = [phone substringToIndex:3];
    NSString *suffix = [phone substringFromIndex:7];
    phone = [NSString stringWithFormat:@"%@****%@",prefix,suffix];
    return phone;
}

@end
