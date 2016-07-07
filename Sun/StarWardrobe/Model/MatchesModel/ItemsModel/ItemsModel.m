//
//  ItemsModel.m
//  Pinterest3.0
//
//  Created by sun on 16/6/27.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "ItemsModel.h"

@implementation ItemsModel

- (instancetype)initITModelWithDic:(NSDictionary *)dic {
    
   self = [super init];
    if (self) {
        self.height = dic[@"height"];
        self.width = dic[@"width"];
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    if ([key isEqualToString:@"component"]) {
        
        self.cModel = [ComponentModel createCModelWithDic:value];
    }
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
    
}

+ (instancetype)createITModelWithDic:(NSDictionary *)dic {
    
    return [[self alloc]initITModelWithDic:dic];
}





@end
