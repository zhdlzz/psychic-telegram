//
//  CompanyController.m
//  ZhaoChe
//
//  Created by zdl on 16/6/29.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "CompanyController.h"
#import "CompIdentityController.h"
#import "JoinCompController.h"
@interface CompanyController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CompanyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
}
-(void)setBackNavBtn
{
    self.title= @"公司名称";
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
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIButton *btnR = [UIButton buttonWithType:UIButtonTypeSystem];
    btnR.frame = CGRectMake(width-40, 0, 60, 20);
    [btnR setTitle:@"下一步" forState:UIControlStateNormal];
    [btnR addTarget:self action:@selector(setNextStep) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btnR];
    self.navigationItem.rightBarButtonItem = btnItem;
}
-(void)setNextStep
{
    CompIdentityController *ccIc = [[CompIdentityController alloc] init];
    [self.navigationController pushViewController:ccIc animated:YES];
}
-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = @"上海车团网络信息技术有限公司";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JoinCompController *jC = [[JoinCompController alloc] init];
    [self.navigationController pushViewController:jC animated:YES];
}

@end
