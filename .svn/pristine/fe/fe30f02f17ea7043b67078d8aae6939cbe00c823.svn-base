//
//  UserBoard.m
//  InvestApp
//
//  Created by 张久成 on 16/3/15.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "RootBoard.h"
#import "UserBoard.h"



@interface UserBoard ()
@property(nonatomic,strong)UIView *view_dot;

@end
@implementation UserBoard

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    RootBoard *board = (RootBoard*)self.rootBoard;
    [[board tabBarBoard] setTabBarHidden:NO animated:NO];
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    RootBoard *board = (RootBoard*)self.rootBoard;
    [[board tabBarBoard] setTabBarHidden:YES animated:NO];
}


@end
