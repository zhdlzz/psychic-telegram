//
//  MobileInputCell.h
//  ZhaoChe
//
//  Created by chetuan003 on 6/24/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobileInputCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *mobileInputField;

@property (copy, nonatomic) void(^mobileNumChangedBlock)(NSString *);

- (IBAction)mobileNumChanged:(UITextField *)sender;

@end
