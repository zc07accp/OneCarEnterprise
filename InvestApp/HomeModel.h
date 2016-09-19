//
//  HomeModel.h
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseModel.h"


@interface BannerModel : BaseModel
@property (nonatomic, copy) NSString * contentUrl;
@property (nonatomic, copy) NSString * imageUrl;
@property (nonatomic, copy) NSString * orderNum;
@property (nonatomic, copy) NSString * title;
@end


@interface BannerListModel : BaseModel
@property (nonatomic, strong) NSMutableArray *listObject;
@property (nonatomic, copy) NSString * next;
@property (nonatomic, copy) NSString * pageNum;
@property (nonatomic, copy) NSString * totalPages;

@end

@interface HomeModel : BaseModel
@property (nonatomic, copy) NSString * code;
@property (nonatomic, copy) NSString * descValue;
@property (nonatomic, copy) NSString * minMount;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * nhsy;
@property (nonatomic, copy) NSString * percent;
@property (nonatomic, copy) NSString * period;
@property (nonatomic, copy) NSString * periodUnit;
@property (nonatomic, copy) NSString * securityDesc;
@property (nonatomic, copy) NSString * sgbz;
@property (nonatomic, copy) NSString * state;
@property (nonatomic, copy) NSString * tip;
@property (nonatomic, copy) NSString * tipColor;
@property (nonatomic, copy) NSString * tipImageColor;
@property(nonatomic,strong)NSString *nhsyText;
@property(nonatomic,strong)NSString *amountText;
@property(nonatomic,strong)NSString *dateText;
@property(nonatomic,strong)NSString *ntype;
@property(nonatomic,strong)NSString *limitAmountText;


@end
