
//
//  PosterModel.m
//  OnlineShopping
//
//  Created by sun on 16/6/17.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "PosterModel.h"

@implementation PosterModel
- (instancetype)initPosterModelWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        
        self.height = dic[@"height"];
        self.width = dic[@"width"];
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forKey:(NSString *)key{
 
    if ([key isEqualToString:@"component"]){
        //self.cModel = [[ComponentModel alloc]initComponentModelWithDic:value];
    }
}

+ (instancetype)createPosterModelWithDic:(NSDictionary *)dic{
    
    return [[self alloc]initPosterModelWithDic:dic];
    
}
@end
