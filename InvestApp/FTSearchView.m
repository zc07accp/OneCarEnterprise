
//
//  FTSearchView.m
//  InvestApp
//
//  Created by 方涛 on 16/8/2.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "FTSearchView.h"
@interface FTSearchView()
@end
@implementation FTSearchView

-(void)loadViews{
    _searchView=[[UIView alloc]init];
    _searchView.backgroundColor=RGBA(255, 255, 255, 1);
    [self addSubview:_searchView];
    
    _searchTF=[[UITextField alloc]init];
    _searchTF.backgroundColor=RGBA(244, 245, 246, 1);
    _searchTF.placeholder=@"请输入专业或职位";
    _searchTF.borderStyle=UITextBorderStyleRoundedRect;
    [_searchTF textRectForBounds:CGRectMake(_searchTF. bounds.origin.x +130,_searchTF. bounds.origin.y,_searchTF. bounds.size.width -10, _searchTF.bounds.size.height)];
   

//    _searchBar.layer.masksToBounds = YES;
//    _searchBar.layer.cornerRadius=16;
//    [_searchBar.layer setBorderWidth:8];
//    [_searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_searchView addSubview:_searchTF];
    
     _searchV=[[UIImageView alloc]init];
    _searchV.contentMode=UIViewContentModeScaleAspectFit;
    _searchV.image=[UIImage imageNamed:@"icon_sousuo_qiye_search"];
    _searchV .frame=CGRectMake(0, 0,GTFixWidthFlaot(40),GTFixHeightFlaot(20));
    _searchTF.leftViewMode=UITextFieldViewModeAlways;
    _searchTF.leftView=_searchV;
    
    
    _deleteBtn=[UIButton buttonWithTitle:nil withImageName:@"icon_close_sousuo" withBGColor:[UIColor clearColor]];
    
    _deleteBtn .frame=CGRectMake(0, 0,GTFixWidthFlaot(40),GTFixHeightFlaot(20));
    _searchTF.rightViewMode=UITextFieldViewModeAlways;
    _searchTF.rightView=_deleteBtn;
    
    
    _searchButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _searchButton.backgroundColor=[UIColor blackColor];
    [_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    
    [_searchButton setTitleColor:RGBA(246, 143, 78, 1) forState:UIControlStateNormal];
    [_searchButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    _searchButton.backgroundColor=RGBA(255, 255, 255, 1);
    [_searchView addSubview:_searchButton];
    
    _historyView=[[UIView alloc]init];
    _historyView.backgroundColor=RGBA(255, 255, 255, 1);
    [self addSubview:_historyView];
    
    _imgView=[[UIImageView alloc]init];
    _imgView.backgroundColor=RGBA(255, 255, 255, 1);
    _imgView.image=[UIImage imageNamed:@"icon_lishi_sousuo"];
    [_historyView addSubview:_imgView];

    _searchHistoryLab=[UILabel labelWithSize:14 withColor:RGBA(150, 151, 152, 1) withText:@"搜索历史"];
    _searchHistoryLab.backgroundColor=RGBA(255, 255, 255, 1);
    [_historyView addSubview:_searchHistoryLab];

    
    
    
 
}
-(UIView *)hotCityView{
    if (!_hotCityView)
    {
    _hotCityView=[[UIView alloc]init];
    _hotCityView.backgroundColor=RGBA(255, 255, 255, 1);
    [self addSubview:_hotCityView];
    
    _hotImgV=[[UIImageView alloc]init];
    _hotImgV.backgroundColor=RGBA(255, 255, 255, 1);
    _hotImgV.image=[UIImage imageNamed:@"icon_remen_chengshi"];
    [_hotCityView addSubview:_hotImgV];
    
    
    _hotCityLab=[UILabel labelWithSize:14 withColor:RGBA(150, 151, 152, 1) withText:@"热门城市"];
    _hotCityLab.backgroundColor=RGBA(255, 255, 255, 1);
    [_hotCityView addSubview:_hotCityLab];
    }
    
    
    [_hotCityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(_historyView.mas_bottom).offset(GTFixWidthFlaot(GTFixHeightFlaot(10)));
        make.right.equalTo(@0);
        make.height.equalTo(@(GTFixHeightFlaot(35)));
    }];
    
    [_hotImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotCityView.mas_left).offset(GTFixWidthFlaot(5));
        make.top.equalTo(_hotCityView.mas_top).offset(GTFixHeightFlaot(5));
        make.size.mas_equalTo(CGSizeMake(GTFixWidthFlaot(20), GTFixHeightFlaot(20)));
    }];
    
    [_hotCityLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_hotImgV.mas_right).offset(GTFixWidthFlaot(5));
        make.top.equalTo(_hotCityView.mas_top);
        make.right.equalTo(_hotCityView.mas_right);
        make.height.equalTo(@(GTFixHeightFlaot(35)));
    }];

    return _hotCityView;
}
-(void)layoutViews{
    [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(@(GTFixHeightFlaot(0)));
        make.height.equalTo(@(GTFixHeightFlaot(70)));
    }];
    
    [_searchTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(_searchView.mas_centerY);
        make.left.equalTo(@(GTFixWidthFlaot(40)));
        make.right.equalTo(@(GTFixWidthFlaot(-40)));
        make.height.equalTo(@(GTFixHeightFlaot(30)));
    }];
    _searchTF.layer.masksToBounds=YES;
    _searchTF.layer.cornerRadius=GTFixHeightFlaot(15);
    

    
    [_searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_searchTF.mas_right);
        make.centerY.equalTo(_searchView.mas_centerY);
        make.right.equalTo(@0);
        make.height.equalTo(@(GTFixHeightFlaot(30)));
    }];
    
    [_historyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(_searchView.mas_bottom).offset(GTFixWidthFlaot(GTFixHeightFlaot(10)));
        make.right.equalTo(@0);
        make.height.equalTo(@(GTFixHeightFlaot(35)));
    }];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_historyView.mas_left).offset(GTFixWidthFlaot(5));
        make.top.equalTo(_historyView.mas_top).offset(GTFixHeightFlaot(5));
        make.size.mas_equalTo(CGSizeMake(GTFixWidthFlaot(20), GTFixHeightFlaot(20)));
    }];
    
    [_searchHistoryLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imgView.mas_right).offset(GTFixWidthFlaot(5));
        make.top.equalTo(_historyView.mas_top);
        make.right.equalTo(_historyView.mas_right);
        make.height.equalTo(@(GTFixHeightFlaot(35)));
    }];
    
    
    
    
}
@end
