//
//  TopSVModel.m
//  StarWardrobe
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "TopSVModel.h"

@implementation TopSVModel

-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        NSDictionary * componentDic = dic[@"component"];
        [self setValuesForKeysWithDictionary:componentDic];
        
    }
    
    return self;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
