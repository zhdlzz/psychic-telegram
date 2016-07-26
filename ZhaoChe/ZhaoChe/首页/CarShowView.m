//
//  CarShowView.m
//  ZhaoChe
//
//  Created by 严佳文 on 16/6/29.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "CarShowView.h"

@implementation CarShowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(instancetype)xibWithCarShowView{
    CarShowView * view = [[[NSBundle mainBundle]loadNibNamed:@"CarShowView" owner:nil options:nil]firstObject];
    return view;
}
@end
