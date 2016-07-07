//
//  BoutiqueDataModel.h
//  StarWardrobe
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoutiqueSubModel.h"

@interface BoutiqueDataModel : NSObject

@property(nonatomic,retain)NSMutableArray *commodityArray;
@property(nonatomic,retain)NSMutableArray *topImageArray;
@property(nonatomic,retain)NSMutableArray *brandArray;
@property(nonatomic,retain)NSMutableArray *picturesArray;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end
