//
//  BaseUtils.h
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "AFNetworking/AFNetworking.h"
#import "BaseModel.h"
#import "NSString+Md5.h"


static NSString *networkinngError = @"系统繁忙,请稍后尝试";

typedef void(^sudcceed)(id data);
typedef void(^failure)(NSError* error);
typedef void(^progress)(NSProgress * uploadProgress);


@interface BaseUtils : NSObject
AS_SINGLETON(BaseUtils)
@property (nonatomic, assign) BOOL isResponseHtmlType;
@property(nonatomic,strong)NSString *another_load;
@property(nonatomic,strong)NSString *notconnect;

/**
 *  请求数据
 */
- (void)requestData:(NSDictionary*)dic method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure;

/**
 上传图片
 */
- (void)requestImageDataDic:(NSDictionary*)dic WithImagedata:(NSData *)imageData AndName:(NSString*) name AndFileName:(NSString*)fileName  method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure progress:(void (^)(NSProgress * uploadProgress))progress;
/*
 上传视频
 */
- (void)requestVideoDataDic:(NSDictionary*)dic WithVideoData:(NSData *)videoData  method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure progress:(void (^)(NSProgress * uploadProgress))progress;
- (NSMutableDictionary*)getBaseParameter;

/**
 *  加载数据
 */
- (void)loadData;

/**
 *  判断string是否为整数
 *
 *  @param string <#string description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)isPureInt:(NSString*)string;
@end
