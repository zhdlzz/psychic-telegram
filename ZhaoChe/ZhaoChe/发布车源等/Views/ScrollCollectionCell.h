//
//  ScrollCollectionCell.h
//  ZhaoChe
//
//  Created by zdl on 16/7/11.
//  Copyright © 2016年 chetuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end
