//
//  ClassifyView.h
//  StarWardrobe
//
//  Created by sun on 16/7/5.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myClassifyBlock)(UIButton *sender);
typedef void(^addClassifyBlock)(UIButton *sender);
@interface ClassifyView : UIView

- (instancetype)initWithFrame:(CGRect)frame  withMyClassifyArray:(NSMutableArray *)myClassifyArray withAddArray:(NSMutableArray *)addArray;


- (void)addClassifyButtonCallBackBlock:(addClassifyBlock)buttonBlock ;

- (void)myClassifyButtonCallBackBlock:(myClassifyBlock)buttonBlock ;

@end
