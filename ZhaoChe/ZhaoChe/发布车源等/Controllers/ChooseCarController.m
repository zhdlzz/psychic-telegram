//
//  ChooseCarController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/11.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "ChooseCarController.h"
#import "UIColor+ZhaoChe.h"
#import "ChooseTypeController.h"
@interface ChooseCarController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ChooseCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
    
}

-(void)setBackNavBtn
{
    self.title= @"选择车系";
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    CGFloat width = self.view.bounds.size.width;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(width-25, 17, 8, 13);
    [btn setBackgroundImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = @"宝马";
    cell.textLabel.textColor = [UIColor zc_FontColor333];
    [cell.contentView addSubview:btn];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ChooseTypeController *typeC = [[ChooseTypeController alloc]init];
    [self.navigationController pushViewController:typeC animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat width = self.view.bounds.size.width;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 30)];
    view.backgroundColor = [UIColor zc_BackgroundColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 30)];
    NSArray *arr = @[@"进口",@"国产",@"Another"];
    label.textColor = [UIColor zc_FontColor999];
    label.font = [UIFont systemFontOfSize:13];
    label.text = arr[section];
    [view addSubview:label];
    return view;
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
