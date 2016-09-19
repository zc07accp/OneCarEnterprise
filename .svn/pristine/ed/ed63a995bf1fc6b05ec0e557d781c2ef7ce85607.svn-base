//
//  HomeUtils.h
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseUtils.h"
#import "HomeModel.h"
#define KHomeInvestBanaCache @"kHomeInvestBanaCache"
#define KHomeStageDataCache @"kHomeStageDataCache"
@interface HomeUtils : BaseUtils
@property (nonatomic, strong) HomeModel *homeData;
@property (nonatomic, strong) BannerListModel *banners;

/**
 *  更新首页数据
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateHomeData:(sudcceed)succeed failure:(failure)failure;

/**
 *  更新banner图
 *
 *  @param succeed <#succeed description#>
 *  @param failure <#failure description#>
 */
- (void)updateBannerData:(sudcceed)succeed failure:(failure)failure;

@end
