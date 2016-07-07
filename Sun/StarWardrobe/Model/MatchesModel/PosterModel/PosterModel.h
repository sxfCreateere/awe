//
//  PosterModel.h
//  OnlineShopping
//
//  Created by sun on 16/6/17.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComponentModel.h"
@interface PosterModel : NSObject
@property (copy, nonatomic)NSString *height;
@property (copy, nonatomic)NSString *width;
@property (strong, nonatomic)ComponentModel *cModel;
- (instancetype)initPosterModelWithDic:(NSDictionary *)dic;
+ (instancetype)createPosterModelWithDic:(NSDictionary *)dic;
@end
