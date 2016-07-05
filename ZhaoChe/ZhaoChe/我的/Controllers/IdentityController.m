//
//  IdentityController.m
//  ZhaoChe
//
//  Created by zdl on 16/6/29.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "IdentityController.h"
#import "UIColor+ZhaoChe.h"
#import "CompanyController.h"
#import "CardIdentityController.h"
@interface IdentityController ()
@property (weak, nonatomic) IBOutlet UIButton *identityBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtb;

@end

@implementation IdentityController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSomethingPerfect];
    [self setBackNavBtn];


}

-(void)setSomethingPerfect
{
    [self.identityBtn setTitleColor:[UIColor zc_OrangeColor] forState:UIControlStateNormal];
    [self.nameTF setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    self.nextBtb.backgroundColor = [UIColor zc_BlueColor];
    self.nextBtb.layer.cornerRadius = 8;
}
-(void)setBackNavBtn
{
    self.title= @"身份认证";
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
- (IBAction)identityAction:(UIButton *)sender {
    CardIdentityController *cardC = [[CardIdentityController alloc] init];
    [self.navigationController pushViewController:cardC animated:YES];
}
- (IBAction)moreBtnAction:(UIButton *)sender {
}
- (IBAction)nextBtnAction:(id)sender {
    CompanyController *cC = [[CompanyController alloc] init];
    [self.navigationController pushViewController:cC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
