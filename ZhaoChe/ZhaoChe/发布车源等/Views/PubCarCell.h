//
//  PubCarCell.h
//  ZhaoChe
//
//  Created by zdl on 16/7/26.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PubCarCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *carNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *styleLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *leadPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *noSaleBtn;
@property (weak, nonatomic) IBOutlet UIButton *setBtn;

@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@end
