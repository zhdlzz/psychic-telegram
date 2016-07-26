//
//  PubCarController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/12.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "PubCarController.h"
#import "UIColor+ZhaoChe.h"
#import "PubDetailController.h"
@interface PubCarController ()
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation PubCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nextBtn.layer.cornerRadius = 8;
    self.nextBtn.backgroundColor = [UIColor zc_BlueColor];
    [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackNavBtn];
}

-(void)setBackNavBtn
{
    self.title= @"发布车源";
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

- (IBAction)nextAction:(id)sender {
    PubDetailController *pubDC = [[PubDetailController alloc] init];
    [self.navigationController pushViewController:pubDC animated:YES];
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
