//
//  FTSearchView.h
//  InvestApp
//
//  Created by 方涛 on 16/8/2.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseView.h"
#import "UIButoon+Style.h"
#import "UILabel+Style.h"
@interface FTSearchView : BaseView
//搜索框的背景view
@property (nonatomic, strong)UIView *searchView;

// 搜索按钮
@property (nonatomic, strong) UIButton *searchButton;
// 搜索框
@property (nonatomic, strong)UITextField *searchTF;//搜索框
@property (nonatomic, strong)UIImageView *searchV;//放大镜
@property (nonatomic, strong)UIButton *deleteBtn;//删除按钮
@property (nonatomic, strong)UIView *historyView;
//搜索历史
@property (nonatomic, strong)UILabel *searchHistoryLab;
//历史图标
@property (nonatomic, strong)UIImageView *imgView;

@property (nonatomic, strong)UIView *hotCityView;
//搜索历史
@property (nonatomic, strong)UILabel *hotCityLab;
//历史图标
@property (nonatomic, strong)UIImageView *hotImgV;


@end
