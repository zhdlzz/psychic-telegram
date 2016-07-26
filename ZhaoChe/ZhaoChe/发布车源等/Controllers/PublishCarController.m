//
//  PublishCarController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/7.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "PublishCarController.h"
#import "ZDLMyCenterCell.h"
#import "UIColor+ZhaoChe.h"
#import "ScrollCollectionCell.h"
#import "ChooseCarController.h"
@interface PublishCarController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property(nonatomic,strong)UICollectionView *collectionView;
@property(strong,nonatomic)UIView *searchView;

@property(nonatomic,strong)UICollectionView *collectionView2;
@end

@implementation PublishCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView.sectionIndexBackgroundColor = [UIColor clearColor];
    [self setBackNavBtn];
    [self setCollectionViewForScroll];

}
-(void)setCollectionViewForScroll
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;//内部cell之间距离
    flowLayout.minimumLineSpacing = 0;
    flowLayout.itemSize = CGSizeMake(155, 149);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, width, 179) collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UINib *nib = [UINib nibWithNibName:@"ScrollCollectionCell" bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"ScrollCollectionCellID"];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    UICollectionViewFlowLayout *flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout2.minimumInteritemSpacing = 1;//内部cell之间距离
    flowLayout2.minimumLineSpacing = 0;
    flowLayout2.itemSize = CGSizeMake(width/5-2, width/5-2);
    self.collectionView2 = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, width, width/5*2) collectionViewLayout:flowLayout2];
    self.collectionView2.dataSource = self;
    self.collectionView2.delegate = self;
    self.collectionView2.backgroundColor = [UIColor zc_BackgroundColor];
    [self.collectionView2 registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    self.collectionView2.scrollEnabled = NO;
}

#pragma mark UICollectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (collectionView == self.collectionView) {
        return 1;
    }else
    {
        return 2;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (collectionView == self.collectionView2) {
        return CGSizeMake(self.view.frame.size.width, 2);
    }else
    {
        return CGSizeMake(10, 2);
    }

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.collectionView) {
        return 6;
    }else
    {
        return 5;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (collectionView == self.collectionView) {
        static NSString *cellIdentifier = @"ScrollCollectionCellID";
        ScrollCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        cell.priceLabel.textColor = [UIColor zc_OrangeColor];
        [cell.imageView setImage:[UIImage imageNamed:@"帕萨特"]];
        return cell;
    }else
    {
        CGFloat iWidth = width/5;
        CGFloat iX = iWidth/3;
        static NSString *cellId = @"cellID";
        UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(iX, 15, iX, iX)];
        imageV.backgroundColor = [UIColor cyanColor];
        [imageV setImage:[UIImage imageNamed:@"宝马图标占位"]];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(iX, iX*2, iX, 20)];
        label.font = [UIFont systemFontOfSize:12];
        label.text = @"宝马";
        
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:imageV];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@">>>>%ld",indexPath.row);
}








-(void)setBackNavBtn
{
    self.title= @"车源";
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 45, 40)];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 15, 10, 15)];
    image.image = [UIImage imageNamed:@"导航返回"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 2, 30, 40)];
    label.text = @"返回";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor zc_BlueColor];
    label.font = [UIFont systemFontOfSize:15];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 40)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:image];
    [view addSubview:label];
    [view addSubview:btn];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = item;
}

-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma tableView 代理

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0||section == 1) {
        return 2;
    }else
    {
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"常用品牌";
            cell.textLabel.textColor = [UIColor zc_FontColor999];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            UILabel *label = [[UILabel alloc]init];
            label.frame = CGRectMake(0, 32,width, 2);
            label.backgroundColor = [UIColor zc_BackgroundColor];
            [cell.contentView addSubview:label];
        }else
        {
            UILabel *label = [[UILabel alloc]init];
            label.frame = CGRectMake(0, width/5*2,width, 10);
            label.backgroundColor = [UIColor zc_BackgroundColor];
            [cell.contentView addSubview:label];
            [cell.contentView addSubview:self.collectionView2];
        }
        return cell;

    }else if(indexPath.section == 0)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"会员特惠商城";
            cell.textLabel.textColor = [UIColor zc_FontColor999];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            UILabel *label = [[UILabel alloc]init];
            label.frame = CGRectMake(0, 32,width, 2);
            label.backgroundColor = [UIColor zc_BackgroundColor];
            [cell.contentView addSubview:label];
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(width-80, 0, 62, 33)];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(0, 0, 40, 33);
            [btn setTitle:@"进入" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor zc_FontColor999] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            
            UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
            btn2.frame = CGRectMake(42, 12, 8, 10);
            [btn2 setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(goInto) forControlEvents:UIControlEventTouchUpInside];
            [btn2 addTarget:self action:@selector(goInto) forControlEvents:UIControlEventTouchUpInside];
            
            [view addSubview:btn2];
            [view addSubview:btn];
            [cell.contentView addSubview:view];
        
        }else
        {
            [cell.contentView addSubview:self.collectionView];
        }
         return cell;
    }else
    {
        ZDLMyCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"ZDLMyCenterCell" owner:self options:nil].lastObject;
        }
        if (cell!= nil) {
            cell =nil;
            cell = [[NSBundle mainBundle]loadNibNamed:@"ZDLMyCenterCell" owner:self options:nil].lastObject;
        }
        cell.nameLabel.text = @"宝马";
        cell.nameLabel.font = [UIFont systemFontOfSize:15];
        [cell.iconBtn setImage:[UIImage imageNamed:@"宝马图标占位"] forState:UIControlStateNormal];
        return cell;
    }
}
-(void)goInto
{
    NSLog(@"》》》》》进入");
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView

{
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"A",@"B",@"C", nil];
    [arr addObject:UITableViewIndexSearch];
    [arr sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return arr;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section >= 2) {
        ChooseCarController *chooseC = [[ChooseCarController alloc] init];
        [self.navigationController pushViewController:chooseC animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = self.view.bounds.size.width;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 33;
        }else
        {
            return 179;
        }
    }else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            return 33;
        }else
        {
            return width/5*2+10;
        }
    }
    else
    {
        return 44;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 44;
    }else if (section == 1)
    {
        return 10;
    }else
    {
        return 24;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (section == 0) {
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
        headView.backgroundColor = [UIColor zc_BackgroundColor];
   
        UISearchBar *searchBar  = [[UISearchBar alloc]initWithFrame:CGRectMake(width*0.05, 7, width*0.9, 30)];
        searchBar.placeholder = @"品牌/车型/商家/指导价搜车，如2008";
        [searchBar setBackgroundImage:[UIImage imageNamed:@"搜索框"]];
        searchBar.layer.cornerRadius = 5;
        searchBar.delegate = self;
        [headView addSubview:searchBar];
        return headView;
    }else if (section == 1)
    {
        return nil;
    }
    else
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 24)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 30, 24)];
        NSArray *arr = @[@"",@"",@"A",@"B",@"C"];
        label.text = arr[section];
        [view addSubview:label];
        return view;
    }
}




#pragma searchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@">>>>%@",searchText);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
