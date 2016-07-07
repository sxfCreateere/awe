//
//  ComponentModel.m
//  Pinterest3.0
//
//  Created by sun on 16/6/27.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "ComponentModel.h"

@implementation ComponentModel

- (instancetype)initCModelWithDic:(NSDictionary *)dic {
    self = [super init];
    
    if (self) {
        
        self.collectionCount = dic[@"collectionCount"];
        self.itemsCount = dic[@"itemsCount"];
        self.picUrl = [[dic[@"picUrl"] componentsSeparatedByString:@"?"] firstObject];
        self.title = dic[@"title"];
        self.commentCount = dic[@"commentCount"];
        self.v = dic[@"v"];
        self.year = dic[@"year"];
        self.month = dic[@"month"];
        self.day = dic[@"day"];
        self.weekDay = dic[@"weekDay"];
        self.showTime = dic[@"showTime"];
        self.category = dic[@"category"];
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    if ([key isEqualToString:@"description"]) {
        
        self.des = value;
    }
    
    
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
    
}

+ (instancetype)createCModelWithDic:(NSDictionary *)dic {
    
    return [[self alloc]initCModelWithDic:dic];
    
}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"des:%@  picUrl:%@",_des,_picUrl];
}

@end
