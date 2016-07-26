//
//  SearchCarController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/26.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "SearchCarController.h"

#define height self.view.bounds.size.height
#define cellHeight023 height*0.0733
#define cellHeight01 height*0.124
#define cellHeight10 height*0.13
#define cellHeight20 height*0.18

@interface SearchCarController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTV;

@end

@implementation SearchCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
    self.myTV.scrollEnabled = NO;
}
-(void)setBackNavBtn
{
    self.title= @"定金寻车";
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
    if (section == 0) {
        return 3;
    }else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    
    if (indexPath.section == 0) {
        NSArray *arr = @[@"求购车型",@"外观内饰",@"售卖地"];
        cell.textLabel.text = arr[indexPath.row];
        CGFloat width = self.view.bounds.size.width;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(120, 13, width*0.6, 20)];
        label.textColor = [UIColor zc_FontColor666];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentRight;
        
        if (indexPath.row == 0) {
            btn.frame = CGRectMake(width-25, cellHeight01/2.2, 8, 13);
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(120, 15, width*0.6, 20)];
            label1.text = @"2014款帕赛特 1.4 ST。。。。。。";
            label1.textColor = [UIColor zc_FontColor666];
            label1.font = [UIFont systemFontOfSize:14];
            label1.textAlignment = NSTextAlignmentRight;
            
            UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(120, 42, width*0.6, 20)];
            label2.text = @"20.88万";
            label2.textColor = [UIColor zc_FontColor666];
            label2.font = [UIFont systemFontOfSize:14];
            label2.textAlignment = NSTextAlignmentRight;
            
            [cell.contentView addSubview:label2];
            [cell.contentView addSubview:label1];
            
            
        }else
        {
           btn.frame = CGRectMake(width-25, 17, 8, 13);
            NSArray *arr = @[@"",@"不限/不限",@"上海市"];
            label.text = arr[indexPath.row];
           [cell.contentView addSubview:label];
        }
        [cell.contentView addSubview:btn];
        
    }else if (indexPath.section == 1)
    {
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(15, 13, 100, 20)];
        label3.font = [UIFont systemFontOfSize:15];
        label3.text = @"期望成交价";
        [cell.contentView addSubview:label3];
    }else
    {
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(15, 13, 100, 20)];
        label3.font = [UIFont systemFontOfSize:15];
        label3.text = @"备注：";
        [cell.contentView addSubview:label3];
    }
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return cellHeight01;
        }else
        {
            return cellHeight023;
        }
        
    }else if (indexPath.section == 1)
    {
        return cellHeight10;
    }else
    {
        return cellHeight20+20;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
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
