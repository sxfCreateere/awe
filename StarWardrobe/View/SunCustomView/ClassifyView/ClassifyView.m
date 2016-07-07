//
//  ClassifyView.m
//  StarWardrobe
//
//  Created by sun on 16/7/5.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "ClassifyView.h"

@interface ClassifyView ()

@property (nonatomic, strong)myClassifyBlock myClassifyHandle;
@property (nonatomic, strong)addClassifyBlock addClassifyHandle;

@end

@implementation ClassifyView

- (instancetype)initWithFrame:(CGRect)frame  withMyClassifyArray:(NSMutableArray *)myClassifyArray withAddArray:(NSMutableArray *)addArray{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self createSubhViewsWithMyClassifyArray:myClassifyArray withAddArray:addArray];
    }
    
    
    
    return self;
}

- (void)createSubhViewsWithMyClassifyArray:(NSMutableArray *)myClassifyArray withAddArray:(NSMutableArray *)addArray {
  
    
    UILabel  *myClassifyTitle  = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, kMainBoundsW/4, 30)];
    myClassifyTitle.text = @"我的分类";
    [self addSubview:myClassifyTitle];
    
    UIButton  *edit = [UIButton buttonWithTitle:@"编辑" titleColor:[UIColor blueColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(edit:)];
    edit.frame = CGRectMake(kMainBoundsW*5/6, 30, 50, 30);
    [self addSubview:edit];

    
    if (myClassifyArray) {
        
        for (NSInteger i = 0; i < myClassifyArray.count; i++) {
            
            UIButton  *button = [UIButton buttonWithTitle:myClassifyArray[i] titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(myClassify:)];
            button.frame = CGRectMake(20 + 60*i, 60, 50, 30);
            [self addSubview:button];
            
        }
        
        
    }
    
    UILabel  *addClassifyTitle  = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, kMainBoundsW/4, 30)];
    addClassifyTitle.text = @"添加分类";
    [self addSubview:addClassifyTitle];

    
    if (addArray) {
        
        for (NSInteger i = 0; i < addArray.count; i++) {
            
            UIButton  *button = [UIButton buttonWithTitle:addArray[i] titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(addClassify:)];
            button.frame = CGRectMake(20 + 60*(i%6), 240 + 40*(i/6), 50, 30);
            [self addSubview:button];
            
        }
        
        
    }

 
}

- (void)edit:(UIButton *)sender {
    
    KSLog(@"开始编辑");
}

- (void)addClassify:(UIButton *)sender {
    
    if (self.addClassifyHandle) {
        self.addClassifyHandle(sender);
    }
    
    
}



- (void)myClassify:(UIButton *)sender {
    
    if (self.myClassifyHandle) {
        self.myClassifyHandle(sender);
    }
  
    
}


- (void)addClassifyButtonCallBackBlock:(addClassifyBlock)buttonBlock {
    
    self.addClassifyHandle = buttonBlock;
    
}

- (void)myClassifyButtonCallBackBlock:(myClassifyBlock)buttonBlock {
  
    self.myClassifyHandle = buttonBlock;
    
}







@end
