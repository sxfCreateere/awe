//
//  UICollectionViewPintersetFlowLayout.h
//  Pinterest3.0
//
//  Created by sun on 16/6/27.
//  Copyright © 2016年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PinterestDelegate <NSObject>

- (CGFloat)getHeightWithIndexPath:(NSIndexPath *)indexPath;

@end
@interface UICollectionViewPintersetFlowLayout : UICollectionViewLayout

@property (nonatomic,assign)NSInteger columnCount;

@property (nonatomic, assign)CGFloat itemWidth;

@property (nonatomic, assign)UIEdgeInsets sectionIntsets;



@property (nonatomic, assign)id<PinterestDelegate>delegate;

@end
