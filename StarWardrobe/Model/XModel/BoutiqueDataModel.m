//
//  BoutiqueDataModel.m
//  StarWardrobe
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "BoutiqueDataModel.h"
#import "BoutiqueSubModel.h"

@implementation BoutiqueDataModel


-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        
        NSMutableArray *comArray = [NSMutableArray arrayWithArray:dic[@"region_skus"]];
        NSMutableArray * topArray = [NSMutableArray arrayWithArray:dic[@"region_name"]];
        NSMutableArray *brdArray = [NSMutableArray arrayWithArray:dic[@"region_brands"]];
        NSMutableArray * picArray = [NSMutableArray arrayWithArray:dic[@"region_pictures"]];
        
        self.commodityArray = @[].mutableCopy;
        self.topImageArray = @[].mutableCopy;
        self.brandArray = @[].mutableCopy;
        self.picturesArray = @[].mutableCopy;
        
        for (int i = 0; i<comArray.count; i++) {            
            NSDictionary *comDic  = comArray[i];
            NSDictionary *compionet = comDic[@"component"];
            BoutiqueSubModel * model = [[BoutiqueSubModel alloc]initWithDic:compionet];
            [self.commodityArray addObject:model];
        }
        for (int i = 0; i<topArray.count; i++) {
            
            NSDictionary *comDic  = topArray[i];
            NSDictionary *compionet = comDic[@"component"];
            BoutiqueSubModel * model = [[BoutiqueSubModel alloc]initWithDic:compionet];
            [self.topImageArray addObject:model];
        }
        for (int i = 0; i<brdArray.count; i++) {
            NSDictionary *comDic  = brdArray[i];
            NSDictionary *compionet = comDic[@"component"];
            BoutiqueSubModel * model = [[BoutiqueSubModel alloc]initWithDic:compionet];
            [self.brandArray addObject:model];
        }
        for (int i = 0; i<picArray.count; i++) {
            NSDictionary *comDic  = picArray[i];
            NSDictionary *compionet = comDic[@"component"];
            BoutiqueSubModel * model = [[BoutiqueSubModel alloc]initWithDic:compionet];
            [self.picturesArray addObject:model];
        }
        
    }
    
    return self;
}






@end
