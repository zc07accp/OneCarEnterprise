//
//  UserUtils.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/15.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "UserUtils.h"
#import "UserModel.h"
#import "ZFdes.h"
#define kUserInfo @"kUserInfo"
#define kUserPhone @"kUserPhone"
#define KUserOldPhone @"kUserOldPhone"
#define kUserIndexCache @"kUserIndexCache"
#define kUserCenterCache @"kUserCenterCache"
#define kUserPhonePassword @"kUserPhonePassword"

@implementation UserUtils
DEF_SINGLETON(UserUtils)

/**
 *  检查是否已经登录
 *
 *  @return return value description
 */
+(BOOL)online{
    if ([UserUtils userId].length) {
        return YES;
    }
    return NO;
}

/**
 *  登出
 */
+(void)offline{
    [UserUtils sharedInstance].userInfo = nil;
    [UserUtils sharedInstance].uCenterData = nil;
    [UserUtils sharedInstance].indexData = nil;
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:kUserInfo];
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:kUserIndexCache];
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:kUserCenterCache];
    [UserUtils sharedInstance].userDidLoginOut = @"YES";
}
/**
 *  返回
 */
+(void)backToMe{
    [UserUtils sharedInstance].backToMe = @"YES";
}

/**
 *  返回列表
 */
+(void)backToList{
    [UserUtils sharedInstance].backToList = @"YES";
}
/**
 *  返回登陆
 */
+(void)backToLoad{
    [UserUtils sharedInstance].backToLoad = @"YES";
}
/**
 *  返回列表F
 */
+(void)backToListF{
    [UserUtils sharedInstance].backToListF = @"YES";
}

/**
 *  获取userid
 *
 *  @return return value description
 */
+(NSString*)userId{
    
    return [UserUtils sharedInstance].userInfo.userId;
}


/**
 *  保存用户数据
 *
 *  @param data data description
 */
+ (void)saveUserInfo:(id)data{
    
    [UserUtils sharedInstance].userInfo = [UserModel mj_objectWithKeyValues:data];
    if ([UserUtils sharedInstance].userInfo.userId.length
        && ![[UserUtils sharedInstance].userInfo.userId isEqualToString:@"<null>"]) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setValue:[UserUtils sharedInstance].userInfo.userId forKey:@"userId"];
        [[NSUserDefaults standardUserDefaults] setObject:dic forKey:kUserInfo];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (void)saveUserPhone:(NSString*)phone
{
    [[NSUserDefaults standardUserDefaults] setObject:phone forKey:kUserPhone];
    [[NSUserDefaults standardUserDefaults] setObject:phone forKey:KUserOldPhone];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (void)saveUserPhonePassword:(NSString*)phone{
    [[NSUserDefaults standardUserDefaults] setObject:phone forKey:kUserPhonePassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *  获取上次登录的手机
 *
 *  @return <#return value description#>
 */
+(NSString*)getOldPhone{
    return [[NSUserDefaults standardUserDefaults] objectForKey:KUserOldPhone];
}
+(NSString*)getOldPhonePassword{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kUserPhonePassword];
}



#pragma mark - 
/**
 *  加载缓存数据
 */
- (void)loadData{
    
    
    /**
     *  加载用户信息
     */
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:kUserInfo];
    self.userInfo = [UserModel mj_objectWithKeyValues:dic];
    /**
     *  加载首页数据
     */
    NSDictionary *dic_userIndex = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIndexCache];
    self.indexData = [UserIndex mj_objectWithKeyValues:dic_userIndex];
    
}


/**
 *  更新用户数据
 */
