//
//  ContentColorController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/13.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "ContentColorController.h"
#import "WController.h"
#define height self.view.bounds.size.height
#define cellHeight height*0.0733
@interface ContentColorController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ContentColorController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
}
-(void)setBackNavBtn
{
    self.title= @"选择内饰";
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
    NSArray *arr = @[@"不限",@"黑色",@"米色",@"灰色",@"白色",@"棕色",@"红色",@"蓝色",@"自定义内饰"];
    cell.textLabel.text = arr[indexPath.row];
    CGFloat width = self.view.bounds.size.width;
    if (indexPath.row == 8) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(width-25, 17, 8, 13);
        [btn setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
        [cell.contentView addSubview:btn];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 8) {
        WController *wC = [[WController alloc] init];
        [self.navigationController pushViewController:wC animated:YES];
    }
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
