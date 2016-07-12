//
//  PublishView.h
//  ZhaoChe
//
//  Created by chetuan003 on 6/27/16.
//  Copyright © 2016 chetuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublishView : UIView

@property (strong, nonatomic) UIButton *dismissBtn;
@property (copy, nonatomic) void(^dismissBtnClickedBlock)();
@property (copy, nonatomic) void(^actionBtnClickedBlock)(NSInteger tag);

- (void)animate;

@end
