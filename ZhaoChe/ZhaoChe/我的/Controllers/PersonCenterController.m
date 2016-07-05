//
//  PersonCenterController.m
//  ZhaoChe
//
//  Created by zdl on 16/7/4.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "PersonCenterController.h"

@interface PersonCenterController ()
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;

@end

@implementation PersonCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoBtn.layer.cornerRadius = 30;
    [self setBackNavBtn];
}
-(void)setBackNavBtn
{
    self.title= @"个人中心";
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


- (IBAction)MoreAction:(id)sender {
    NSLog(@"头像更多");
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
