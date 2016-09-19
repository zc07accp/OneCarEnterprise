//
//  BaseUtils.m
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseUtils.h"
#import "UserUtils.h"
#import "Reachability.h"
@interface BaseUtils ()
@end
@implementation BaseUtils
DEF_SINGLETON(BaseUtils)
- (id)init{
    self = [super init];
    if (self) {
        [self loadData];
        
    }
    return self;
} 
-(void)requestImageDataDic:(NSDictionary*)dic WithImagedata:(NSData *)imageData AndName:(NSString*) name AndFileName:(NSString*)fileName  method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure progress:(void (^)(NSProgress * uploadProgress))progress
{
    NSString *path = [NSString stringWithFormat:@"%@%@",REQ_BASE_URL,method];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (self.isResponseHtmlType) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }else{
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 100;
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"multipart/form-data; boundary=YY" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    //查看网络状态
    BOOL isExistenceNetwork;
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
    if ([reachability currentReachabilityStatus]==ReachableViaWiFi) {
        isExistenceNetwork = TRUE;
        [BaseUtils sharedInstance].notconnect=@"NO";
        [manager POST:path parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@""];
        } progress:^(NSProgress * uploadProgress) {
            progress(uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            BaseModel *basemodel=[BaseModel mj_objectWithKeyValues:responseObject];
            if ([basemodel.bizSucc intValue]==0) {
                if ([basemodel.errCode isEqualToString:@"FORCE_LOG_OUT"]) {
                    
                    [BaseUtils sharedInstance].another_load=@"YES";
                    
                }else{
                    [BaseUtils sharedInstance].another_load=@"NO";
                }
            }
            
            succeed(responseObject);
            NSLog(@" \nmethod:\n%@ \n\n parameters:\n %@  \n\nresponse: \n%@\n",method,dic,responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure ( error );
            NSLog(@"%@",error);
        }];
        
    }else if ([reachability currentReachabilityStatus]==ReachableViaWWAN){
        isExistenceNetwork = TRUE;
        [BaseUtils sharedInstance].notconnect=@"NO";
        [manager POST:path parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            //[formData appendPartWithFormData:imageData name:@"firmAtt"];
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@""];
            //[formData appendPartWithFileURL:[NSURL fileURLWithPath:imageData] name:@"file" error:nil];
            
        } progress:^(NSProgress * uploadProgress)
         {
             progress(uploadProgress);
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             BaseModel *basemodel=[BaseModel mj_objectWithKeyValues:responseObject];
             if ([basemodel.bizSucc intValue]==0) {
                 if ([basemodel.errCode isEqualToString:@"FORCE_LOG_OUT"]) {
                     
                     [BaseUtils sharedInstance].another_load=@"YES";
                     
                 }else{
                     [BaseUtils sharedInstance].another_load=@"NO";
                 }
             }
             
             succeed(responseObject);
             NSLog(@" \nmethod:\n%@ \n\n parameters:\n %@  \n\nresponse: \n%@\n",method,dic,responseObject);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             failure ( error );
             NSLog(@"%@",error);
         }];
        
    }else if ([reachability currentReachabilityStatus]== NotReachable){
        isExistenceNetwork = FALSE;
        [BaseUtils sharedInstance].notconnect=@"YES";
        [SVProgressHUD showErrorWithStatus:@"当前网络不可用，请检查您的网络设置"];
    }
}
/**
 *  加载数据
 */
- (void)loadData
{
    
}

