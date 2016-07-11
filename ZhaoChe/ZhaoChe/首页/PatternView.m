//
//  PatternView.m
//  ZhaoChe
//
//  Created by 严佳文 on 16/6/28.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "PatternView.h"

@implementation PatternView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)xibWithPatternView{
    PatternView *patternView = [[[NSBundle mainBundle]loadNibNamed:@"PatternView" owner:nil options:nil]firstObject];
    return patternView;
}


@end
