//
//  HomeTopView.m
//  ZhaoChe
//
//  Created by 严佳文 on 16/6/28.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "HomeTopView.h"

@implementation HomeTopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)xibWithHomeTopView{
    HomeTopView *topView = [[[NSBundle mainBundle] loadNibNamed:@"HomeTopView" owner:nil options:nil] firstObject];
    return topView;
}

@end
