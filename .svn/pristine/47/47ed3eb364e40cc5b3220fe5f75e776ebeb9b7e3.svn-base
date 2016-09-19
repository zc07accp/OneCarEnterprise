//
//  HomeBoard.m
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.


#import "HomeBoard.h"
#import "JCCircleProgress.h"
#import "RootBoard.h"
#import "GYZChooseCityController.h"


@interface HomeBoard ()<GYZChooseCityDelegate>
@property (nonatomic , strong) UIButton* locationBtn;
@end
@implementation HomeBoard


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addNavigationBar];
}
#pragma mark-<城市选择按钮代理>
-(void)cityPickerControllerDidCancel:(GYZChooseCityController *)chooseCityController
{

}
-(void)cityPickerController:(GYZChooseCityController *)chooseCityController didSelectCity:(GYZCity *)city
{
    
    [self.locationBtn setTitle:city.cityName forState:UIControlStateNormal];
}
#pragma mark 添加导航栏按钮
/*
 增加导航栏按钮
 */
-(void)addNavigationBar
{
    self.locationBtn = [UIButton buttonWithTitle:@"杭州市" withImageName:@"icon_location_qiye" withBGColor:nil];
    [self.locationBtn.titleLabel setFont:[AppStyleConfiguration appNavigationLeftAndRightFontSize]];
    [self.locationBtn addTarget:self action:@selector(locationBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.locationBtn.frame = CGRectMake(0, 0, 64, 44);
    [self.locationBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:5];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:_locationBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}
#pragma mark 导航栏按钮事件 定位
-(void)locationBtnClick:(UIButton*)sender
{
    GYZChooseCityController *cityPickerVC = [[GYZChooseCityController alloc] init];
    [cityPickerVC setDelegate:self];
    //[self.navigationController pushViewController:cityPickerVC animated:YES];
    
  [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
        
    }];
//
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
