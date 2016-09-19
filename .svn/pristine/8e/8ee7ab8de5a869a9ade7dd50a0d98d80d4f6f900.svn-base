//
//  HomeUtils.m
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "HomeUtils.h"

@implementation HomeUtils

-(void)loadData
{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:KHomeInvestBanaCache];
    self.banners = [BannerListModel mj_objectWithKeyValues:dic];
    self.banners.listObject = [BannerModel mj_objectArrayWithKeyValuesArray:[dic objectForKey:@"listObject"]];
    NSDictionary *dicD = [[NSUserDefaults standardUserDefaults] objectForKey:KHomeStageDataCache];
    self.homeData = [HomeModel mj_objectWithKeyValues:dicD];
   
}

/**
 *  更新banner图
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateBannerData:(sudcceed)succeed failure:(failure)failure{
    
    NSDictionary *dic = [self getBaseParameter];
    [self requestData:dic method:@"/front/banner.do" succeed:^(id response) {
        
        self.banners = [BannerListModel mj_objectWithKeyValues:response];
        self.banners.listObject = [BannerModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"listObject"]];
        if (self.banners.bizSucc.integerValue == 1) {
            succeed(self.banners);
            NSDictionary *savedata = [self.banners mj_keyValues];
            
            [[NSUserDefaults standardUserDefaults] setObject:savedata forKey:KHomeInvestBanaCache];
            
            [[NSUserDefaults standardUserDefaults] synchronize];

        }else{
            [SVProgressHUD showErrorWithStatus:self.homeData.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}



/**
 *  更新首页数据
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateHomeData:(sudcceed)succeed failure:(failure)failure{
    
    NSDictionary *dic = [self getBaseParameter];
   [self requestData:dic method:@"/front/prodRecommend.do" succeed:^(id response) {
       
       self.homeData = [HomeModel mj_objectWithKeyValues:response];
       if (self.homeData.bizSucc.integerValue == 1) {
           if ([self.homeData.percent hasSuffix:@"%"]) {
               self.homeData.percent = [self.homeData.percent substringToIndex:self.homeData.percent.length-1];
           }
           succeed(self.homeData);
           NSDictionary *savedata = [self.homeData mj_keyValues];
           
           [[NSUserDefaults standardUserDefaults] setObject:savedata forKey:KHomeStageDataCache];
           
           [[NSUserDefaults standardUserDefaults] synchronize];
           
       }else{
           [SVProgressHUD showErrorWithStatus:self.homeData.errMsg];
           failure(nil);
       }
       
   } failure:^(NSError *error) {
       [SVProgressHUD showErrorWithStatus:networkinngError];
       failure(nil);
   }];
}


@end
