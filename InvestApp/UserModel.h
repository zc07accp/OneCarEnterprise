//
//  UserModel.h
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/23.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseModel.h"
@interface UserCenterModel : BaseModel
@property (nonatomic, strong) NSString *bankIcon;
@property (nonatomic, strong) NSString *bankName;
@property (nonatomic, strong) NSString *bindCardState;
@property (nonatomic, strong) NSString *cell;
@property (nonatomic, strong) NSString *certNo;
@property (nonatomic, strong) NSString *loginPwdState;
@property (nonatomic, strong) NSString *payPwdState;
@property (nonatomic, strong) NSString *realName;
@property (nonatomic, strong) NSString *realNameState;
@property(nonatomic,strong)NSString *bankNo;
@property(nonatomic,strong)NSString *cardStateStr;
@end

@interface UserModel : BaseModel
@property (nonatomic, copy) NSString *bindCard;
@property (nonatomic, copy) NSString *cardState;
@property (nonatomic, copy) NSString *certNo;
@property (nonatomic, copy) NSString *loginPwd;
@property (nonatomic, copy) NSString *payPwd;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *trade;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *userState;
@end

@interface UserIndex : BaseModel
@property (nonatomic, copy) NSString *totalAmount;
@property (nonatomic, copy) NSString *profitDate;
@property (nonatomic, copy) NSString *holdAmount;
@property (nonatomic, copy) NSString *accAmount;
@property (nonatomic, copy) NSString *totalProfit;
@property (nonatomic, copy) NSString *datePofit;
@end


@interface UBPCellModel : BaseModel
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSString *transName;
@property (nonatomic, copy) NSString *memo;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *balanceAmt;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *prodName;
@end

@interface UserBalancePageModel : BaseModel
@property (nonatomic, copy) NSString *availAmount;
@property (nonatomic, copy) NSString *hasImpawn;
@property (nonatomic, copy) NSString *withdrawAmount;
@property (nonatomic, copy) NSString *availWithdrawAmtTip;
@property (nonatomic, copy) NSString *impawnAmtTip;
@property (nonatomic, copy) NSString *balanceDef;
@property (nonatomic, copy) NSString *totalOutAmount;
@property (nonatomic, copy) NSString *balance;
@property (nonatomic, copy) NSString *impawnAmount;
@property (nonatomic, copy) NSString *totalFreezeAmount;
@property (nonatomic, copy) NSString *availWithdrawAmount;
@property (nonatomic, copy) NSString *totalPages;
@property (nonatomic, copy) NSString *pageNum;
@property (nonatomic, copy) NSString *totalInAmount;
@property (nonatomic, copy) NSString *next;
@property (nonatomic, strong) NSMutableArray *datas;
@end



@interface UAssetCellModel : BaseModel
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *stateStr;
@property (nonatomic, copy) NSString *effectEndTime;
@property (nonatomic, copy) NSString *effectStartTimeDesc;
@property (nonatomic, copy) NSString *waitReturn;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, copy) NSString *recentReturnDate;
@property (nonatomic, copy) NSString *totalIncome;
@property (nonatomic, copy) NSString *hasReturnPrincdipal;
@property (nonatomic, copy) NSString *tips;
@property (nonatomic, copy) NSString *investNo;
@property (nonatomic, copy) NSString *prodTitle;
@property (nonatomic, copy) NSString *effectStartTime;
@property (nonatomic, copy) NSString *effectEndTimeDesc;
@property (nonatomic, copy) NSString *prodYearRate;
@property (nonatomic, copy) NSString *fundCode;
@property (nonatomic, copy) NSString *unSettlementProfit;
@property (nonatomic, copy) NSString *recentReturnDateDesc;
@end


@interface UserAssetModel : BaseModel
@property (nonatomic, copy) NSString *profitMoney;
@property (nonatomic, copy) NSString *pageNum;
@property (nonatomic, copy) NSMutableArray *listObject;
@property (nonatomic, copy) NSString *principalMoney;
@property (nonatomic, copy) NSString *totalMoney;
@property (nonatomic, copy) NSString *totalPages;
@property (nonatomic, copy) NSString *next;
@property (nonatomic, copy) NSString *profitMoneyTip;
@end


@interface UserInComeModel : BaseModel
@property (nonatomic, copy) NSString *totalProfit;
@property (nonatomic, copy) NSString *pageNum;
@property (nonatomic, copy) NSString *next;
@property (nonatomic, strong) NSMutableArray *listObject;
@end


@interface UserInComeCellModel : BaseModel
@property (nonatomic, copy) NSString *profitDate;
@property (nonatomic, copy) NSString *profit;
@end


@interface UserMsgCellModel : BaseModel
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bizState;
@property (nonatomic, copy) NSString *bizID;
@property (nonatomic, copy) NSString *bizType;

@end

@interface UserMsgModel : BaseModel
@property (nonatomic, copy) NSString *pageNum;
@property (nonatomic, copy) NSString *next;
@property (nonatomic,  strong) NSMutableArray *infos;
@end


@interface UserMsgDetailsModel : BaseModel
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *title;
@end
@interface UserPreDispatchModel : BaseModel
@property(nonatomic,strong)NSString *pageCode;
@end
//未读消息
@interface UserUnreadMsgModel : BaseModel
@property (nonatomic, copy) NSString *count;
@end
@interface UserSeeHTModel : BaseModel
@property (nonatomic, copy) NSArray *datas;
@end
@interface UserSeeHTDescModel : BaseModel
@property (nonatomic, copy) NSString *url;
@property(nonatomic,strong)NSString *name;

@end
