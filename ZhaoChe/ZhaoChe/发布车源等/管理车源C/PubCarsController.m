//
//  PubCarsController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/26.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "PubCarsController.h"
#import "PubCarCell.h"
#import "UIColor+ZhaoChe.h"
@interface PubCarsController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PubCarsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
    // Do any additional setup after loading the view from its nib.
}
-(void)setBackNavBtn
{
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
    [btnR setTitle:@"发布" forState:UIControlStateNormal];
    [btnR addTarget:self action:@selector(setNextStep) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btnR];
    self.navigationItem.rightBarButtonItem = btnItem;
 
    NSArray *arr = @[@"已上架",@"已下架"];
    UISegmentedControl *segC = [[UISegmentedControl alloc] initWithItems:arr];
    [segC addTarget:self action: @selector(controlPressed:)forControlEvents: UIControlEventValueChanged];
    segC.selectedSegmentIndex = 0;
    self.navigationItem.titleView =segC;
}


- (void)controlPressed:(UISegmentedControl *)segC {
    NSInteger selectedSegment = segC.selectedSegmentIndex;
    NSLog(@"Segment %ld selected\n", selectedSegment);
}


-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setNextStep
{
    NSLog(@"发布》》》》》");
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CELLID";
    PubCarCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"PubCarCell" owner:self options:nil].lastObject;
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    CGColorRef color = [UIColor zc_OrangeColor].CGColor;
    cell.noSaleBtn.layer.borderColor = color;
    cell.noSaleBtn.layer.borderWidth = 1;
    cell.noSaleBtn.layer.masksToBounds = YES;
    [cell.noSaleBtn addTarget:self action:@selector(xijiaAction) forControlEvents:UIControlEventTouchUpInside];
    [cell.noSaleBtn setTitleColor:[UIColor zc_OrangeColor] forState:UIControlStateNormal];
    
    cell.setBtn.layer.borderColor = color;
    cell.setBtn.layer.borderWidth = 1;
    cell.setBtn.layer.masksToBounds = YES;
    [cell.setBtn addTarget:self action:@selector(bianjiAction) forControlEvents:UIControlEventTouchUpInside];
    [cell.setBtn setTitleColor:[UIColor zc_OrangeColor] forState:UIControlStateNormal];
    
    cell.refreshBtn.layer.borderColor = color;
    cell.refreshBtn.layer.borderWidth = 1;
    cell.refreshBtn.layer.masksToBounds = YES;
    [cell.refreshBtn addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventTouchUpInside];
    [cell.refreshBtn setTitleColor:[UIColor zc_OrangeColor] forState:UIControlStateNormal];
    return cell;
}
-(void)xijiaAction
{
    NSLog(@">>>>>下架");
}

-(void)bianjiAction
{
    NSLog(@">>>>>编辑");
}
-(void)refreshAction
{
    NSLog(@">>>>>刷新");
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 175;
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
