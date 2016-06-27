//
//  ZCTabBar.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "ZCTabBar.h"

@interface ZCTabBar ()



@end

@implementation ZCTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.publishBtn setBackgroundImage:[UIImage imageNamed:@"TabBar添加"] forState:UIControlStateNormal];
        [self.publishBtn addTarget:self action:@selector(publishBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.publishBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.publishBtn.bounds = CGRectMake(0, 0, self.publishBtn.currentBackgroundImage.size.width, self.publishBtn.currentBackgroundImage.size.height);
    self.publishBtn.center = CGPointMake(self.frame.size.width / 2., self.frame.size.height / 2.);
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.frame.size.width / 5;
    CGFloat height = self.frame.size.height;
    
    NSInteger idx = 0;
    
    for (UIView *btn in self.subviews) {
        if (![btn isKindOfClass:[UIControl class]] || btn == self.publishBtn) continue;
        x = width * ((idx > 1) ? (idx + 1) : idx);
        btn.frame = CGRectMake(x, y, width, height);
        idx++;
    }
}

- (void)publishBtnClicked:(UIButton *)sender {
    if (self.publishBtnClickedBlock) {
        self.publishBtnClickedBlock();
    }
}

@end
