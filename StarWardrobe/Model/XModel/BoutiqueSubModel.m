//
//  BoutiqueSubModel.m
//  StarWardrobe
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "BoutiqueSubModel.h"

@implementation BoutiqueSubModel

-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}



@end
