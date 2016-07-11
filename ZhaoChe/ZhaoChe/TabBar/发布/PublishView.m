//
//  PublishView.m
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import "PublishView.h"
#import <pop/POP.h>

@interface PublishView ()

@property (strong, nonatomic) NSArray *infos;
@property (strong, nonatomic) NSMutableArray *btns;

@end

@implementation PublishView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
        bottomView.backgroundColor = [UIColor colorWithRed:244 / 255. green:250 / 255. blue:253 / 255. alpha:1.];
        [self addSubview:bottomView];
        
        // 添加dimiss按钮
        self.dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.dismissBtn setBackgroundImage:[UIImage imageNamed:@"发布取消"] forState:UIControlStateNormal];
        [self.dismissBtn sizeToFit];
        self.dismissBtn.center = CGPointMake(bottomView.frame.size.width / 2, bottomView.frame.size.height / 2);
        [self.dismissBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:self.dismissBtn];
        
        // 添加模糊效果
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - bottomView.frame.size.height)];
        effectView.effect = blur;
        [self addSubview:effectView];
        
        // 添加action按钮
        CGFloat spacing = 8.; // 按钮图片与标题的间距
        CGFloat topSpacing = (8. / 21.) * SCREEN_HEIGHT; // 按钮距离顶部距离
        CGFloat btnSpacing = (10. / 47.) * SCREEN_WIDTH; // 按钮间距

        for (int i = 0; i < self.infos.count; i++) {
            NSString *title = self.infos[i];
            UIButton *btn = [[UIButton alloc] init];
            btn.tag = i;
            [btn setImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
            [btn setTitle:title forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.titleLabel.shadowColor = [UIColor redColor];
            btn.titleLabel.shadowOffset = CGSizeMake(12., 12.);
            [btn setTitleColor:[UIColor colorWithRed:71 / 255. green:71 / 255. blue:71 / 255. alpha:1.] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:71 / 255. green:71 / 255. blue:71 / 255. alpha:.8] forState:UIControlStateHighlighted];
            [btn addTarget:self action:@selector(actionBtnClicked:) forControlEvents:UIControlEventTouchUpInside];

            CGSize imageSize = btn.imageView.image.size;
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0)];

            CGSize titleSize = [btn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(- (titleSize.height + spacing), 0.0, 0.0, - titleSize.width)];
            
            CGFloat sideToSideLength = btn.imageView.image.size.width * 2 + btnSpacing; // 按钮＋间距＋按钮总长

            CGFloat sideSpacing = 0;
            if (SCREEN_WIDTH == 320) {
                sideSpacing = (SCREEN_WIDTH - sideToSideLength) / 4.;
            }
            
            if (SCREEN_WIDTH == 375 || SCREEN_WIDTH == 414) {
                sideSpacing = (SCREEN_WIDTH - sideToSideLength) / 3.;
            }
            
            if (i < 2) {
                btn.frame = CGRectMake(sideSpacing + (imageSize.width + btnSpacing) * i , topSpacing, 0, 0);
            } else {
                i = i - 2;
                btn.frame = CGRectMake(sideSpacing + (imageSize.width + btnSpacing) * i, topSpacing + imageSize.height + titleSize.height + 30, 0, 0);
                i = i + 2;
            }
            
            [btn sizeToFit];
            [self addSubview:btn];
            
            [self.btns addObject:btn];
        }
    }
    return self;
}

- (void)dismiss {
    if (self.dismissBtnClickedBlock) {
        self.dismissBtnClickedBlock();
    }
}

- (void)actionBtnClicked:(UIButton *)sender {
    if (self.actionBtnClickedBlock) {
        self.actionBtnClickedBlock(sender.tag);
    }
}

- (void)animate {
    for (UIButton *btn in self.btns) {
        // 添加动画
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        anim.fromValue = [NSValue valueWithCGSize:CGSizeMake(1.1, 1.1)];
        anim.toValue = [NSValue valueWithCGSize:CGSizeMake(1., 1.)];
        anim.springBounciness = 5.;
        anim.springSpeed = 5.;
        [btn pop_addAnimation:anim forKey:nil];
    }
}

- (NSArray *)infos {
    if (!_infos) {
        _infos = @[
                   @"发布车源",
                   @"发布寻车",
                   @"管理车源",
                   @"管理寻车"
                   ];
    }
    return _infos;
}

- (NSMutableArray *)btns {
    if (!_btns) {
        _btns = [NSMutableArray arrayWithCapacity:0];
    }
    return _btns;
}

@end
