//
//  XShowComModel.m
//  StarWardrobe
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "XShowComModel.h"

@implementation XShowComModel

-(instancetype)initWithDataDic:(NSDictionary *)dic{
    
    self = [super init];
    
    if (self) {
        
        
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    
    if ([key isEqualToString:@"description"])
    {
        self.picDescription =value;
    }
    if ([key isEqualToString:@"picUrl"])
    {
        self.picUrl =value;
        
        self.picUrl = [[self.picUrl componentsSeparatedByString:@"?"] firstObject];
        
    }
    if ([key isEqualToString:@"nationalFlag"])
    {
        self.nationalFlag =value;
    }
    if ([key isEqualToString:@"country"])
    {
        self.country =value;
    }
    if ([key isEqualToString:@"price"])
    {
        self.price =value;
    }
    if ([key isEqualToString:@"origin_price"])
    {
        self.origin_price =value;
    }


}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}



@end
