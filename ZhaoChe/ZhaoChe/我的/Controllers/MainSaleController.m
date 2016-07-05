//
//  MainSaleController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/4.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "MainSaleController.h"
#import "ZDLMyCenterCell.h"
#import "PersonCarNameController.h"
@interface MainSaleController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)UIButton *Icon;
@end

@implementation MainSaleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
   
}
-(void)setBackNavBtn
{
    self.title= @"主营品牌";
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
    [btnR setTitle:@"1/3完成" forState:UIControlStateNormal];
    [btnR addTarget:self action:@selector(setNextStep) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btnR];
    self.navigationItem.rightBarButtonItem = btnItem;
}
-(void)setNextStep
{
    NSLog(@"完成进度");
}
-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    ZDLMyCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ZDLMyCenterCell" owner:self options:nil].lastObject;
    }
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    _Icon = [UIButton buttonWithType:UIButtonTypeCustom];
    _Icon.frame = CGRectMake(width-35, 14.5, 15, 15);
    [_Icon setBackgroundImage:[UIImage imageNamed:@"对灰"] forState:UIControlStateNormal];
    UILabel *lineLabel = [[UILabel alloc]init];
    lineLabel.frame = CGRectMake(54, 44, self.view.frame.size.width, 2);
    lineLabel.backgroundColor = [UIColor zc_BackgroundColor];
    [cell.contentView addSubview:lineLabel];
    [cell.contentView addSubview:_Icon];
    if (indexPath.section == 0) {
        cell.iconBtn.hidden = YES;
        cell.nameLabel.hidden = YES;
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(15, 7, 100, 30);
        label.text = @"自定义";
        label.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:label];
         _Icon.frame = CGRectMake(width-25, 14.5, 7, 15);
        [_Icon setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
        [_Icon addTarget:self action:@selector(PersonalAction) forControlEvents:UIControlEventTouchUpInside];
    }else
    {
        [_Icon addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    NSArray *arr = @[@"阿尔法罗密欧",@"奥迪",@"宝马",@"宝马"];
    cell.nameLabel.text = arr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)selectAction:(UIButton *)button
{
    if (button.selected == YES) {
        button.selected = NO;
    }else
    {
        [button setBackgroundImage:[UIImage imageNamed:@"对勾"] forState:UIControlStateNormal];
    }
}
-(void)PersonalAction
{
    PersonCarNameController *perC = [[PersonCarNameController alloc] init];
    [self.navigationController pushViewController:perC animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==0 ) {
        return 0;
    }else
    return 25;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return nil;
    }else
    {
    NSArray *arr = @[@"",@"A",@"B"];
    return arr[section];
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
