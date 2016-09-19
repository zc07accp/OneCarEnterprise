//
//  AppLanguage.h
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import <Foundation/Foundation.h>




typedef NS_ENUM(NSUInteger, AppLanguageType)
{
    AppLanguageType_HomeNavTitle,
    AppLanguageType_AskNavTitle,
    AppLanguageType_UserNavTitle
};




@interface AppLanguage : NSObject

/**
 *  根据type获取文本
 */
+(NSString*)getLanguage:(NSInteger)type;

@end
