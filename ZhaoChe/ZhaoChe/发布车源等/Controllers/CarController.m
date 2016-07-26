//
//  CarController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/13.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "CarController.h"

@interface CarController ()

@end

@implementation CarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
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
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(width-40, 0, 40, 20);
    [btn1 setTitle:@"完成" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(setSetting) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    self.navigationItem.rightBarButtonItem = btnItem;
}

-(void)btnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setSetting
{
    NSLog(@"完成");
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
