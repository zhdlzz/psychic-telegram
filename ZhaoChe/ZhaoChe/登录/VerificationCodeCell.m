//
//  VerificationCodeCell.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/24/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "VerificationCodeCell.h"

@interface VerificationCodeCell ()

@property (weak, nonatomic) IBOutlet UIView *separatorLine;

@end

@implementation VerificationCodeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.separatorLine.backgroundColor = [UIColor zc_CellSeperatorColor];
    self.timerBtn.startCounting = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)codeValueChanged:(UITextField *)sender {
    if (self.codeValueChangedBlock) {
        NSString *codeString = self.codeInputField.text;
        self.codeValueChangedBlock(codeString);
    }
}

- (IBAction)timberBtnClicked:(TimerBtn *)sender {
    if (self.timerBtnClickedBlock) {
        self.timerBtnClickedBlock();
    }
}

- (void)setTimerBtnCountDown:(BOOL)countDown {
    if (countDown) {
        self.timerBtn.startCounting = YES;
    } else {
        self.timerBtn.startCounting = NO;
    }
}

@end
