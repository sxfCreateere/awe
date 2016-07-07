//
//  ShowComCV.h
//  StarWardrobe
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XShowComModel.h"

@interface ShowComCV : UICollectionViewCell

@property (nonatomic,strong)UIView * bgView;
@property (nonatomic,strong)UIImageView * picImageView;
@property (nonatomic,strong)UIImageView *nationalFlagView;
@property (nonatomic,strong)UILabel * nationalNameLable;
@property (nonatomic,strong)UILabel * picNameLable;
@property (nonatomic,strong)UILabel * priceLable;
@property (nonatomic,strong)UILabel * origin_priceLable;


@property(nonatomic,strong)XShowComModel * dataModel;


@end
