//
//  RootBoard.m
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "HomeBoard.h"
#import "LoginBoard.h"
#import "MoreBoard.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "RootBoard.h"
#import "UserBoard.h"
#import "UserUtils.h"
#import "WelComeViewController.h"



@implementation RootBoard

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    //去掉导航栏返回按钮的文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    [self setSelectBoard:TabBarTag_Home];

    self.view.backgroundColor = [AppStyleConfiguration beijingse];
    /**
     *  初始化视图
     */
    
    HomeBoard *hBoard = [[HomeBoard alloc] init];
    UserBoard *uBoard = [[UserBoard alloc] init];
    MoreBoard *mBoard= [[MoreBoard alloc] init];
    
    hBoard.rootBoard = self;

    uBoard.rootBoard = self;
    mBoard.rootBoard = self;

    
    hBoard.title = [AppLanguage getLanguage:AppLanguageType_HomeNavTitle];
    uBoard.title = [AppLanguage getLanguage:AppLanguageType_UserNavTitle];
    mBoard.title = [AppLanguage getLanguage:AppLanguageType_AskNavTitle];
    //修改root页面
    self.controllers = @[hBoard,mBoard,uBoard];
    UINavigationController *hnav = [[UINavigationController alloc] initWithRootViewController:hBoard];
    UINavigationController *unav = [[UINavigationController alloc] initWithRootViewController:uBoard];
    UINavigationController *mnav = [[UINavigationController alloc] initWithRootViewController:mBoard];
    
    hnav.view.tag = TabBarTag_Home;
    unav.view.tag = TabBarTag_User;
    mnav.view.tag = TabBarTag_More;
    self.selectTag = TabBarTag_Home;
    self.tabBarBoard = [[RDVTabBarController alloc] init];
    [self.tabBarBoard setDelegate:self];
    
    [self.tabBarBoard setViewControllers:@[hnav,mnav,unav,]];
    if(![[NSUserDefaults standardUserDefaults] boolForKey:FIRSTSTART])
    {
        //满足条件,说明是第一次运行,然后用字典在沙盒中写入文件,并将值改为YES,项目以后再运行,读取到的值均为YES
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:FIRSTSTART];
        WelComeViewController *wc=[[WelComeViewController alloc]init];
        
        self.controllers=@[wc];
        [self.view addSubview:wc.view];
        //新手引导页
        
    }else
    {
        [self.view addSubview:self.tabBarBoard.view];
    }

    NSArray *tabBarItemImages = @[@"shouye", @"chanpinliebiao", @"wode"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self.tabBarBoard tabBar] items]) {
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@-3",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
    /**
     *  events
     */
    
    /**
     *  登录检测
     *
     *  @return <#return value description#>
     */
    [RACObserve([UserUtils sharedInstance], backToLoad) subscribeNext:^(id x) {
        if([x isEqualToString:@"YES"]){ //判断登录
            if (NO == [UserUtils online]) {
                [self showLoginBoard];
            }else{
                [RACObserve([UserUtils sharedInstance], backToListF) subscribeNext:^(id x) {
                    if([x isEqualToString:@"YES"]){ //如果已经登录
                        //跳转到我的
                        [self setSelectBoard:TabBarTag_List];
                        
                        
                    }
                }];

            }
                
  
        }
    }];
//    
//    [RACObserve([UserUtils sharedInstance], backToMe) subscribeNext:^(id x) {
//        if([x isEqualToString:@"YES"]){ //如果已经登录
//            //跳转到我的
//            [self setSelectBoard:TabBarTag_User];
//            
//            
//        }
//    }];
    /**
     *  返回列表
     *
     */
//    [RACObserve([UserUtils sharedInstance], backToList) subscribeNext:^(id x) {
//        if([x isEqualToString:@"YES"]){ //如果已经登录
//            //跳转到我的
//            [self setSelectBoard:TabBarTag_List];
//            
//        }
//    }];



    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - 

/**
 *   跳转界面
 *
 *  @param tag <#tag description#>
 */
- (void)setSelectBoard:(NSInteger) tag{
   
    [self.tabBarBoard setSelectedIndex:tag];
}

#pragma mark - 

- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    self.selectTag = viewController.view.tag;
}

- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    /**
     *  检查是否登录 没有登录跳转登录
     */
    
//    if (NO == [UserUtils online] && viewController.view.tag == TabBarTag_User) {
//        [self showLoginBoard];
//        return NO;
//    }
    
    
    return YES;
}



@end
