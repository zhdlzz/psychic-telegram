//
//  HeaderView.h
//  ZhaoChe
//
//  Created by 严佳文 on 16/6/29.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;
+(instancetype)xibWithHeaderViewY:(CGFloat)headY title:(NSString *)title subTitle:(NSString *)subTitle;

@end
