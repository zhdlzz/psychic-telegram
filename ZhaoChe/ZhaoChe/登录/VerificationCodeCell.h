//
//  VerificationCodeCell.h
//  ZhaoChe
//
//  Created by chetuan003 on 6/24/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerBtn.h"

typedef void(^TimerBtnClickedBlock)();

@interface VerificationCodeCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *codeInputField;
@property (weak, nonatomic) IBOutlet TimerBtn *timerBtn;
@property (copy, nonatomic) TimerBtnClickedBlock timerBtnClickedBlock;

@property (copy, nonatomic) void(^codeValueChangedBlock)(NSString *);

- (IBAction)codeValueChanged:(UITextField *)sender;
- (IBAction)timberBtnClicked:(TimerBtn *)sender;
- (void)setTimerBtnCountDown:(BOOL)countDown;

@end
