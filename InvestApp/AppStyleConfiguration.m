//
//  AppStyleConfiguration.m
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "AppStyleConfiguration.h"



static UIColor* _anniuhong = nil;
static UIColor* _jingshi = nil;
static UIColor* _wenbenbai = nil;
static UIColor* _hei = nil;
static UIColor* _ciyaowb = nil;
static UIColor* _ziduan = nil;
static UIColor* _xiantiao = nil;
static UIColor* _beijingse = nil;
static UIColor* _tishi = nil;
static UIColor* _beijingse2 = nil;
static UIColor* _beijingse3 = nil;
static UIColor* _beijingse4 = nil;
static UIColor *_normalZong=nil;
static UIColor *_boardBack=nil;
@implementation AppStyleConfiguration

+ (void)initialize
{
    // Colors Initialization
    _anniuhong = [UIColor colorWithRed: 209/255.0 green: 184/255.0 blue: 108/255.0 alpha: 1];
    _jingshi = [UIColor colorWithRed: 1 green: 0.282 blue: 0 alpha: 1];
    _wenbenbai = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    _hei = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    _ciyaowb = [UIColor colorWithRed: 0.298 green: 0.298 blue: 0.298 alpha: 1];
    _ziduan = [UIColor colorWithRed: 0.6 green: 0.6 blue: 0.6 alpha: 1];
    _xiantiao = [UIColor colorWithRed: 0.769 green: 0.769 blue: 0.769 alpha: 1];
    _beijingse = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    _beijingse2 = [UIColor colorWithRed:0.97 green:0.97 blue:0.98 alpha:1.00];
    _tishi = [UIColor colorWithRed: 0.188 green: 0.757 blue: 0.616 alpha: 1];
    _beijingse3 = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.00];
    _beijingse4 = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.00];
    _normalZong=[UIColor colorWithRed:0.86f green:0.72f blue:0.40f alpha:1.00f];
    _boardBack=[UIColor colorWithRed:0.96f green:0.96f blue:0.97f alpha:1.00f];
}
/**
 *  页面背景色
 *
 */
+(UIColor *)ColorWithBoardBack{return _boardBack;}
/**
 *  主色--棕色
 *
 */
+(UIColor *)ColorWithNormalZong{return _normalZong;}
/**
 导航栏背景色
 */
+(UIColor *)ColorWithNavigation {return _tishi;};
/**
 按钮背景色
 */
+(UIColor*)ColorWithButtonBackgroundColor{return _anniuhong;};
+(UIColor *)ColorWithVipViewBackgroundColor{return _beijingse3;}
+ (UIColor*)anniuhong { return _anniuhong; }
+ (UIColor*)jingshi { return _jingshi; }
+ (UIColor*)wenbenbai { return _wenbenbai; }
+ (UIColor*)hei { return _hei; }
+ (UIColor*)ciyaowb { return _ciyaowb; }
+ (UIColor*)ziduan { return _ziduan; }
+ (UIColor*)xiantiao { return _xiantiao; }
+ (UIColor*)beijingse { return _beijingse; }
+ (UIColor*)beijingse2 { return _beijingse2; }
+ (UIColor*)tishi { return _tishi; }
+ (UIColor*)beijingse3 { return _beijingse3; }
+ (UIColor *)beijingse4{return _beijingse4;};
+(UIColor *)ColorWithButtonTitleColor{return _anniuhong;};

/**
 文本颜色
 */
+(UIColor*)colorWithTip:(NSString*)type{
    
    if ([type isEqualToString:@"RED"]) {
        return _anniuhong;
    }
    else if ([type isEqualToString:@"WHITE"]) {
        return [UIColor whiteColor];
    }
    else if ([type isEqualToString:@"BLUE"]) {
        return [UIColor colorWithRed:0.03 green:0.63 blue:0.82 alpha:1];
    }
    return [UIColor colorWithRed:0.03 green:0.63 blue:0.82 alpha:1];
}

/**
 *  获取app字体
 */
+(UIFont*)appNavigationLeftAndRightFontSize
{
    return [UIFont systemFontOfSize: NavigationLeftReghtFont];
}
/*
 导航栏字体大小
 */
+(UIFont*)appNAvigationTitleFontSize
{
    return [UIFont systemFontOfSize:NavigationTitleFont];
}
/*
 按钮字体大小
 */
+(UIFont*)appButtonTitleFontSize
{
    return [UIFont systemFontOfSize:ButtonTitleFont];
}
+(UIFont*)appLableTitleFontSize
{
    return [UIFont systemFontOfSize:LabelTitleFont];
}
+(UIFont*)appTextFileTitleFontSize
{
    return [UIFont systemFontOfSize:TextFileTitleFont];
}
+(UIFont*)appTextViewTitleFontSize
{
    return [UIFont systemFontOfSize:TextViewTitleFont];
}
+ (UIFont*)appFont:(NSInteger)size{
    
    return [UIFont systemFontOfSize:size];
}
@end
