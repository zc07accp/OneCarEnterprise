//
//  HomeStageUtils.h
//  InvestApp
//
//  Created by 汝长志 on 16/4/13.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseUtils.h"
#import "HomeStageModel.h"
#define KHomeStageCache @"kHomeStageCache"
@interface HomeStageUtils : BaseUtils
@property(nonatomic,strong)HomeStageModel *homeStageData;
- (void)updateHomeData:(sudcceed)succeed failure:(failure)failure;
@end
