//
//  RootBoard.h
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//  提交

#import "BaseBoard.h"
#import "RDVTabBarController.h"
#define  FIRSTSTART  @" firstStart"
typedef NS_ENUM(NSUInteger, TabBarTag) {
    TabBarTag_Home,
    TabBarTag_List,
    TabBarTag_User,
    TabBarTag_More,
    TabBarTag_IM,
    
};


typedef NS_ENUM(NSUInteger, RootSignType) {
    RootSignType_ShowTabar,
    RootSignType_HideTabar,
};

@class RDVTabBarController;
@interface RootBoard : BaseBoard <RDVTabBarControllerDelegate>
@property (nonatomic, strong) RDVTabBarController *tabBarBoard;
@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic, assign) TabBarTag selectTag;


@end
