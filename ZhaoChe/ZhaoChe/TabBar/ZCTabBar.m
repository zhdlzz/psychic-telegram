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
        self.actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.actionBtn setBackgroundImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [self.actionBtn addTarget:self action:@selector(actionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.actionBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.actionBtn.bounds = CGRectMake(0, 0, self.actionBtn.currentBackgroundImage.size.width, self.actionBtn.currentBackgroundImage.size.height);
    self.actionBtn.center = CGPointMake(self.frame.size.width / 2., self.frame.size.height / 2.);
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.frame.size.width / 5;
    CGFloat height = self.frame.size.height;
    
    NSInteger idx = 0;
    
    for (UIView *btn in self.subviews) {
        if (![btn isKindOfClass:[UIControl class]] || btn == self.actionBtn) continue;
        x = width * ((idx > 1) ? (idx + 1) : idx);
        btn.frame = CGRectMake(x, y, width, height);
        idx++;
    }
}

- (void)actionBtnClicked:(UIButton *)sender {
    if (self.actionBtnClickedBlock) {
        self.actionBtnClickedBlock();
    }
}

@end
