//
//  FindCarViewController.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "FindCarViewController.h"

@interface FindCarViewController ()
@property (strong, nonatomic) HMSegmentedControl *segmentedControlHM;
@end

@implementation FindCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configControlView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configControlView{
    NSArray *titles = @[@"全部",@"下意向金"];
    self.segmentedControlHM = [[HMSegmentedControl alloc] initWithSectionTitles:titles];
    self.segmentedControlHM.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
    [self.view addSubview:self.segmentedControlHM];
    
    self.segmentedControlHM.titleTextAttributes = @{
                                                    NSForegroundColorAttributeName :[UIColor zc_NavbarTitleColor],
                                                    NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:16]
                                                    };
    self.segmentedControlHM.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor zc_BlueColor]};
    self.segmentedControlHM.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
//    self.segmentedControlHM.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;

    self.segmentedControlHM.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControlHM.selectionIndicatorHeight = 2;
    self.segmentedControlHM.selectionIndicatorColor = [UIColor zc_BlueColor];
    //分割线
    self.segmentedControlHM.verticalDividerColor = [UIColor zc_BackgroundColor];
    self.segmentedControlHM.verticalDividerWidth = 1;
    self.segmentedControlHM.backgroundColor = [UIColor whiteColor];
    self.segmentedControlHM.verticalDividerEnabled = YES;
    
//    [self filterOrders:0 AndCitys:citys];
//    [self.segmentedControlHM addTarget:self action:@selector(filterOrders:AndCitys:) forControlEvents:UIControlEventValueChanged];
}
@end
