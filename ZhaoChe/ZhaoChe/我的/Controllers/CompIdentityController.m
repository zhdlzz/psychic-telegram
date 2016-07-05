//
//  CompIdentityController.m
//  ZhaoChe
//
//  Created by zdl on 16/6/29.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "CompIdentityController.h"
#import "UIColor+ZhaoChe.h"
#import "CompTypeController.h"
#import "MainSaleController.h"
@interface CompIdentityController ()
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;
@property (weak, nonatomic) IBOutlet UIButton *compNameBtn;
@property (weak, nonatomic) IBOutlet UIButton *cityName;
@property (weak, nonatomic) IBOutlet UIButton *addressBtn;
@property (weak, nonatomic) IBOutlet UIButton *typeCompBtn;
@property (weak, nonatomic) IBOutlet UIButton *mainSaleBtn;

@end

@implementation CompIdentityController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackNavBtn];
    self.finishBtn.backgroundColor = [UIColor zc_BlueColor];
    self.finishBtn.layer.cornerRadius = 8;
}
-(void)setBackNavBtn
{
    self.title= @"企业信息认证";
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
- (IBAction)compNameAction:(id)sender {
}
- (IBAction)citySelect:(id)sender {
}
- (IBAction)addressAction:(id)sender {
}
- (IBAction)typeCompAction:(id)sender {
    CompTypeController *typeC =[[CompTypeController alloc] init];
    [self.navigationController pushViewController:typeC animated:YES];
}
- (IBAction)mainSaleAction:(id)sender {
    MainSaleController *mainC = [[MainSaleController alloc] init];
    [self.navigationController pushViewController:mainC animated:YES];
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
