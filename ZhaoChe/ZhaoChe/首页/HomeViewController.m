//
//  HomeViewController.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTopView.h"
#import "PatternView.h"
#import "HeaderView.h"
#import "PatternView.h"
#import "HeaderScrollView.h"
#import "NewCarShowView.h"
#import "ClickMoreCarView.h"
#import "SearchResultViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) UITableView *tableView;
@property (nonatomic,strong)SearchResultViewController *srVC;
@property (nonatomic,strong) UISearchController *searchController;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.bounces = NO;
    
    [self configControlView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)configControlView{
    //1.topView
    HomeTopView *topView = [HomeTopView xibWithHomeTopView];
    topView.frame = CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_WIDTH *(380/750.0));
    
    [self.scrollView addSubview:topView];
    
    //创建搜索结果的vc
    self.srVC = [SearchResultViewController new];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:self.srVC];
    topView.searchBar = self.searchController.searchBar;
    //允许借助红色tvc的区域展示绿色tvc的结果
    self.definesPresentationContext = YES;
       
    
    //2.patternView
    NSArray * patternArr = @[@"担保服务",@"定金寻车",@"买卖托管"];
    UIView *ptArrView = [UIView new];
    ptArrView.backgroundColor = [UIColor whiteColor];
    ptArrView.frame = CGRectMake(0, CGRectGetMaxY(topView.frame), SCREEN_WIDTH, 106);
    
    [self.scrollView addSubview:ptArrView];
    CGFloat patternW = 75;
    CGFloat patternH = 106;
    CGFloat margin = ((SCREEN_WIDTH/3.0) -patternW)/2.0;
    for (int i = 0; i<patternArr.count; i++) {
        CGFloat patternX = margin +(patternW + 2*margin)*i;
        PatternView *ptView = [PatternView xibWithPatternView];
        ptView.frame = CGRectMake(patternX, 0, patternW, patternH);
        [ptView.btnImage setBackgroundImage:[UIImage imageNamed:patternArr[i]] forState:UIControlStateNormal];
        ptView.lblTitle.text = patternArr[i];
        [ptArrView addSubview:ptView];
    }
    
    //3.headerView
    HeaderView *saleHeaderView = [HeaderView xibWithHeaderViewY:CGRectGetMaxY(ptArrView.frame) +10 title:@"渠道特卖" subTitle:@"进入 >"];
    [self.scrollView addSubview:saleHeaderView];
    
    HeaderScrollView * HScrollView = [HeaderScrollView xibWithHeaderScrollView];
    HScrollView.frame = CGRectMake(0, CGRectGetMaxY(saleHeaderView.frame) +1, SCREEN_WIDTH, 226);
    [self.scrollView addSubview:HScrollView];
    
    //4.最新车源
    HeaderView *newCarView = [HeaderView xibWithHeaderViewY:CGRectGetMaxY(HScrollView.frame) +10 title:@"最新车源" subTitle:@"更多 >"];
    [self.scrollView addSubview:newCarView];
    
    CGFloat topMargin = CGRectGetMaxY(newCarView.frame)+1;
    for (int i = 0; i < 3; i++) {
        NewCarShowView * ncsView = [NewCarShowView xibWithNewCarShowView];
        CGFloat ncsY = topMargin + (132+5)*i;
        ncsView.arr = patternArr;

        ncsView.frame = CGRectMake(0, ncsY, SCREEN_WIDTH, 132);
        [self.scrollView addSubview:ncsView];
    }
    
    //5. ClickMoreCarView
    CGFloat maxY = topMargin + (132+5)*3-5;
    ClickMoreCarView *cmcView = [ClickMoreCarView xibWithClickMoreCarView];
    cmcView.frame = CGRectMake(0, maxY, SCREEN_WIDTH, 50);
    [self.scrollView addSubview:cmcView];
    
    self.scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(cmcView.frame)-44);

}

@end
