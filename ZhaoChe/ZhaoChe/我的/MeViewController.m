//
//  MeViewController.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "MeViewController.h"
#import "ZDLMyCenterCell.h"
#import "UIColor+ZhaoChe.h"
#import "IdentityController.h"
#import "PersonCenterController.h"
@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.view.backgroundColor = [UIColor zc_BackgroundColor];
    self.myTableView.scrollEnabled = NO;
    [self setNavItems];
}

#pragma 导航栏右侧设置按钮
-(void)setNavItems
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(width-40, 0, 20, 20);
    [btn setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(setSetting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = btnItem;
}

#pragma 界面tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    ZDLMyCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ZDLMyCenterCell" owner:self options:nil].lastObject;
    }
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(20, 44, self.view.frame.size.width, 2);
    label.backgroundColor = [UIColor zc_BackgroundColor];
    [cell.contentView addSubview:label];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section== 0) {
        if (indexPath.row == 0) {
            cell.nameLabel.text = @"身份认证";
            [cell.iconBtn setImage:[UIImage imageNamed:@"身份认证"] forState:UIControlStateNormal];
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(width-90, 7, 60, 30)];
            label.text = @"待审核";
            label.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:label];
        }else
        {
            cell.nameLabel.text = @"会员服务";
            [cell.iconBtn setImage:[UIImage imageNamed:@"会员服务"] forState:UIControlStateNormal];
        }
    }else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            cell.nameLabel.text = @"收藏车源";
            [cell.iconBtn setImage:[UIImage imageNamed:@"收藏"] forState:UIControlStateNormal];
        }else
        {
            cell.nameLabel.text = @"关注商家";
            [cell.iconBtn setImage:[UIImage imageNamed:@"店铺收藏"] forState:UIControlStateNormal];
        }
        
    }else{
        if (indexPath.row == 0) {
            cell.nameLabel.text = @"邀请好友注册";
            [cell.iconBtn setImage:[UIImage imageNamed:@"邀请"] forState:UIControlStateNormal];
        }else
        {
            cell.nameLabel.text = @"公司账号管理";
            [cell.iconBtn setImage:[UIImage imageNamed:@"公司账号管理"] forState:UIControlStateNormal];
        }
    }
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIButton *Icon = [UIButton buttonWithType:UIButtonTypeCustom];
    Icon.frame = CGRectMake(width-25, 14.5, 8, 15);
    [Icon setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    [cell.contentView addSubview:Icon];
    cell.nameLabel.font = [UIFont systemFontOfSize:15];
    return cell;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 126;
    }else
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 126)];
        headView.backgroundColor = [UIColor whiteColor];
        
        UIView *pView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 36)];
        pView.backgroundColor = [UIColor zc_PinkBackgroundColor];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(50, 10, 20, 20);
        [btn setImage:[UIImage imageNamed:@"提示"] forState:UIControlStateNormal];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80,10 , width-120, 20)];
        label.text = @"账户未通过信息认证，请提交信息进行认证";
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor zc_PinkFontColor];
        
        UIButton *btnIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        btnIcon.frame = CGRectMake(20, 46, 60, 60);
        btnIcon.layer.cornerRadius = 30;
        [btnIcon setImage:[UIImage imageNamed:@"头像"] forState:UIControlStateNormal];
        [btnIcon addTarget:self action:@selector(setHeadImage) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(95,49 , width-120, 20)];
        label1.text = @"18801735656";
        label1.font = [UIFont systemFontOfSize:13];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(95,82 , width-120, 20)];
        label2.text = @"未身份认证";
        label2.alpha = 0.6;
        label2.font = [UIFont systemFontOfSize:13];
        
        UIButton *Icon = [UIButton buttonWithType:UIButtonTypeCustom];
        Icon.frame = CGRectMake(width-25, 70, 8, 15);
        [Icon setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
        [Icon addTarget:self action:@selector(moreInformations) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *label3 = [[UILabel alloc]init];
        label3.frame = CGRectMake(0, 116, width, 10);
        label3.backgroundColor = [UIColor zc_BackgroundColor];

        [pView addSubview:btn];
        [pView addSubview:label];
        [headView addSubview:pView];
        [headView addSubview:btnIcon];
        [headView addSubview:label1];
        [headView addSubview:label2];
        [headView addSubview:Icon];
        [headView addSubview:label3];
        return headView;
    }else{
        return nil;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            IdentityController *idC = [[IdentityController alloc]init];
            idC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:idC animated:YES];
        }
    }
}

-(void)moreInformations
{
    PersonCenterController *perCC = [[PersonCenterController alloc] init];
    perCC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:perCC animated:YES];
}

-(void)setSetting
{
    NSLog(@"设置");
}
-(void)setHeadImage
{
    NSLog(@"头像");
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
