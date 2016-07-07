//
//  BoutiqueView.h
//  StarWardrobe
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoutiqueDataModel.h"

@interface BoutiqueView : UIView

@property (nonatomic,strong)UIImageView * topImageView;
@property (nonatomic,strong)UIScrollView * brandSV;
@property (nonatomic,strong)SDCycleScrollView * pastorSV;
@property (nonatomic,strong)UIScrollView * commoditySV;


-(void)setViewControlStyleWithDataArray:(BoutiqueDataModel *)model;

@end
