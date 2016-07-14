//
//  ClickMoreCarView.m
//  ZhaoChe
//
//  Created by 严佳文 on 16/6/30.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "ClickMoreCarView.h"

@implementation ClickMoreCarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)xibWithClickMoreCarView{
    ClickMoreCarView *view = [[[NSBundle mainBundle]loadNibNamed:@"ClickMoreCarView" owner:nil options:nil]firstObject];
    return view;
}
@end
