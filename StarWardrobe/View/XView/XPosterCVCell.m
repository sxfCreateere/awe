//
//  XPosterCVCell.m
//  StarWardrobe
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "XPosterCVCell.h"

@implementation XPosterCVCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        self.imageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.imageView];
        
        
    }
    return self;
}


@end