-(void)requestVideoDataDic:(NSDictionary*)dic WithVideoData:(NSData *)videoData  method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure progress:(void (^)(NSProgress * uploadProgress))progress
{
    
    
    NSString *path = [NSString stringWithFormat:@"%@%@",REQ_BASE_URL,method];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (self.isResponseHtmlType) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }else{
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 100;
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"multipart/form-data; boundary=YY" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    //查看网络状态
    BOOL isExistenceNetwork;
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
    if ([reachability currentReachabilityStatus]==ReachableViaWiFi) {
        isExistenceNetwork = TRUE;
        [BaseUtils sharedInstance].notconnect=@"NO";
        [manager POST:path parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            //[formData appendPartWithFormData:imageData name:@"firmAtt"];
            [formData appendPartWithFileData:videoData name:@"userVideo"fileName:@"videoReadyToUpload.mp4"mimeType:@"video/mp4"];
            //[formData appendPartWithFileURL:[NSURL fileURLWithPath:videoPath] name:@"file" error:nil];
            
        } progress:^(NSProgress * uploadProgress)
         {
             progress(uploadProgress);
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             BaseModel *basemodel=[BaseModel mj_objectWithKeyValues:responseObject];
             if ([basemodel.bizSucc intValue]==0) {
                 if ([basemodel.errCode isEqualToString:@"FORCE_LOG_OUT"]) {
                     
                     [BaseUtils sharedInstance].another_load=@"YES";
                     
                 }else{
                     [BaseUtils sharedInstance].another_load=@"NO";
                 }
             }
             
             succeed(responseObject);
             NSLog(@" \nmethod:\n%@ \n\n parameters:\n %@  \n\nresponse: \n%@\n",method,dic,responseObject);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             failure ( error );
             NSLog(@"%@",error);
         }];
        
    }else if ([reachability currentReachabilityStatus]==ReachableViaWWAN)
    {
        isExistenceNetwork = TRUE;
        [BaseUtils sharedInstance].notconnect=@"NO";
        [manager POST:path parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
        {
            [formData appendPartWithFileData:videoData name:@"userVideo"fileName:@"videoReadyToUpload.mp4"mimeType:@"video/mp4"];
        } progress:^(NSProgress * uploadProgress)
         {
             progress(uploadProgress);
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             BaseModel *basemodel=[BaseModel mj_objectWithKeyValues:responseObject];
             if ([basemodel.bizSucc intValue]==0) {
                 if ([basemodel.errCode isEqualToString:@"FORCE_LOG_OUT"]) {
                     
                     [BaseUtils sharedInstance].another_load=@"YES";
                     
                 }else{
                     [BaseUtils sharedInstance].another_load=@"NO";
                 }
             }
             
             succeed(responseObject);
             NSLog(@" \nmethod:\n%@ \n\n parameters:\n %@  \n\nresponse: \n%@\n",method,dic,responseObject);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             failure ( error );
             NSLog(@"%@",error);
         }];
        
    }else if ([reachability currentReachabilityStatus]== NotReachable){
        isExistenceNetwork = FALSE;
        [BaseUtils sharedInstance].notconnect=@"YES";
        [SVProgressHUD showErrorWithStatus:@"当前网络不可用，请检查您的网络设置"];
    }
}
- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}


/**
 *  请求数据
 */
- (void)requestData:(NSDictionary*)dic method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure{
    
    [SVProgressHUD setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setErrorImage:[UIImage imageNamed:@"icon_touxiang"]];
    NSString *path = [NSString stringWithFormat:@"%@%@",REQ_BASE_URL,method];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    if (self.isResponseHtmlType) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }else{
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
     //查看网络状态
    BOOL isExistenceNetwork;
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
    if ([reachability currentReachabilityStatus]==ReachableViaWiFi) {
        isExistenceNetwork = TRUE;
        [BaseUtils sharedInstance].notconnect=@"NO";
        [manager POST:path parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            BaseModel *basemodel=[BaseModel mj_objectWithKeyValues:responseObject];
            if ([basemodel.bizSucc intValue]==0) {
                if ([basemodel.errCode isEqualToString:@"FORCE_LOG_OUT"]) {
                    
                    [BaseUtils sharedInstance].another_load=@"YES";
                    
                }else{
                    [BaseUtils sharedInstance].another_load=@"NO";
                }
            }
            succeed ( responseObject );
            NSLog(@" \nmethod:\n%@ \n\n parameters:\n %@  \n\nresponse: \n%@\n",method,dic,responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure ( error );
            NSLog(@"%@",error);
            
        }];

    }else if ([reachability currentReachabilityStatus]==ReachableViaWWAN){
        isExistenceNetwork = TRUE;
        [BaseUtils sharedInstance].notconnect=@"NO";
        [manager POST:path parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            BaseModel *basemodel=[BaseModel mj_objectWithKeyValues:responseObject];
            if ([basemodel.bizSucc intValue]==0) {
                if ([basemodel.errCode isEqualToString:@"FORCE_LOG_OUT"]) {
                    
                    [BaseUtils sharedInstance].another_load=@"YES";
                    
                }else{
                    [BaseUtils sharedInstance].another_load=@"NO";
                }
            }
            succeed ( responseObject );
            NSLog(@" \nmethod:\n%@ \n\n parameters:\n %@  \n\nresponse: \n%@\n",method,dic,responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure ( error );
        }];

    }else if ([reachability currentReachabilityStatus]== NotReachable){
        isExistenceNetwork = FALSE;
        [BaseUtils sharedInstance].notconnect=@"YES";
        [manager POST:@"" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure ( error );
            [SVProgressHUD showErrorWithStatus:@"当前网络不可用，请检查您的网络设置"];
        }];
    }
}
/**
 *  获取基础的参数字典
 */
- (NSMutableDictionary*)getBaseParameter{

    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    NSString *timeNow = [NSString stringWithFormat:@"%llu",recordTime];
    
    [parameter setValue:@"" forKey:@"sign"];
    [parameter setValue:@"IOS" forKey:@"appType"];
    [parameter setValue:kAppVersion forKey:@"version"];
    [parameter setValue:[NSString idfaString] forKey:@"token"];
    [parameter setValue: @"YOUMI_PLATFORM" forKey:@"platformCode"];
    [parameter setValue: [timeNow md5] forKey:@"sign"];
    [parameter setValue: timeNow forKey:@"stime"];
    if ([UserUtils online])
    {
        [parameter setValue:[UserUtils userId] forKey:@"userId"];
    }
    
    return parameter;
}

@end
