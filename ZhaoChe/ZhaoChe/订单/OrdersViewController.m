//
//  OrdersViewController.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "OrdersViewController.h"
#import "PublishCarController.h"
#import "PubCarsController.h"
#import "SearchCarController.h"
@interface OrdersViewController ()

@end

@implementation OrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"订单";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)text:(id)sender {
    PublishCarController *pubC = [[PublishCarController alloc]init];
    pubC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pubC animated:YES];
}

- (IBAction)second:(id)sender {
    SearchCarController *pubC =[[SearchCarController alloc]init];
    pubC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pubC animated:YES];
}


- (IBAction)third:(id)sender {
    PubCarsController *pubC =[[PubCarsController alloc]init];
    pubC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:pubC animated:YES];
}

- (IBAction)forth:(id)sender {
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
