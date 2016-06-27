//
//  ZCTabBarController.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "ZCTabBarController.h"
#import "HomeViewController.h"
#import "FindCarViewController.h"
#import "OrdersViewController.h"
#import "MeViewController.h"
#import "ZCTabBar.h"

@interface ZCTabBarController ()

@end

@implementation ZCTabBarController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor zc_BackgroundColor];
    
    // 设置TabBar样式
    [[UITabBar appearance] setTintColor:[UIColor zc_BlueColor]];
    [[UITabBar appearance] setBackgroundColor:[UIColor zc_TabbarBackgroundColor]];

    NSMutableDictionary *normalAttris = [NSMutableDictionary dictionary];
    normalAttris[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    normalAttris[NSForegroundColorAttributeName] = [UIColor zc_TabbarTitleColor];
    
    NSMutableDictionary *selectedAttris = [NSMutableDictionary dictionary];
    selectedAttris[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    selectedAttris[NSForegroundColorAttributeName] = [UIColor zc_BlueColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:normalAttris forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:selectedAttris forState:UIControlStateSelected];
    
    // 添加子视图控制器
    [self addChildViewControllers];
    
    // 替换自定义TabBar
    ZCTabBar *zcTabBar = [[ZCTabBar alloc] init];
    [self setValue:zcTabBar forKey:@"tabBar"];
    zcTabBar.actionBtnClickedBlock = ^{
        NSLog(@">>><<<");
    };
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)addChildViewControllers {
    // 首页
    UIStoryboard *homeSB = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UINavigationController *homeNav = [homeSB instantiateInitialViewController];
    homeNav.tabBarItem.image = [UIImage imageNamed:@"首页"];
    homeNav.tabBarItem.selectedImage = [UIImage imageNamed:@"首页高亮"];
    homeNav.tabBarItem.title = @"首页";
    [self addChildViewController:homeNav];
    
    // 寻车
    UIStoryboard *findCarSB = [UIStoryboard storyboardWithName:@"FindCar" bundle:nil];
    UINavigationController *findCarNav = [findCarSB instantiateInitialViewController];
    findCarNav.tabBarItem.image = [UIImage imageNamed:@"寻车"];
    findCarNav.tabBarItem.selectedImage = [UIImage imageNamed:@"寻车高亮"];
    findCarNav.tabBarItem.title = @"寻车";
    [self addChildViewController:findCarNav];
    
    // 订单
    OrdersViewController *ordersVC = [[OrdersViewController alloc] init];
    UINavigationController *ordersNav = [[UINavigationController alloc] initWithRootViewController:ordersVC];
    ordersNav.tabBarItem.image = [UIImage imageNamed:@"订单"];
    ordersNav.tabBarItem.selectedImage = [UIImage imageNamed:@"订单高亮"];
    ordersNav.tabBarItem.title = @"订单";
    [self addChildViewController:ordersNav];
    
    // 我的
    MeViewController *meVC = [[MeViewController alloc] init];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:meVC];
    meNav.tabBarItem.image = [UIImage imageNamed:@"我的"];
    meNav.tabBarItem.selectedImage = [UIImage imageNamed:@"我的高亮"];
    meNav.tabBarItem.title = @"我的";
    [self addChildViewController:meNav];
}



@end
