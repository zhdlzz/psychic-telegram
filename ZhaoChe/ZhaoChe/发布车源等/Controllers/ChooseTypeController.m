//
//  ChooseTypeController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/12.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "ChooseTypeController.h"
#import "CardIdentityCell.h"
#import "UIColor+ZhaoChe.h"
#import "PubCarController.h"
#import "CarController.h"
@interface ChooseTypeController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation ChooseTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
    _arr = [NSMutableArray arrayWithObjects:@"2015款",@"2016款",@"2017款", nil];
}
-(void)setBackNavBtn
{
    self.title= @"选择车型";
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    CardIdentityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"CardIdentityCell" owner:self options:nil].lastObject;
    }
    cell.nameLabel.textColor = [UIColor zc_FontColor333];
    cell.introduceLabel.textColor = [UIColor zc_FontColor666];
    cell.nameLabel.text = @"14.29万";
    cell.introduceLabel.text = @"1.2TSI  DSG蓝驱技术版";
    return cell;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arr.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat width = self.view.bounds.size.width;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 30)];
    view.backgroundColor = [UIColor zc_BackgroundColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 30)];
    label.textColor = [UIColor zc_FontColor999];
    label.font = [UIFont systemFontOfSize:13];
    label.text = _arr[section];
    [view addSubview:label];
    return view;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == _arr.count-1) {
        return 44;
    }else
    {
        return 0;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGFloat width = self.view.bounds.size.width;
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 54)];
    footView.backgroundColor = [UIColor zc_BackgroundColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 10, width, 44)];
    view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(width-25, 17, 8, 13);
    [btn setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(zidingyiCarName) forControlEvents:UIControlEventTouchUpInside];
    UILabel *tLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 200, 44)];
    tLabel.font = [UIFont systemFontOfSize:15];
    tLabel.text = @"自定义车型";
    tLabel.textColor = [UIColor zc_FontColor333];
    [view addSubview:tLabel];
    [view addSubview:btn];
    
    [footView addSubview:view];
    return footView;
}

-(void)zidingyiCarName
{
    CarController *Cc = [[CarController alloc]init];
    [self.navigationController pushViewController:Cc animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PubCarController *pubC = [[PubCarController alloc] init];
    [self.navigationController pushViewController:pubC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
