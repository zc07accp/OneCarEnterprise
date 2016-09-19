//
//  BaseTableViewCell.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/19.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell


+(CGFloat)cellHeight
{
    return 0;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadViews];
        [self layoutViews];
    }
    return self;
}

- (void)updateConstraints {
    [self layoutViews];
    [super updateConstraints];
}

- (void)loadViews{
    
}
- (void)layoutViews{
    
}

@end
