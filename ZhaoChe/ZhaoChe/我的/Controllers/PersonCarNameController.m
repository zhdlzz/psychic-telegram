//
//  PersonCarNameController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/4.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "PersonCarNameController.h"

@interface PersonCarNameController ()

@end

@implementation PersonCarNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
    // Do any additional setup after loading the view from its nib.
}
-(void)setBackNavBtn
{
    self.title= @"自定义车型名称";
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
    [btnR setTitle:@"完成" forState:UIControlStateNormal];
    [btnR addTarget:self action:@selector(setNextStep) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btnR];
    self.navigationItem.rightBarButtonItem = btnItem;
}
-(void)setNextStep
{
    NSLog(@"完成");
}
-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
