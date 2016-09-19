//
//  ZFTool.h
//  InvestApp
//
//  Created by zf on 2016/9/13.
//  Copyright © 2016年 Puyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFTool : NSObject


+ (NSString *)jsonPrettyStringWithDicEncoded:(NSDictionary *)dictionary;
/*
 数组转为json
 */
+ (NSString *)jsonPrettyStringWithArrayEncoded:(NSArray *)array;
/*
 画虚线
 */
+ (UIView *)createDashedLineWithFrame:(CGRect)lineFrame
                           lineLength:(int)length
                          lineSpacing:(int)spacing
                            lineColor:(UIColor *)color;
+ (BOOL)isAllNum:(NSString *)string;
+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2;
+ (BOOL)isHaveChineseInString:(NSString *)string;
+(UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;
+ (NSString *)getIPAddress;
+ (BOOL)isHaveSpaceInString:(NSString *)string;
+ (UIImage *)shotWithView:(UIView *)view scope:(CGRect)scope;
+ (UIImage *)shotWithView:(UIView *)view;
+ (UIImage *)shotScreen;
+ (BOOL)isAvailableEmail:(NSString *)email;
+ (BOOL)valiMobile:(NSString *)mobile;
+ (NSString *)timeIntervalFromLastTime:(NSString *)lastTime
                        lastTimeFormat:(NSString *)format1
                         ToCurrentTime:(NSString *)currentTime
                     currentTimeFormat:(NSString *)format2;
+ (long long)folderSizeAtPath:(NSString *)folderPath;
+ (long long)fileSizeAtPath:(NSString *)filePath;

@end
