//
//  FTSearchViewController.m
//  InvestApp
//
//  Created by 方涛 on 16/8/2.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "LocationVC.h"
#import "FTSearchView.h"
#import "FTistoryCollectionViewCell.h"

@interface LocationVC ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate>
// searchCollectionView
@property (nonatomic, strong) UICollectionView *searchCollectionView;
// 存放搜索出结果的数组
@property (nonatomic, strong) NSDictionary *hotCitydic;
@property (nonatomic, strong) NSArray *hotCityArr;
@property (nonatomic, strong)FTSearchView *secView;
@end

@implementation LocationVC
-(NSDictionary *)hotCitydic{
    return @{@"北京":@"100000",@"上海":@"200000",@"杭州":@"310000",@"重庆":@"400000",@"武汉":@"430000",@"广州":@"510000"    };
}
-(NSArray *)hotCityArr{
    return  self.hotCitydic.allKeys;
}
static NSString * Cell= @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(239, 240, 241, 1);
    self.title = @"切换城市";
    [self addLocationView];
    [self addSearchCollectionView];
    [self addAction];
}
#pragma mark 添加视图
-(void)addLocationView{
    _secView=[[FTSearchView alloc]initWithFrame:self.view.frame];
    _secView.searchTF.delegate=self;
    _secView.searchTF.placeholder=@"请输入城市名称";
    [_secView.searchButton setTitle:@"切换" forState:UIControlStateNormal];
    _secView.imgView.image=[UIImage imageNamed:@"icon_location_chengshi"];
    _secView.hotCityView.backgroundColor=RGBA(255, 255, 255, 1);
    [self.view addSubview:_secView];
}
-(void)viewWillAppear:(BOOL)animated{
    
}
-(void)addSearchCollectionView{
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //2.初始化collectionView
    _searchCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.secView addSubview:_searchCollectionView];
    [_searchCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(self.secView.hotCityView.mas_bottom).offset(GTFixHeightFlaot(2));
        make.height.equalTo(@(GTFixHeightFlaot(150)));
    }];
    
    _searchCollectionView.backgroundColor = [UIColor whiteColor];
    //3.注册collectionViewCell
    [_searchCollectionView registerClass:[FTistoryCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    //4.设置代理
    _searchCollectionView.delegate = self;
    _searchCollectionView.dataSource = self;
    
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 6;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FTistoryCollectionViewCell *cell = (FTistoryCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:Cell forIndexPath:indexPath];
    
    cell.backgroundColor=RGBA(239, 240, 241, 1);
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius=5;
    cell.lab.text=self.hotCityArr[indexPath.row];
    return cell;
}
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kMainScreen_width*0.3-GTFixWidthFlaot(20),GTFixHeightFlaot(30));
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 20, 15, 20);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FTistoryCollectionViewCell *cell=(FTistoryCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    self.secView.searchTF.text=cell.lab.text;
}
-(void)addAction{
    [_secView.searchButton addTarget:self action:@selector(searchButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_secView.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark 点击搜索按钮
-(void)searchButtonClick:(UIButton*)sender{
    self.cityCodeBlock([self.hotCitydic valueForKey:self.secView.searchTF.text]);
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)deleteBtnClick:(UIButton*)sender{
    self.secView.searchTF.text=@"";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
