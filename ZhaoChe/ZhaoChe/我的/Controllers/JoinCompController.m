//
//  JoinCompController.m
//  ZhaoChe
//
//  Created by zdl on 16/6/30.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "JoinCompController.h"
#import "CardIdentityCell.h"
@interface JoinCompController ()<UITableViewDelegate,UITableViewDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)UILabel *labelT;
@end

@implementation JoinCompController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor zc_BackgroundColor];
    self.myTableView.scrollEnabled = NO;
    [self setBackNavBtn];
}
-(void)setBackNavBtn
{
    self.title= @"加入公司";
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

#pragma 界面tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    CardIdentityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"CardIdentityCell" owner:self options:nil].lastObject;
    }
    CGFloat width = self.view.frame.size.width;
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(20, 44, width, 2);
    label.backgroundColor = [UIColor zc_BackgroundColor];
    [cell.contentView addSubview:label];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        NSArray *arr = @[@"公司全称",@"公司类型",@"所在城市"];
        NSArray *arr2 = @[@"上海车团网络信息技术有限公司",@"综合展厅",@"上海市"];
        cell.nameLabel.text = arr[indexPath.row];
        cell.nameLabel.font = [UIFont systemFontOfSize:15];
        
        cell.introduceLabel.text = arr2[indexPath.row];
        cell.introduceLabel.font = [UIFont systemFontOfSize:15];
    }else if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            cell.nameLabel.text = @"公司管理员";
            cell.nameLabel.font = [UIFont systemFontOfSize:13];
            label.frame = CGRectMake(20, 33, self.view.frame.size.width, 2);
            cell.introduceLabel.text = nil;
        }else
        {
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 35, 35)];
            imageV.backgroundColor = [UIColor yellowColor];
            [cell.contentView addSubview:imageV];
            cell.nameLabel.hidden = YES;
            cell.introduceLabel.hidden = YES;
            label.hidden = YES;
            UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 200, 35)];
            label2.text = @"张飞";
            [cell.contentView addSubview:label2];
        }
    }else
    {
        if (indexPath.row == 0) {
            cell.nameLabel.text = @"加入请求";
            cell.nameLabel.font = [UIFont systemFontOfSize:13];
            label.frame = CGRectMake(20, 33, self.view.frame.size.width, 2);
            cell.introduceLabel.text = nil;
        }else
        {
            cell.nameLabel.hidden = YES;
            cell.introduceLabel.hidden = YES;
            _labelT = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-40, 30)];
            _labelT.text = @"请输入您的加入请求";
            _labelT.font = [UIFont systemFontOfSize:15];
            _labelT.textColor = [UIColor grayColor];
            _labelT.alpha = 0.5;
            UITextView *textV = [[UITextView alloc] initWithFrame:CGRectMake(20, 15, width-40, 80)];
            textV.delegate =self;
            textV.font = [UIFont systemFontOfSize:15];
            [textV addSubview:_labelT];
            [cell.contentView addSubview:textV];
            
        }
    }
    return cell;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 36;
    }else
        return 10;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        UIView *pView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 36)];
        pView.backgroundColor = [UIColor zc_PinkBackgroundColor];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(80, 10, 20, 20);
        [btn setImage:[UIImage imageNamed:@"提示"] forState:UIControlStateNormal];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110,10 , width-120, 20)];
        label.text = @"该公司已经存在，请申请加入";
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor zc_PinkFontColor];
   
        [pView addSubview:btn];
        [pView addSubview:label];
        return pView;
    }else
        return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 33;
        }else
        {
            return 55;
        }
    }else if (indexPath.section == 2)
    {
        if (indexPath.row == 0) {
            return 33;
        }else
        {
            return 95;
        }
    }
    else
    {
        return 44;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        CGFloat width =[UIScreen mainScreen].bounds.size.width;
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 80)];
        footView.backgroundColor = [UIColor zc_BackgroundColor];
        UIButton *footBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        footBtn.frame = CGRectMake(20, 40,width-40, 40);
        footBtn.backgroundColor = [UIColor zc_BlueColor];
        [footBtn setTitle:@"申请加入" forState:UIControlStateNormal];
        [footBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        footBtn.layer.cornerRadius = 8;
        [footBtn addTarget:self action:@selector(joinGiven) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:footBtn];
        return footView;
    }else
    {
        return nil;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 80;
    }else return 0;
}
-(void)joinGiven
{
    NSLog(@"申请加入");
}
#pragma textView 代理
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if(![text isEqualToString:@""])
    {
        _labelT.hidden = YES;
    }
    if([text isEqualToString:@""]){
        _labelT.hidden = NO;
    }
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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
