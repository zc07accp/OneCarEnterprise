//
//  BaseBoard.m
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "BaseBoard.h"
#import "LoginBoard.h"
#import "UserUtils.h"
@interface BaseBoard ()
@end

@implementation BaseBoard
-(void)updateVersionF
{
    [UserUtils offline];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  pop 函数
 */
- (void)popBoard{
    [self.navigationController popViewControllerAnimated:YES];
    self.pBlock(self.popData);
}
- (void)popToBoard:(BaseBoard*)board{
    [self.navigationController popToViewController:board animated:YES];
    self.pBlock(self.popData);
}
- (void)popTORootBoard{
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.pBlock(self.popData);
}

/**
 *  获取一个新的board
 */
+(instancetype)board{
    
    return [[self alloc] init];
}

/**
 *  显示登录
 */
- (void)showLoginBoard
{
//    self.LoginUtils = [[LoginUtils alloc] init];
//    if ([UserUtils getOldPhone])
     //{
//        
//        [self.LoginUtils checkPhone:[UserUtils getOldPhone] succeed:^(id data) {
//           
//            //判断手机是否已经存在
//            if(self.LoginUtils.cpModel.existUser.integerValue == 0
//               || self.LoginUtils.cpModel.existPasswd.integerValue == 0 ){
//                NSLog(@"李真的节：%@",self.LoginUtils.cpModel.existUser);
//                //打开验证码界面
//                LoginBoard *board = [[LoginBoard alloc] init];
//                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:board];
//                [self presentViewController:nav animated:YES completion:^{
//                    
//                }];
//            }else{
//            }
//
//            
//        } failure:^(NSError *error) {
//            
//        }];
//        if(self.LoginUtils.cpModel.existUser.integerValue == 0
//               || self.LoginUtils.cpModel.existPasswd.integerValue == 0 ){
//                //打开验证码界面
//                LoginBoard *board = [[LoginBoard alloc] init];
//                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:board];
//                [self presentViewController:nav animated:YES completion:^{
//                    
//                }];
//            }else{
//    
//                
//                
//            }
//        
//    }else{
//        LoginBoard *board = [[LoginBoard alloc] init];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:board];
//        [self presentViewController:nav animated:YES completion:^{
//            
//        }];
//
//    }
    
    
    
}
@end
