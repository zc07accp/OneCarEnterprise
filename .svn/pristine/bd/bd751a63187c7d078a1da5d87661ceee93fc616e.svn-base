//
//  NSString+rate.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/28.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "NSString+rate.h"

@implementation NSString (rate)

/**
 *  去掉百分号
 *
 *  @return <#return value description#>
 */
- (NSString*)removeRate{
    
    NSString *string = self;
    if ([string hasSuffix:@"%"]) {
        string = [string substringToIndex:string.length-1];
    }
    return string;
}

@end