//
//  UserUtils.h
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/15.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseUtils.h"
#import "UserModel.h"
#define KUserSeeHTCache @"kUserSeeHTCache"
@class UserModel;
@class UserIndex;
@class UserCenterModel;
@interface UserUtils : BaseUtils
AS_SINGLETON(UserUtils)
@property (nonatomic, strong) UserModel *userInfo;
@property (nonatomic, strong) NSString *userDidLogin;
@property (nonatomic, strong) NSString *userDidLoginOut;
@property(nonatomic,strong)NSString *backToMe;
@property(nonatomic,strong)NSString *backToList;
@property(nonatomic,strong)NSString *backToLoad;
@property(nonatomic,strong)NSString *backToListF;

@property (nonatomic, strong) UserIndex *indexData;
@property (nonatomic, strong) UserCenterModel *uCenterData;
@property (nonatomic, strong) UserBalancePageModel *balancePageData;
@property (nonatomic, strong) UserAssetModel *assetData;
@property (nonatomic, strong) UserInComeModel *uIncomeData;
@property (nonatomic, strong) UserAssetModel *refundedData;
@property (nonatomic, strong) UserMsgModel *msgData;
@property(nonatomic,strong)UserUnreadMsgModel *userUnreadMsgModel;
@property(nonatomic,strong)UserMsgDetailsModel *userMsgDetailsModel;
@property(nonatomic,strong)UserSeeHTModel *userSeeHTModel;
@property(nonatomic,strong)UserSeeHTDescModel *userSeeHTDescModel;

@property(nonatomic,strong)NSString *phone;
/**
 * 充值 提现  reqType
 *
 */
@property(nonatomic,strong)UserPreDispatchModel *userPreDispatchModelData;

@property(nonatomic,strong)NSString *reqType;



/**
 *  验证码
 */
@property (nonatomic, copy) NSString *code_name;
@property (nonatomic, copy) NSString *code_id;
@property (nonatomic, copy) NSString *code_type;
@property (nonatomic, copy) NSString *code_code;
@property (nonatomic, copy) NSString *code_cell;

//用户余额
@property(nonatomic, copy) NSString *srType;

//修改密码
@property (nonatomic, copy) NSString *nPassword;
@property (nonatomic, copy) NSString *nCPassword;

//实名认证
@property (nonatomic, copy) NSString *autonym_name;
@property (nonatomic, copy) NSString *autonym_id;


//交易密码
@property (nonatomic, copy) NSString *payPassword;
@property (nonatomic, copy) NSString *rePayPassword;

//回款计划
@property (nonatomic, copy) NSString *prodCode;
@property (nonatomic, copy) NSString *investNo;
@property (nonatomic, copy) NSString *fundCode;
@property (nonatomic, copy) NSString *orderNo;

//消息
@property (nonatomic, copy) NSString *msgId;

/**
 *  检查是否已经登录
 *
 *  @return return value description
 */
+(BOOL)online;

/**
 *  登出
 */
+(void)offline;

/**
 *  返回
 */

+(void)backToMe;
/**
 *  返回产品列表
 */

+(void)backToList;
/**
 *  返回登陆
 */
+(void)backToLoad;
/**
 *  返回产品列表F
 */

+(void)backToListF;

/**
 *  获取userid
 *
 *  @return return value description
 */

+(NSString*)userId;

/**
 *  保存用户数据
 *
 *  @param data data description
 */
+ (void)saveUserInfo:(id)data;
+ (void)saveUserPhone:(NSString*)phone;
+ (void)saveUserPhonePassword:(NSString*)phone;
/**
 *  获取上次登录的手机
 *
 *  @return return value description
 */
+(NSString*)getOldPhone;
+(NSString*)getOldPhonePassword;

#pragma mark = 
/**
 * 用户首页数据
 */
- (void)updateUserIndex:(sudcceed)succeed failure:(failure)failure;

/**
 *  更新用户中心数据
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateUserCenter:(sudcceed)succeed failure:(failure)failure;

/**
 *  设置登录密码
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)setPassword:(sudcceed)succeed failure:(failure)failure;


/**
 *  修改登录密码
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)reSetPassword:(sudcceed)succeed failure:(failure)failure;


/**
 *  实名认证
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)userAutonym:(sudcceed)succeed failure:(failure)failure;


/**
 * 交易密码
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)setPayPassword:(sudcceed)succeed failure:(failure)failure;
- (void)reSetPayPassword:(sudcceed)succeed failure:(failure)failure;


/**
 *  更新账户余额页面
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateBalancePage:(sudcceed)succeed failure:(failure)failure;
- (void)nextBalancePage:(sudcceed)succeed failure:(failure)failure;

/**
 *  更新用户收益数据
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateUserIncomeList:(sudcceed)succeed failure:(failure)failure;
- (void)nextUserIncomeList:(sudcceed)succeed failure:(failure)failure;

/**
 *  更新用户资产数据
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateUserAsset:(sudcceed)succeed failure:(failure)failure;


/**
 *  已回款列表
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateRefundedList:(sudcceed)succeed failure:(failure)failure;
- (void)nextRefundedList:(sudcceed)succeed failure:(failure)failure;

/**
 *  回款计划
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateRefundedPlan:(sudcceed)succeed failure:(failure)failure;

/**
 *  回款合同
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateRefundContract:(sudcceed)succeed failure:(failure)failure;

/**
 *  更新用户消息
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateMessageList:(sudcceed)succeed failure:(failure)failure;
- (void)nextMessageList:(sudcceed)succeed failure:(failure)failure;
/** 未读消息统计*/
- (void)UnreadMessage:(sudcceed)succeed failure:(failure)failure;
/**
 *  已读
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)readMessage:(sudcceed)succeed failure:(failure)failure;

/**
 *  更新消息详情
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateMessageDetails:(sudcceed)succeed failure:(failure)failure;


/**
 *  发送验证码
 *
 *  @param succeed succeed description
 *  @param failure failure description
 */
- (void)sendSMSCode:(sudcceed)succeed failure:(failure)failure;

/**
 *  验证验证码
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)verifySMSCode:(sudcceed)succeed failure:(failure)failure;
/** 充值 提现 校检*/
- (void)securityPreCheck:(sudcceed)succeed failure:(failure)failure;
@end
