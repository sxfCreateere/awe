//
//  XShowComModel.h
//  StarWardrobe
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XShowComModel : NSObject

@property (nonatomic,copy)NSString * picUrl;
@property (nonatomic,copy)NSString * nationalFlag;
@property (nonatomic,copy)NSString * country;
@property (nonatomic,copy)NSString * picDescription;
@property (nonatomic,copy)NSString * price;
@property (nonatomic,copy)NSString * origin_price;

-(instancetype)initWithDataDic:(NSDictionary *)dic;


@end
