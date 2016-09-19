//
//  WelComeViewController.m
//  2015-12-20Demo音乐播放器
//
//  Created by tarena on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "WelComeViewController.h"
#import "RootBoard.h"
@interface WelComeViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak)UIPageControl *pc;
@end

@implementation WelComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self configScrollview];
    [self configPageControl];
}
-(void)configScrollview
{
    UIScrollView *sv=[[UIScrollView alloc]init];
    sv.delegate=self;
    sv.frame=self.view.bounds;
    sv.contentSize=CGSizeMake(4*sv.bounds.size.width, sv.bounds.size.height);
    for (int i=0; i<4; i++) {
        UIImageView *iv=[[UIImageView alloc]init];
        iv.frame=CGRectMake(i*sv.bounds.size.width, 0, sv.bounds.size.width, sv.bounds.size.height);
        iv.image=[UIImage imageNamed:[NSString stringWithFormat:@"welcomImage0%i",i+1]];
        
        
        [sv addSubview:iv];
        if ([self.firster isEqualToString:@"NO"]) {
            [self configEnterButton:iv];
        }else{
        if (i==3) {
            [self configEnterButton:iv];
        }
        }
        
    }
    sv.bounces=NO;
    sv.pagingEnabled=YES;
    sv.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:sv];
}
-(void)configEnterButton:(UIImageView *)iv
{
    iv.userInteractionEnabled=YES;
    self.enterbutton=[[UIButton alloc]initWithFrame:CGRectMake((kMainScreen_width-120)/2, kMainScreen_height/6*5, 120, 35)];
    [self.enterbutton setTitleColor:[AppStyleConfiguration anniuhong] forState:UIControlStateNormal];
    [self.enterbutton setBackgroundColor:[UIColor clearColor]];
    self.enterbutton.layer.borderWidth=0.5;
    self.enterbutton.layer.borderColor=[AppStyleConfiguration anniuhong].CGColor;
    self.enterbutton.layer.cornerRadius=3;
    if ([self.firster isEqualToString:@"NO"]) {
        [self.enterbutton setTitle:@"关闭" forState:UIControlStateNormal];
    }else{
    [self.enterbutton setTitle:@"立即体验" forState:UIControlStateNormal];
    }
    [self.enterbutton addTarget:self action:@selector(enterAPP:) forControlEvents:UIControlEventTouchUpInside];
    [iv addSubview:self.enterbutton];
}
-(void)enterAPP:(UIButton *)sender
{
    if ([self.firster isEqualToString:@"NO"]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
    RootBoard *rb=[[RootBoard alloc]init];
    
    [self presentViewController:rb animated:YES completion:nil];
    }
}
-(void)configPageControl
{
    UIPageControl *pc=[[UIPageControl alloc]init];
    self.pc=pc;
    pc.frame=CGRectMake(0, self.view.bounds.size.height-60, self.view.bounds.size.width, 40);
    pc.numberOfPages=4;
    pc.pageIndicatorTintColor=[UIColor whiteColor];
    pc.currentPageIndicatorTintColor=[AppStyleConfiguration anniuhong];
    pc.userInteractionEnabled=NO;
    [self.view addSubview:pc];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset=scrollView.contentOffset;
    self.pc.currentPage=round(offset.x/scrollView.bounds.size.width);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
