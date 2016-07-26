//
//  ChooseWController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/13.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "ChooseWController.h"
#import "ContentColorController.h"
#import "NController.h"

#define height self.view.bounds.size.height
#define cellHeight height*0.0733
@interface ChooseWController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ChooseWController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
   
}
-(void)setBackNavBtn
{
    self.title= @"选择外观";
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
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSArray *arr = @[@"不限",@"炫目金",@"凛冽白",@"摩登棕",@"澎湃蓝",@"锐利银",@"凌厉红",@"狂野黑",@"自定义外观"];
    cell.textLabel.text = arr[indexPath.row];
    CGFloat width = self.view.bounds.size.width;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(width-25, 17, 8, 13);
    [btn setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    [cell.contentView addSubview:btn];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 8) {
        NController *nC = [[NController alloc] init];
        [self.navigationController pushViewController:nC animated:YES];
    }else
    {
    ContentColorController *conC = [[ContentColorController alloc] init];
    [self.navigationController pushViewController:conC animated:YES];
    }
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
