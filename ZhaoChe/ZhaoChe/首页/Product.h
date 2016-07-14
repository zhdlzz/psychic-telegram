//
//  Product.h
//  Demo3_SearchBar
//
//  Created by tarena on 15/4/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, ProductType){
    ProductTypeDevice,
    ProductTypeSoftware,
    ProductTypeOther
};

@interface Product : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic)ProductType type;

+(NSArray *)demoData;

@end









