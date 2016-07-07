//
//  XRequestTool.h
//  StarWardrobe
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XRequestTool : NSObject


+(void)requestShowCVChangeDataWithTag:(NSInteger)index returnData:(DataBlock)dataBlock;

+(void)requestPosterData:(DataBlock)dataBlock;

+(void)requestBoutiqueData:(DataBlock)dataBlock;

+(void)requestTopSVData:(DataBlock)dataBlock;

+(void)footerRefreshDataWithNum:(NSInteger )num  refreshData:(DataBlock)dataBlock;


@end
