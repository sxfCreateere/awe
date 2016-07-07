//
//  BoutiqueSubModel.h
//  StarWardrobe
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BoutiqueSubModel : NSObject

@property (nonatomic,assign)NSInteger height;
@property (nonatomic,assign)NSInteger width;
@property (nonatomic,assign)NSInteger origin_price;
@property (nonatomic,assign)CGFloat  price;
@property (nonatomic,copy)NSString * picUrl;
@property (nonatomic,copy)NSString * title;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end
