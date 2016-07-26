//
//  LoginViewController.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/23/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "LoginViewController.h"
#import "TPKeyboardAvoidingTableView.h"
#import "MobileInputCell.h"
#import "VerificationCodeCell.h"
#import "NSString+ZhaoChe.h"

@interface LoginViewController () <UITableViewDataSource>

@property (strong, nonatomic) TPKeyboardAvoidingTableView *tableView;
@property (copy, nonatomic) NSString *mobileString; ///< 手机号码
@property (copy, nonatomic) NSString *codeString; ///< 验证码
@property (strong, nonatomic) UIButton *loginBtn;

@end

@implementation LoginViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手机";
    
    [self setupHeaderView];
    [self setupFooterView];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            MobileInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MobileInputCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setMobileNumChangedBlock:^(NSString *mobileString) {
                self.mobileString = mobileString;
            }];
            [cell.mobileInputField becomeFirstResponder];
            return cell;
        }
            break;
        case 1: {
            VerificationCodeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VerificationCodeCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.timerBtn.enabled = NO;
            [cell.timerBtn zc_backgroundColor:[UIColor zc_BtnEnabledBackgroundColor] forState:UIControlStateNormal];
            [cell.timerBtn zc_backgroundColor:[UIColor colorWithRed:201 / 255. green:201 / 255. blue:201 / 255. alpha:1.] forState:UIControlStateDisabled];
            
            RAC(cell, timerBtn.enabled) = [RACSignal combineLatest:@[RACObserve(self, mobileString)] reduce:^id(NSString *mobileStr){
                return @((mobileStr.length == 11));
            }];
            
            [cell setCodeValueChangedBlock:^(NSString *codeString) {
                self.codeString = codeString;
            }];
            
            __weak VerificationCodeCell *weakCell = cell;
            [cell setTimerBtnClickedBlock:^{
                if (![self.mobileString isValidMobileNum]) { // 判断手机号码
                    [MBProgressHUD hudWithMessage:@"请输入正确的手机号码" image:nil inView:nil afterDelay:DEFAULT_DELAY];
                    return ;
                } else {
                    [weakCell setTimerBtnCountDown:YES];
                    NSString *api = [[NetworkManager sharedManager] getFullAPIWithValue:@"user/sendMsg"];
                    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
                    [params setValue:self.mobileString forKey:@"phone"];
                    [[NetworkManager sharedManager] requestServerAPI:api params:params showHud:YES completionHandler:^(id task, id responseObject, NSError *error) {
                        if (!error) {
                            NSString *code = [responseObject objectForKey:@"code"];
                            NSString *msg = [responseObject objectForKey:@"msg"];
                            if ([code isEqualToString:kServerResponseSuccess]) {
                                //[MBProgressHUD hudWithMessage:@"获取验证码成功" image:nil inView:nil afterDelay:DEFAULT_DELAY];
                            } else {
                                MBPROGRESSHUD_SHOW_SERVER_REQUEST_FAILED;
                            }
                        } else {
                            MBPROGRESSHUD_SHOW_SERVER_REQUEST_ERROR;
                        }
                    }];
                }
            }];
            
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }
}

#pragma mark - Private Methods

- (void)setupHeaderView {
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 42)];
    UILabel *tip = [[UILabel alloc] init];
    tip.textColor = [UIColor zc_FontColor999];
    tip.font = [UIFont systemFontOfSize:12];
    tip.text = @"为方便交易时商家联系您，请先验证手机";
    CGSize tipSize = [tip.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}
                                            context:nil].size;
    CGFloat x = SCREEN_WIDTH / 2 - tipSize.width / 2;
    CGFloat y = header.frame.size.height / 2 - tipSize.height / 2;
    tip.frame = CGRectMake(x, y, tipSize.width, tipSize.height);
    [tip sizeToFit];
    [header addSubview:tip];
    self.tableView.tableHeaderView = header;
}

- (void)setupFooterView {
    UIView *footer = [[UIView alloc] init];
    self.loginBtn.center = CGPointMake(SCREEN_WIDTH / 2, 40 + 20);
    [footer addSubview:self.loginBtn];
    
    UILabel *tip = [[UILabel alloc] init];
    tip.textColor = [UIColor zc_FontColor999];
    tip.font = [UIFont systemFontOfSize:12];
    tip.text = @"客服电话: 400-820-7163";
    CGSize tipSize = [tip.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}
                                            context:nil].size;
    CGFloat x = SCREEN_WIDTH / 2 - tipSize.width / 2;
    CGFloat y = CGRectGetMaxY(self.loginBtn.frame) + 15;
    tip.frame = CGRectMake(x, y, tipSize.width, tipSize.height);
    [tip sizeToFit];
    [footer addSubview:tip];
    
    footer.frame = CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(tip.frame));
    self.tableView.tableFooterView = footer;
}

#pragma mark - Reponse Events

- (void)login {
    
    
}

#pragma mark - Getters

- (TPKeyboardAvoidingTableView *)tableView {
    if (!_tableView) {
        _tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:SCREEN_BOUNDS style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:@"MobileInputCell" bundle:nil] forCellReuseIdentifier:@"MobileInputCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"VerificationCodeCell" bundle:nil] forCellReuseIdentifier:@"VerificationCodeCell"];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 25, 0, 0);
        _tableView.dataSource = self;
        _tableView.bounces = NO;
    }
    return _tableView;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton zc_ButtonWithTitle:@"登录" margin:25 target:self action:@selector(login)];
        RAC(self, loginBtn.enabled) = [RACSignal combineLatest:@[RACObserve(self, mobileString), RACObserve(self, codeString)] reduce:^id(NSString *mobileStr, NSString *codeStr){
            return @(mobileStr.length == 11 && codeStr.length > 0);
        }];
    }
    return _loginBtn;
}

@end
