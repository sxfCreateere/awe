//
//  CustomCell.h
//  Pinterest3.0
//
//  Created by sun on 16/6/27.
//  Copyright © 2016年 sun. All rights reserved.
//

typedef void(^cellBlock)();
@class ItemsModel;
#import <UIKit/UIKit.h>

@interface CustomCell : UICollectionViewCell

@property (nonatomic,strong)ItemsModel *itModel;

- (void)buttonCallBackBlock:(cellBlock)buttonBlock;

- (void)setAllDefault;

@end
