//
//  MobileInputCell.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/24/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "MobileInputCell.h"

#define MOBILE_LENGTH 11

@implementation MobileInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    BOOL returnKey = [string rangeOfString:@"\n"].location != NSNotFound;
    return newLength <= MOBILE_LENGTH || returnKey;
}


- (IBAction)mobileNumChanged:(UITextField *)sender {
    if (self.mobileNumChangedBlock) {
        NSString *mobileString = self.mobileInputField.text;
        if (mobileString.length > 11) {
            mobileString = [mobileString substringToIndex:11];
        }
        self.mobileNumChangedBlock(mobileString);
    }
}

@end
