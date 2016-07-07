//
//  AssistTool.h
//  Matches
//
//  Created by sun on 16/7/4.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AssistTool : NSObject

+ (NSMutableAttributedString *)setTextWithString:(NSString *)str withColor:(UIColor *)color  withFont:(float)font withFontRange:(NSRange)FontRange;

+ (NSDictionary *)getClassifyData;
@end
