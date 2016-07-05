//
//  CardIdentityController.m
//  ZhaoChe
//
//  Created by zdl on 16/6/30.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "CardIdentityController.h"
#import "CardIdentityCell.h"
#import "UIColor+ZhaoChe.h"
#import "JoinCompController.h"
@interface CardIdentityController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@end

@implementation CardIdentityController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];

}
-(void)setBackNavBtn
{
    self.title= @"名片认证";
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
    [btnR setTitle:@"重新拍摄" forState:UIControlStateNormal];
    [btnR addTarget:self action:@selector(setNextStep) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btnR];
    self.navigationItem.rightBarButtonItem = btnItem;
}

-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setNextStep
{
    NSLog(@"重新拍摄");
}

#pragma tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    CardIdentityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"CardIdentityCell" owner:self options:nil].lastObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==1) {
        if (indexPath.row == 1) {
            cell.introduceLabel.frame = CGRectMake(104, 7, [UIScreen mainScreen].bounds.size.width-104, 78);
            cell.nameLabel.text=@"公司地址";
            cell.introduceLabel.text = @"上海市浦东新区世纪大道1568号中建大厦11楼1103室";
            cell.introduceLabel.numberOfLines = 0;
            tableView.rowHeight = 78;
            
        }else if (indexPath.row == 0)
        {
            tableView.rowHeight = 44;
            cell.nameLabel.text = @"公司";
        }
        else
        {
            cell.nameLabel.text=@"职位";
            tableView.rowHeight = 44;
        }
    }
    NSArray *phoneArr = @[@"手机",@"工作传真",@"工作电话"];
    if (indexPath.section==2) {
        cell.nameLabel.text = phoneArr[indexPath.row];
    }
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 ) {
        return 220;
    }else
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        CGFloat width =[UIScreen mainScreen].bounds.size.width;
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 220)];
        headView.backgroundColor = [UIColor zc_BackgroundColor];
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 210)];
        imageV.backgroundColor = [UIColor yellowColor];
        [headView addSubview:imageV];
        return headView;
    }else return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        CGFloat height =[UIScreen mainScreen].bounds.size.height;
        CGFloat width =[UIScreen mainScreen].bounds.size.width;
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, height-49, width, 49)];
        footView.backgroundColor = [UIColor zc_BackgroundColor];
        UIButton *footBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        footBtn.frame = CGRectMake(20, 4,width-40, 40);
        footBtn.backgroundColor = [UIColor zc_BlueColor];
        [footBtn setTitle:@"保存" forState:UIControlStateNormal];
        [footBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        footBtn.layer.cornerRadius = 8;
        [footBtn addTarget:self action:@selector(saveSometiing) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:footBtn];
        return footView;
    }else
    {
      return nil;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 49;
    }else
    {
        return 0;
    }
}

-(void)saveSometiing
{
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"确认信息无误？点击可编辑" delegate:self cancelButtonTitle:@"再检查一下" otherButtonTitles:@"是，保存", nil];
    [alertV show];
}
#pragma alert 代理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0)
{
   if(buttonIndex==0)
    {
      NSLog(@"在检查一下");
    }else{
      JoinCompController *jC= [[JoinCompController alloc]init];
      [self.navigationController pushViewController:jC animated:YES];
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
