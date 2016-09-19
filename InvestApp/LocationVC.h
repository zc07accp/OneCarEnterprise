//
//  LocationVC.h
//  InvestApp
//
//  Created by 方涛 on 16/8/31.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseBoard.h"
typedef void(^CityCodeBlock)(NSString* code);
@interface LocationVC : BaseBoard
@property(nonatomic,strong)CityCodeBlock cityCodeBlock;

@end
