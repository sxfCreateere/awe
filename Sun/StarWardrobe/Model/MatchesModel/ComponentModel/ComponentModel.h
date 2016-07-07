//
//  ComponentModel.h
//  Pinterest3.0
//
//  Created by sun on 16/6/27.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComponentModel : NSObject

@property (nonatomic,copy)NSString *collectionCount;
@property (nonatomic,copy)NSString *itemsCount;
@property (nonatomic,copy)NSString *picUrl;
@property (nonatomic,copy)NSString *des;
@property (nonatomic,copy)NSString *commentCount;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *v;
@property (nonatomic, copy)NSString *year;
@property (nonatomic, copy)NSString *month;
@property (nonatomic, copy)NSString *day;
@property (nonatomic, copy)NSString *weekDay;
@property (nonatomic, copy)NSString *showTime;
@property (nonatomic, copy)NSString *category;

- (instancetype)initCModelWithDic:(NSDictionary *)dic;
+ (instancetype)createCModelWithDic:(NSDictionary *)dic;

@end
