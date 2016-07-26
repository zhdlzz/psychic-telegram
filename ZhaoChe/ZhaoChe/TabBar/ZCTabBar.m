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
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    self.publishBtn.width = self.publishBtn.currentBackgroundImage.size.width;
    self.publishBtn.height = self.publishBtn.currentBackgroundImage.size.height;
    self.publishBtn.center = CGPointMake(width * 0.5, height * 0.5);
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnWidth = width / 5;
    CGFloat btnHeight = height;
    
    NSInteger idx = 0;
    
    for (UIView *btn in self.subviews) {
        if (![btn isKindOfClass:[UIControl class]] || btn == self.publishBtn) continue;
        btnX = btnWidth * ((idx > 1) ? (idx + 1) : idx);
        btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        idx++;
    }
}

- (void)publishBtnClicked:(UIButton *)sender {
    if (self.publishBtnClickedBlock) {
        self.publishBtnClickedBlock();
    }
}

@end
