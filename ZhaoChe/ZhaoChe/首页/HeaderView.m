//
//  HeaderView.m
//  ZhaoChe
//
//  Created by 严佳文 on 16/6/29.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "HeaderView.h"
@interface HeaderView()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;


@end
@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)xibWithHeaderViewY:(CGFloat)headY title:(NSString *)title subTitle:(NSString *)subTitle{
    HeaderView *view = [[[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:nil options:nil]firstObject];
    view.frame = CGRectMake(0, headY, SCREEN_WIDTH, 44);
    view.lblTitle.text = title;
    view.lblSubTitle.text = subTitle;
    return view;
}

@end
