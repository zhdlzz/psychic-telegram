//
//  NewCarShowView.m
//  ZhaoChe
//
//  Created by 严佳文 on 16/6/29.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import "NewCarShowView.h"
@interface NewCarShowView()

@property (weak, nonatomic) IBOutlet UILabel *lblCompanyName;
@property (weak, nonatomic) IBOutlet UILabel *lblLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *testLabelWidthConstraint;



@end
@implementation NewCarShowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)xibWithNewCarShowView{
    NewCarShowView *view = [[[NSBundle mainBundle]loadNibNamed:@"NewCarShowView" owner:nil options:nil]firstObject];
    if (SCREEN_WIDTH ==320) {
        //根据label中的文字内容来动态计算 高和宽
        NSDictionary *attr2 = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGSize txtSize = [view.lblCompanyName.text boundingRectWithSize:CGSizeMake(165, 26) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr2 context:nil].size;
        view.testLabelWidthConstraint.constant = txtSize.width;
        
    }else{
    //根据label中的文字内容来动态计算 高和宽
    NSDictionary *attr2 = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGSize txtSize = [view.lblCompanyName.text boundingRectWithSize:CGSizeMake(200, 26) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr2 context:nil].size;
    view.testLabelWidthConstraint.constant = txtSize.width;

    }
    return view;
}

-(void)setArr:(NSArray *)arr{
           _arr = arr;
//    self.lblCompanyName.text = @"dsdsskuhfdsjkskdhkshdkshkdhskhdkshdks";
//            CGRect frame = self.lblCompanyName.frame;
//            frame.size.width = 60;
//    self.testLabelWidthConstraint.constant = 120.;
//            self.lblCompanyName.frame = frame;
//    self.lblCompanyName addConstraint:[NSLayoutConstraint constraintWithItem:<#(nonnull id)#> attribute:<#(NSLayoutAttribute)#> relatedBy:<#(NSLayoutRelation)#> toItem:<#(nullable id)#> attribute:<#(NSLayoutAttribute)#> multiplier:<#(CGFloat)#> constant:<#(CGFloat)#>
//
}

//-(void)layoutSubviews{
//    NSLog(@"哈哈哈哈%ld",[self.lblCompanyName.text length]);
//    if (SCREEN_WIDTH == 320) {
//        if ([self.lblCompanyName.text length]> 10) {
//            
//            CGFloat txtX = 15;
//            CGFloat txtY = CGRectGetMaxY(self.lblLine.frame) + 15;
//            //根据label中的文字内容来动态计算 高和宽
//            NSDictionary *attr2 = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
//            CGSize txtSize = [self.lblCompanyName.text boundingRectWithSize:CGSizeMake(50, 26) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr2 context:nil].size;
//            CGFloat txtW = txtSize.width;
//            NSLog(@"width:%f", txtW);
//            CGFloat txtH = txtSize.height;
//            self.lblCompanyName.frame = CGRectMake(txtX, txtY, txtW, txtH);
//            [self.lblCompanyName sizeToFit];
//            [self addSubview:self.lblCompanyName];
//            
//            
//        }
//    }
//
//
//}
@end
