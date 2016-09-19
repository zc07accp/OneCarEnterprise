
//  MyControl.h
//  LoL
//
//  Created by LoL on 15/4/12.
//  Copyright (c) 2015年 _LoL_. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface MyControl : NSObject
/**
 打电话的Button
 */
+(UIButton*)buttonAndTel;
#pragma mark 创建View
+(UIView*)createViewWithFrame:(CGRect)frame Color:(UIColor *)color;
#pragma mark 创建label
+(UILabel*)createLabelWithFrame:(CGRect)frame Font:(float)font Text:(NSString*)text Color:(UIColor *)color;
#pragma mark 创建button
+(UIButton*)createButtonWithFrame:(CGRect)frame target:(id)target SEL:(SEL)method title:(NSString*)title Color:(UIColor *)color Font:(float )font TittleColor:(UIColor *)titleColor img:(NSString*)imgName BGImg:(NSString*)bgimgName;
#pragma mark 创建imageView
+(UIImageView*)createImageViewFrame:(CGRect)frame imageName:(NSString*)imageName;
#pragma mark 创建textView
+(UITextView *)creatTextViewFrame:(CGRect)frame Font:(float)font textColor:(UIColor *)color text:(NSString *)text;
#pragma mark 创建textField
+(UITextField*)createTextFieldFrame:(CGRect)frame Font:(float)font textColor:(UIColor*)color leftImageName:(NSString*)leftImageName rightImageName:(NSString*)rightImageName bgImageName:(NSString*)bgImageName placeHolder:(NSString*)placeHolder sucureTextEntry:(BOOL)isOpen;

//添加NSUserDefaults
+(void)setObject:(id)object key:(NSString *)key;
//获取NSUserDefaults
+(id)getObjectForKey:(NSString *)key;
//移除NSUserDefaults
+(void)removeObjectForKey:(NSString *)key;

//转码
+(NSString *)setEncoding:(NSString *)str;


//null转化
+(NSDictionary *)nullDic:(NSDictionary *)myDic;

+(id)changeType:(id)myObj;

+(NSArray *)nullArr:(NSArray *)myArr;

+(NSString *)stringToString:(NSString *)string;

+(NSString *)nullToString;

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+(void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

+(void)vc:(id)vc;
@end
