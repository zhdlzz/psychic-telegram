//
//  PatternView.h
//  ZhaoChe
//
//  Created by 严佳文 on 16/6/28.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatternView : UIView

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnImage;
+(instancetype)xibWithPatternView;

@end
