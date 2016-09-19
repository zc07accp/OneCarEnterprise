//  MyControl.h
//  LoL
//
//  Created by LoL on 15/4/12.
//  Copyright (c) 2015年 _LoL_. All rights reserved.

#import "MyControl.h"
#import "UIButoon+Style.h"

@implementation MyControl
+(UIButton *)buttonAndTel

{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:[NSString stringWithFormat:@"客服热线  %@",TEL] forState:UIControlStateNormal];
    
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    button.backgroundColor=[UIColor clearColor];
    
    button.titleLabel.font=[UIFont systemFontOfSize:13];
    
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:@"icon_kefu_banli"] forState:UIControlStateNormal];
    
    
    [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:2.0];
    button.layer.masksToBounds=YES;
    return button;
}
#pragma mark 创建View
+(UIView*)createViewWithFrame:(CGRect)frame Color:(UIColor *)color
{
    UIView*view=[[UIView alloc]initWithFrame:frame];
    view.backgroundColor=color;
    return view;
    
}
#pragma mark 创建label
+(UILabel*)createLabelWithFrame:(CGRect)frame Font:(float)font Text:(NSString*)text Color:(UIColor *)color
{
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    //设置字体
    label.font=[UIFont systemFontOfSize:font];
    //设置折行方式 NSLineBreakByWordWrapping是按照单词折行
    label.lineBreakMode=NSLineBreakByWordWrapping;
    //折行限制 0时候是不限制行数
    label.numberOfLines=0;
    //对齐方式
    label.textAlignment=NSTextAlignmentLeft;
    //设置背景颜色
    label.backgroundColor=[UIColor clearColor];
    //设置文字
    label.text=text;
    //自适应
    //label.adjustsFontSizeToFitWidth=YES;
    label.textColor=color;
    return label;
}
#pragma mark 创建button
+(UIButton*)createButtonWithFrame:(CGRect)frame target:(id)target SEL:(SEL)method title:(NSString*)title Color:(UIColor *)color Font:(float )font TittleColor:(UIColor *)titleColor img:(NSString *)imgName BGImg:(NSString *)bgimgName
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.backgroundColor=color;
    button.titleLabel.font=[UIFont systemFontOfSize:font];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.frame=frame;
    [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:bgimgName] forState:UIControlStateNormal];
    
    [button addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
#pragma mark 创建imageView
+(UIImageView*)createImageViewFrame:(CGRect)frame imageName:(NSString*)imageName{
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:imageName];
    //用户交互
    imageView.userInteractionEnabled=YES;
    return imageView;
}

#pragma mark 创建textView
+(UITextView *)creatTextViewFrame:(CGRect)frame Font:(float)font textColor:(UIColor *)color text:(NSString *)text;
{
    UITextView *textView=[[UITextView alloc]initWithFrame:frame];
    textView.text=text;
    textView.font=[UIFont systemFontOfSize:font];
    textView.textColor=color;
    return textView;
}

#pragma mark 创建textField
+(UITextField*)createTextFieldFrame:(CGRect)frame Font:(float)font textColor:(UIColor*)color leftImageName:(NSString*)leftImageName rightImageName:(NSString*)rightImageName bgImageName:(NSString*)bgImageName
{
    UITextField*textField=[[UITextField alloc]initWithFrame:frame];
    textField.font=[UIFont systemFontOfSize:font];
    textField.textColor=color;
    //左边的图片
    UIImage*image=[UIImage imageNamed:leftImageName];
    UIImageView*letfImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    textField.leftView=letfImageView;
    textField.leftViewMode=UITextFieldViewModeAlways;
    //右边的图片
    UIImage*rightImage=[UIImage imageNamed:rightImageName];
    UIImageView*rightImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, rightImage.size.width, rightImage.size.height)];
    textField.rightView=rightImageView;
    textField.rightViewMode=UITextFieldViewModeAlways;
    //清除按钮
    textField.clearButtonMode=YES;
    
    //当再次编辑时候清除
    //textField.clearsOnBeginEditing=YES;
    
    
//    //密码遮掩
//    textField.secureTextEntry
//    //提示框
//    textField.placeholder
    return textField;

}
//适配器 为了适配以前的版本，和现有已经开发的所有功能模块，在原有功能模块基础上进行扩展的方式
+(UITextField*)createTextFieldFrame:(CGRect)frame Font:(float)font textColor:(UIColor*)color leftImageName:(NSString*)leftImageName rightImageName:(NSString*)rightImageName bgImageName:(NSString*)bgImageName placeHolder:(NSString*)placeHolder sucureTextEntry:(BOOL)isOpen
{
   UITextField*textField= [MyControl createTextFieldFrame:frame Font:font textColor:color leftImageName:leftImageName rightImageName:rightImageName bgImageName:bgImageName];
    //适配器扩展出来的方法
    textField.placeholder=placeHolder;
    textField.secureTextEntry=isOpen;
    return textField;
}


//NSUserDefaults
+(void)setObject:(id)object key:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(id)getObjectForKey:(NSString *)key
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:key]) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    }else{
        return NULL;
    }
}


+(void)removeObjectForKey:(NSString *)key{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:key]) {
        return [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
}


//转utf-8
+(NSString *)setEncoding:(NSString *)str{
    
    NSString *encodedValue = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return encodedValue;
}



//null转化
+(NSDictionary *)nullDic:(NSDictionary *)myDic
{
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++)
    {
        id obj = [myDic objectForKey:keyArr[i]];
        
        obj = [self changeType:obj];
        
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}
+(id)changeType:(id)myObj
{
    if ([myObj isKindOfClass:[NSDictionary class]])
    {
        return [self nullDic:myObj];
    }
    else if([myObj isKindOfClass:[NSArray class]])
    {
        return [self nullArr:myObj];
    }
    else if([myObj isKindOfClass:[NSString class]])
    {
        return [self stringToString:myObj];
    }
    else if([myObj isKindOfClass:[NSNull class]])
    {
        return [self nullToString];
    }
    else
    {
        return myObj;
    }
}
+(NSArray *)nullArr:(NSArray *)myArr
{
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++)
    {
        id obj = myArr[i];
        
        obj = [self changeType:obj];
        
        [resArr addObject:obj];
    }
    return resArr;
}
+(NSString *)stringToString:(NSString *)string
{
    return string;
}
+(NSString *)nullToString
{
    return @"";
}

/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

+(void)vc:(id)vc
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"确定要拨打%@?",TEL] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",TEL]]];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
}
@end