- (void)updateUserIndex:(sudcceed)succeed failure:(failure)failure;{
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.userInfo.userId forKey:@"userId"];
    [self requestData:dic method:@"/front/accountIndex.do" succeed:^(id response) {
        self.indexData = [UserIndex mj_objectWithKeyValues:response];
        if (self.indexData.bizSucc.integerValue == 1) {
            succeed(self.indexData);
            NSDictionary *savedata = [self.indexData mj_keyValues];
            [[NSUserDefaults standardUserDefaults] setObject:savedata forKey:kUserIndexCache];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            [SVProgressHUD showErrorWithStatus:self.indexData.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];

}

/**
 *  设置登录密码
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)setPassword:(sudcceed)succeed failure:(failure)failure
{
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:[ZFdes encrypt:self.nPassword] forKey:@"passwd"];
    [dic setValue:[ZFdes encrypt:self.nCPassword] forKey:@"repasswd"];
    [dic setValue:self.reqType forKey:@"reqType"];
    [self requestData:dic method:@"/front/loginPwdSet.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        if (model.bizSucc.integerValue == 1) {
            [SVProgressHUD showSuccessWithStatus:@"登录密码设置成功"];
            [[NSUserDefaults standardUserDefaults] setObject:self.nCPassword forKey:kUserPhonePassword];
            [[NSUserDefaults standardUserDefaults] synchronize];
            succeed(model);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
    
    
}


/**
 *  修改登录密码
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)reSetPassword:(sudcceed)succeed failure:(failure)failure{
    
    
//    if(self.nPassword.length < 6 || self.nPassword.length >18){
//        [SVProgressHUD showErrorWithStatus:@"密码长度不正确"];
//        return;
//    }
//    
//    if(NO == [self.nPassword isEqualToString:self.nCPassword]){
//        [SVProgressHUD showErrorWithStatus:@"密码不一致"];
//        return;
//    }
    
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:[ZFdes encrypt:self.nPassword] forKey:@"passwd"];
    [dic setValue:[ZFdes encrypt:self.nCPassword] forKey:@"repasswd"];
    [dic setValue:self.code_cell forKey:@"cell"];
    [dic setValue:self.reqType forKey:@"reqType"];
    [self requestData:dic method:@"/front/loginPwdSet.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        if (model.bizSucc.integerValue == 1) {
            [SVProgressHUD showSuccessWithStatus:@"登录密码修改成功"];
            succeed(model);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
    
}







/**
 *  更新用户中心数据
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateUserCenter:(sudcceed)succeed failure:(failure)failure{
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [self requestData:dic method:@"/front/accountCenter.do" succeed:^(id response) {
        self.uCenterData = [UserCenterModel mj_objectWithKeyValues:response];
        if (self.uCenterData.bizSucc.integerValue == 1) {
            succeed(self.uCenterData);
            NSLog(@"手机号:%@",self.uCenterData.cell);
            NSDictionary *savedata = [self.uCenterData mj_keyValues];
            [[NSUserDefaults standardUserDefaults] setObject:savedata forKey:kUserCenterCache];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            [SVProgressHUD showErrorWithStatus:self.uCenterData.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}








/**
 *  实名认证
 */
- (void)userAutonym:(sudcceed)succeed failure:(failure)failure;{
    
    if(self.autonym_id.length<1 || self.autonym_name.length<1){
        [SVProgressHUD showErrorWithStatus:@"请输入完整信息"];
        return;
    }
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.autonym_id forKey:@"certNo"];
    [dic setValue:self.autonym_name forKey:@"name"];
    [self requestData:dic method:@"/front/realNameIdentify.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        if (model.bizSucc.integerValue == 1) {
            [SVProgressHUD showSuccessWithStatus:@"实名认证信息已经提交"];
            succeed(model);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
    
    
}


/**
 *
 */
- (void)setPayPassword:(sudcceed)succeed failure:(failure)failure{
    
    
//    if(self.payPassword.length < 6 || self.rePayPassword.length >18){
//        [SVProgressHUD showErrorWithStatus:@"密码长度不正确"];
//        return;
//    }
//    
//    if(NO == [self.payPassword isEqualToString:self.rePayPassword]){
//        [SVProgressHUD showErrorWithStatus:@"密码不一致"];
//        return;
//    }
    
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:[ZFdes encrypt:self.payPassword] forKey:@"passwd"];
    [dic setValue:[ZFdes encrypt:self.rePayPassword] forKey:@"rePasswd"];
    [dic setValue:self.reqType forKey:@"reqType"];
    [self requestData:dic method:@"/front/payPwdSet.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        if (model.bizSucc.integerValue == 1) {
            [SVProgressHUD showSuccessWithStatus:@"交易密码设置成功"];
            succeed(model);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}


- (void)reSetPayPassword:(sudcceed)succeed failure:(failure)failure{
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:[ZFdes encrypt:self.payPassword] forKey:@"passwd"];
    [dic setValue:[ZFdes encrypt:self.rePayPassword] forKey:@"rePasswd"];
    
    [dic setValue:self.reqType forKey:@"reqType"];
    [self requestData:dic method:@"/front/payPwdSet.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        if (model.bizSucc.integerValue == 1) {
            [SVProgressHUD showSuccessWithStatus:@"交易密码修改成功"];
            succeed(model);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}



/**
 *  更新账户余额页面
 *
 *  @param succeed succeed description
 *  @param failure failure description
 */
- (void)updateBalancePage:(sudcceed)succeed failure:(failure)failure{
    
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.srType forKey:@"type"];
    [dic setValue:@"1" forKey:@"pageNum"];
    [self requestData:dic method:@"/front/balanceTransPage.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        self.balancePageData = [UserBalancePageModel mj_objectWithKeyValues:response];
        self.balancePageData.datas = [UBPCellModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"datas"]];
        if (model.bizSucc.integerValue == 1) {
            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}
- (void)nextBalancePage:(sudcceed)succeed failure:(failure)failure{
    
//    if (self.balancePageData.next.integerValue != 1) {
//        [SVProgressHUD showErrorWithStatus:@"没有更多了"];
//        return;
//    }
    
    self.isResponseHtmlType = NO;
    NSInteger pnum = self.balancePageData.pageNum.integerValue+1;
    NSString *newpnum = [NSString stringWithFormat:@"%ld",(long)pnum];
    self.balancePageData.pageNum = newpnum;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.srType forKey:@"type"];
    [dic setValue:newpnum forKey:@"pageNum"];
    [self requestData:dic method:@"/front/balanceTransPage.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        self.balancePageData.next = [response objectForKey:@"next"];
        if (model.bizSucc.integerValue == 1) {
            NSArray *newdata = [UBPCellModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"datas"]];
            [self.balancePageData.datas addObjectsFromArray:newdata];
            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

/**
 *  更新用户收益数据NHGraphCoder
 */
- (void)updateUserIncomeList:(sudcceed)succeed failure:(failure)failure{
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:@"1" forKey:@"pageNum"];
    [self requestData:dic method:@"/front/queryUserProfitPerDay.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        self.uIncomeData = [UserInComeModel mj_objectWithKeyValues:response];
        self.uIncomeData.listObject = [UserInComeCellModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"listObject"]];
        if (model.bizSucc.integerValue == 1) {
            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}




- (void)nextUserIncomeList:(sudcceed)succeed failure:(failure)failure{
        
    self.isResponseHtmlType = NO;
    NSInteger pnum = self.uIncomeData.pageNum.integerValue+1;
    NSString *newpnum = [NSString stringWithFormat:@"%ld",(long)pnum];
    self.uIncomeData.pageNum = newpnum;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:newpnum forKey:@"pageNum"];
    [self requestData:dic method:@"/front/queryUserProfitPerDay.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        self.uIncomeData.next = [response objectForKey:@"next"];
        if (model.bizSucc.integerValue == 1) {
            NSArray *newdata = [UserInComeCellModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"listObject"]];
            [self.uIncomeData.listObject addObjectsFromArray:newdata];
            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}













/**
 *  更新用户资产数据
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateUserAsset:(sudcceed)succeed failure:(failure)failure{
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [self requestData:dic method:@"/front/holdAssetTypeQuery.do" succeed:^(id response) {
        
        self.assetData = [UserAssetModel mj_objectWithKeyValues:response];
        self.assetData.listObject = [UAssetCellModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"listObject"]];
        if (self.assetData.bizSucc.integerValue == 1) {

            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:self.assetData.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}



/**
 *  已回款列表
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateRefundedList:(sudcceed)succeed failure:(failure)failure{
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:@"100" forKey:@"pageSize"];
    [dic setValue:@"1" forKey:@"pageNum"];
    [self requestData:dic method:@"/front/investRepaidQuery.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        self.refundedData = [UserAssetModel mj_objectWithKeyValues:response];
        self.refundedData.listObject = [UAssetCellModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"listObject"]];
        if (model.bizSucc.integerValue == 1) {
            
            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}
- (void)nextRefundedList:(sudcceed)succeed failure:(failure)failure{
    if (self.refundedData.next.integerValue != 1) {
        [SVProgressHUD showErrorWithStatus:@"没有更多了"];
        return;
    }
    
    self.isResponseHtmlType = NO;
    NSInteger pnum = self.refundedData.pageNum.integerValue+1;
    NSString *newpnum = [NSString stringWithFormat:@"%ld",(long)pnum];
    self.refundedData.pageNum = newpnum;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:@"10" forKey:@"pageSize"];
    [dic setValue:newpnum forKey:@"pageNum"];
    [self requestData:dic method:@"/front/investRepaidQuery.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        self.refundedData.next = [response objectForKey:@"next"];
        if (model.bizSucc.integerValue == 1) {
            NSArray *newdata = [UAssetCellModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"listObject"]];
            NSMutableArray *arr = [NSMutableArray arrayWithArray:self.refundedData.listObject];
            [arr addObjectsFromArray:newdata];
            [self.refundedData setListObject:arr];
            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];

}


/**
 *  回款计划
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateRefundedPlan:(sudcceed)succeed failure:(failure)failure{
    

    self.isResponseHtmlType = YES;
    NSDictionary *dic = [self getBaseParameter];
    //回款计划
    [dic setValue:self.prodCode forKey:@"prodCode"];
    [dic setValue:self.investNo forKey:@"investNo"];
    [self requestData:dic method:@"/front/queryOrdFundRepayInvest.do" succeed:^(id response) {
        NSLog(@"发的设计开发好吧:%@",response);
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *content = [[NSString alloc] initWithData:response encoding:gbkEncoding];
        succeed(content);
    } failure:^(NSError *error) {
        self.isResponseHtmlType = NO;
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}


/**
 *  回款合同
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateRefundContract:(sudcceed)succeed failure:(failure)failure{
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.fundCode forKey:@"prodcode"];
    [dic setValue:self.investNo forKey:@"investno"];
    [self requestData:dic method:@"/front/contract.do" succeed:^(id response) {
        self.userSeeHTModel=[UserSeeHTModel mj_objectWithKeyValues:response];
        self.userSeeHTModel.datas=[UserSeeHTDescModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"datas"]];
        if (self.userSeeHTModel.bizSucc.integerValue == 1) {
            
            succeed(self.userSeeHTModel);
            NSDictionary *savedata = [self.userSeeHTModel mj_keyValues];
            
            [[NSUserDefaults standardUserDefaults] setObject:savedata forKey:KUserSeeHTCache];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            [SVProgressHUD showErrorWithStatus:self.userSeeHTModel.errMsg];
            failure(nil);
        }

//        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//        NSString *content = [[NSString alloc] initWithData:response encoding:gbkEncoding];
    } failure:^(NSError *error) {
        self.isResponseHtmlType = NO;
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}



/**
 *  更新用户消息
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */

    
- (void)updateMessageList:(sudcceed)succeed failure:(failure)failure{
   self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:@"1" forKey:@"pageNum"];
    [self requestData:dic method:@"/front/msgquerypage.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        self.msgData = [UserMsgModel mj_objectWithKeyValues:response];
        self.msgData.infos = [UserMsgCellModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"infos"]];
        if (model.bizSucc.integerValue == 1) {
            
            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}
- (void)nextMessageList:(sudcceed)succeed failure:(failure)failure{
    if (self.msgData.next.integerValue != 1) {
        [SVProgressHUD showErrorWithStatus:@"没有更多了"];
        return;
    }
    
    self.isResponseHtmlType = NO;
    NSInteger pnum = self.msgData.pageNum.integerValue+1;
    NSString *newpnum = [NSString stringWithFormat:@"%ld",(long)pnum];
    self.msgData.pageNum = newpnum;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:newpnum forKey:@"pageNum"];
    [self requestData:dic method:@"/front/msgquerypage.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        self.msgData.next = [response objectForKey:@"next"];
        if (model.bizSucc.integerValue == 1) {
            NSArray *newdata = [UserMsgCellModel mj_objectArrayWithKeyValuesArray:[response objectForKey:@"infos"]];
            NSMutableArray *arr = [NSMutableArray arrayWithArray:self.msgData.infos];
            [arr addObjectsFromArray:newdata];
            [self.msgData setInfos:arr];
            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}
/** 未读消息统计*/
- (void)UnreadMessage:(sudcceed)succeed failure:(failure)failure{
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [self requestData:dic method:@"/front/newmsgcount.do" succeed:^(id response) {
        
        self.userUnreadMsgModel = [UserUnreadMsgModel mj_objectWithKeyValues:response];
        if (self.userUnreadMsgModel.bizSucc.integerValue == 1) {
            succeed(self.userUnreadMsgModel);
        }else{
            [SVProgressHUD showErrorWithStatus:self.userUnreadMsgModel.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}


/**
 *  已读
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)readMessage:(sudcceed)succeed failure:(failure)failure{
    
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [self requestData:dic method:@"/front/msgread.do" succeed:^(id response) {
        
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        if (model.bizSucc.integerValue == 1) {
            succeed(nil);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

/**
 *  更新消息详情
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateMessageDetails:(sudcceed)succeed failure:(failure)failure{
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.msgId forKey:@"msgId"];
    [self requestData:dic method:@"/front/msgdetailquery.do" succeed:^(id response) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:response];
        self.userMsgDetailsModel = [UserMsgDetailsModel mj_objectWithKeyValues:[response objectForKey:@"data"]];
        if (model.bizSucc.integerValue == 1) {
            NSLog(@"电话撒姐姐:%@",self.userMsgDetailsModel);
            succeed(self.userMsgDetailsModel);
            
        }else{
            [SVProgressHUD showErrorWithStatus:self.userMsgDetailsModel.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}



/**
 *  发送验证码
 *
 *  @param succeed succeed description
 *  @param failure failure description
 */
- (void)sendSMSCode:(sudcceed)succeed failure:(failure)failure{
    
    
    
//    if(self.code_type.integerValue == 2){
//        
//        if (self.code_name.length < 1 & self.code_id.length < 1
//            & self.code_cell.length < 1 ) {
//            [SVProgressHUD showErrorWithStatus:@"请输入完整信息"];
//            return;
//        }
//        
//    }
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    if (self.code_type.integerValue == 4||self.code_type.integerValue == 1||self.code_type.integerValue == 2) {
        [dic setValue:self.code_name forKey:@"userName"];
        [dic setValue:self.code_id forKey:@"certNo"];
    }
    [dic setValue:self.code_cell forKey:@"cell"]; 
    
    [dic setValue:self.code_type forKey:@"reqType"];
    [self requestData:dic method:@"/front/smsPwdSend.do" succeed:^(id response) {
        
        UserMsgDetailsModel *model = [UserMsgDetailsModel mj_objectWithKeyValues:response];
        if (model.bizSucc.integerValue == 1) {
            succeed(model);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

/**
 *  验证验证码
 *
 *  @param succeed succeed description
 *  @param failure failure description
 */
- (void)verifySMSCode:(sudcceed)succeed failure:(failure)failure{
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
//    if (self.code_type.integerValue == 4) {
//        
//    }
    [dic setValue:self.code_cell forKey:@"cell"];
    [dic setValue:self.code_name forKey:@"userName"];
    [dic setValue:self.code_id forKey:@"certNo"];
    [dic setValue:self.code_code forKey:@"checkCode"];
    [dic setValue:self.code_type forKey:@"reqType"];
    [self requestData:dic method:@"/front/smsVerify.do" succeed:^(id response) {
        
        UserMsgDetailsModel *model = [UserMsgDetailsModel mj_objectWithKeyValues:response];
        if (model.bizSucc.integerValue == 1) {
            succeed(model);
        }else{
            [SVProgressHUD showErrorWithStatus:model.errMsg];
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}
-(void)securityPreCheck:(sudcceed)succeed failure:(failure)failure
{
    self.isResponseHtmlType = NO;
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.reqType forKey:@"reqType"];
   
    [self requestData:dic method:@"/front/securityPreCheck.do" succeed:^(id response) {
        NSLog(@"花都咖啡不过哭:%@",response);
        self.userPreDispatchModelData = [UserPreDispatchModel mj_objectWithKeyValues:response];
        succeed(self.userPreDispatchModelData   );
                
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];

}
@end
