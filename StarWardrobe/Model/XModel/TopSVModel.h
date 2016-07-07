//
//  TopSVModel.h
//  StarWardrobe
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopSVModel : NSObject

@property(nonatomic,assign)NSInteger width;
@property(nonatomic,assign)NSInteger height;
@property(nonatomic,copy)NSString * picUrl;

-(instancetype)initWithDic:(NSDictionary *)dic;

@end
