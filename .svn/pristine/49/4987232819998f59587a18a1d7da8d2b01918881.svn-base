//
//  FTistoryCollectionViewCell.m
//  InvestApp
//
//  Created by 方涛 on 16/8/2.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "FTistoryCollectionViewCell.h"

@implementation FTistoryCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:(CGRect)frame];
    if (self) {
        [self loadViews];
        [self layoutViews];
        
    }
    return self;
}
-(void)loadViews{
    _lab=[[UILabel alloc]init];
    _lab.textAlignment=NSTextAlignmentCenter;
    _lab.backgroundColor=RGBA(239, 240, 241, 1);
    _lab.textColor=RGBA(161, 162, 163, 1);
    [self addSubview:_lab];
    
}
-(void)layoutViews{
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
}
@end
