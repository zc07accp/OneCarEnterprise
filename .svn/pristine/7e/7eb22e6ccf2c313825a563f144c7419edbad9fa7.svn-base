//
//  HomeStageUtils.m
//  InvestApp
//
//  Created by 汝长志 on 16/4/13.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "HomeStageUtils.h"

@implementation HomeStageUtils
-(void)loadData
{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:KHomeStageCache];
    self.homeStageData = [HomeStageModel mj_objectWithKeyValues:dic];
    self.homeStageData.repaymentCategorysList=[RepaymentCategorysList mj_objectArrayWithKeyValuesArray:[dic objectForKey:@"repaymentCategorysList"]];
}
- (void)updateHomeData:(sudcceed)succeed failure:(failure)failure{
    
    NSDictionary *dic = [self getBaseParameter];
    [self requestData:dic method:@"/front/queryRepaymentCategory.do" succeed:^(id response) {
        NSLog(@"response:%@",response);
        self.homeStageData = [HomeStageModel mj_objectWithKeyValues:response];
        self.homeStageData.repaymentCategorysList = [RepaymentCategorysList mj_objectArrayWithKeyValuesArray:[response objectForKey:@"repaymentCategorysList"]];
        if (self.homeStageData.bizSucc.integerValue == 1) {
            
            succeed(self.homeStageData);
            NSDictionary *savedata = [self.homeStageData mj_keyValues];
            
            [[NSUserDefaults standardUserDefaults] setObject:savedata forKey:KHomeStageCache];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            [SVProgressHUD showErrorWithStatus:self.homeStageData.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

@end
