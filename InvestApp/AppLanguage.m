//
//  AppLanguage.m
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "AppLanguage.h"

@implementation AppLanguage
/**
 *  根据tag获取文本
 */
+(NSString*)getLanguage:(NSInteger)type{
    
    
    switch (type) {
        case AppLanguageType_HomeNavTitle:
            return @"首页";
        case AppLanguageType_UserNavTitle:
            return @"企业中心";
        case AppLanguageType_AskNavTitle:
            return @"预约管理";
        default:
            break;
    }
    return nil;
    
}
@end
