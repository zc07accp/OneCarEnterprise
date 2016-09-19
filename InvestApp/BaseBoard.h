//
//  BaseBoard.h
//  InvestApp
//
//  Created by 张久成 on 16/3/14.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^popBoardBlock)(id data);

@interface BaseBoard : UIViewController
@property (nonatomic, copy) popBoardBlock pBlock;
@property (nonatomic, strong) id popData;
@property (nonatomic, strong) RACSubject *racSign;
@property (nonatomic, weak) BaseBoard *rootBoard;


/**
 *  获取一个新的boar
 */
+(instancetype)board;

/*
   pop 函数
*/

- (void)popBoard;
- (void)popToBoard:(BaseBoard*)board;
- (void)popTORootBoard;

/**
 *  显示登录
 */
- (void)showLoginBoard;
@end
