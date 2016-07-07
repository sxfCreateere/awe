//
//  TopScrollView.m
//  StarWardrobe
//
//  Created by sun on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "TopScrollView.h"

@interface TopScrollView ()

@property (nonatomic, strong)classifyBlock blockHandle;

@end

@implementation TopScrollView

- (instancetype)initWithFrame:(CGRect)frame  With:(NSArray *)topArray {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.directionalLockEnabled = YES;
        [self createSubviewWithTopScrollView:self With:topArray];
        
    }
    
    return self;
}


- (void)createSubviewWithTopScrollView:(TopScrollView *)topView With:(NSArray *)topArray {
    
    NSArray *arr = @[@"最新",@"热门",@"本土",@"清新",@"欧美",@"型男"];
    self.contentSize = CGSizeMake(60*arr.count, 0);
    for (NSInteger i = 0; i < arr.count; i ++) {
        
        UIButton   *button = [UIButton buttonWithTitle:arr[i] titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(matchesButton:)];
        button.frame = CGRectMake(20 + 60*i, -64, 50, 30);
        [topView addSubview:button];

    }
    
}
- (void)matchesButton:(UIButton *)sender{
    
    if (self.blockHandle) {
        self.blockHandle(sender);
    }
    
}

#pragma mark - cell上button点击事件转化成block块
- (void)buttonCallBackBlock:(classifyBlock)buttonBlock {
    
    self.blockHandle = buttonBlock;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
