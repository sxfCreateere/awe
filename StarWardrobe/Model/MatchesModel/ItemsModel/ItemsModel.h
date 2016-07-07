//
//  ItemsModel.h
//  Pinterest3.0
//
//  Created by sun on 16/6/27.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComponentModel.h"

@interface ItemsModel : NSObject

@property (nonatomic, copy)NSString *height;
@property (nonatomic, copy)NSString *width;
@property (nonatomic, strong)ComponentModel  *cModel;

- (instancetype)initITModelWithDic:(NSDictionary *)dic;
+ (instancetype)createITModelWithDic:(NSDictionary *)dic;

@end
