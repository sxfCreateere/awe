//
//  TopicsCell.h
//  Matches
//
//  Created by sun on 16/7/3.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemsModel;

typedef void(^cellBlock)();
@interface TopicsCell : UITableViewCell

@property (nonatomic, strong)ItemsModel  *model;

- (void)buttonCallBackBlock:(cellBlock)buttonBlock;

//- (void)setAllDefault;


@end
