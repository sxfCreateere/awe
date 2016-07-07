//
//  PosterView.h
//  StarWardrobe
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoutiqueSubModel.h"

@interface PosterView : UIView

@property (nonatomic,strong)UIImageView * comImageView;
@property (nonatomic,strong)UILabel * nameLable;
@property (nonatomic,strong)UILabel * nowPicLable;
@property (nonatomic,strong)UILabel * oldPicLable;
@property (nonatomic,strong)NSTimer * topSVTimer;


-(instancetype)initWithBoutiModel:(BoutiqueSubModel *)model;


@end
