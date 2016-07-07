//
//  TopScrollView.h
//  StarWardrobe
//
//  Created by sun on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^classifyBlock)(UIButton *sender);

@interface TopScrollView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame With:(NSArray *)topArray;

- (void)buttonCallBackBlock:(classifyBlock)buttonBlock ;

@end
