//
//  UICollectionViewPintersetFlowLayout.m
//  Pinterest3.0
//
//  Created by sun on 16/6/27.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "UICollectionViewPintersetFlowLayout.h"


@interface UICollectionViewPintersetFlowLayout ()

@property (nonatomic, assign)NSInteger itemsCount;

@property (nonatomic, assign)CGFloat space;

@property (nonatomic, strong)NSMutableArray  *columnHeights;

@property (nonatomic, strong)NSMutableArray  *attributes;

@end

@implementation UICollectionViewPintersetFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}


- (void)initData {
    
    self.sectionIntsets = UIEdgeInsetsMake(5, 5, 5, 5);
    
}

- (void)prepareLayout {
    [super prepareLayout];
    
    NSInteger  items = [[self collectionView] numberOfItemsInSection:0];
    
    _itemsCount = items;
    
    NSAssert(_columnCount > 1, @"列数必须大于1");
    
    
    CGFloat  width = self.collectionView.frame.size.width - _sectionIntsets.left - _sectionIntsets.right;
    
    CGFloat  space = floor(width - _columnCount * _itemWidth)/(_columnCount - 1);
    _space = space;
    
    self.columnHeights = [[NSMutableArray alloc]initWithCapacity:_columnCount];
    self.attributes = [[NSMutableArray alloc]initWithCapacity:_itemsCount];
    
    
    for (NSInteger index = 0; index < _columnCount; index++) {
        
        [_columnHeights addObject:@(_sectionIntsets.top)];
    }
    
    for (NSInteger idx = 0; idx < _itemsCount; idx++) {
        
        NSIndexPath  *indexPath = [NSIndexPath indexPathForItem:idx inSection:0];
        CGFloat  itemHeight;
        if ([self.delegate respondsToSelector:@selector(getHeightWithIndexPath:)]) {
            
              itemHeight = [self.delegate getHeightWithIndexPath:indexPath];
            
        } else {
            
            itemHeight = 0;
            
        }
        
        
        NSInteger  minHeight = [self   getMinHeightColIndex];
        
        CGFloat  offsetX = _sectionIntsets.left + (_itemWidth + _space) * minHeight;
        CGFloat  offsetY = [(_columnHeights[minHeight]) floatValue];
        
        UICollectionViewLayoutAttributes   *att = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        att.frame = CGRectMake(offsetX, offsetY, _itemWidth, itemHeight);
        [_attributes addObject:att];

        _columnHeights[minHeight] = @(offsetY + itemHeight + _sectionIntsets.bottom);
        
    }
    
    
    
}

- (CGSize)collectionViewContentSize {
    
    if (!_itemsCount) {
        
        return CGSizeZero;
    }
    
    CGSize  contentSize = self.collectionView.frame.size;
    NSInteger  maxHeight = [self getMaxHeightColIndex];
    contentSize.height = [self.columnHeights[maxHeight] floatValue] + self.sectionIntsets.bottom -self.space;
    
    return contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return (self.attributes)[indexPath.item];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return [self.attributes filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        
        return CGRectIntersectsRect(rect, ((UICollectionViewLayoutAttributes *)evaluatedObject).frame);
    }]];

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return NO;
}

- (NSInteger)getMinHeightColIndex {
    
    __block NSInteger index = 0;
    __block CGFloat tempIndex = MAXFLOAT;
    
    [self.columnHeights enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat  temp = [obj floatValue];
        
        if (temp < tempIndex) {
            
            tempIndex = temp;
            index = idx;
        }
        
        
    }];
    
    return index;
}


- (NSInteger)getMaxHeightColIndex {
    
    __block  NSInteger  index = 0;
    __block CGFloat tempIndex = 0;
    
    [self.columnHeights enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat temp = [obj floatValue];
        if (temp > tempIndex) {
            
            tempIndex = temp;
            
            index = idx;
            
        }
 
    }];
    

    return index;
}

@end
