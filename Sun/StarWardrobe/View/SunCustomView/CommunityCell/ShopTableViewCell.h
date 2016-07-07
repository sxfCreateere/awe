//
//  ShopTableViewCell.h
//  ShoppingOnline
//
//  Created by sun on 16/6/20.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PosterModel;

typedef void(^cellBlock)();

@interface ShopTableViewCell : UITableViewCell

@property (nonatomic, strong)PosterModel  *model;

- (void)buttonCallBackBlock:(cellBlock)buttonBlock;

- (void)setAllDefault;


@end
