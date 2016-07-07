//
//  PosterView.m
//  StarWardrobe
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "PosterView.h"


@implementation PosterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithBoutiModel:(BoutiqueSubModel *)model
{
    self = [super init];
    
    if (self) {
        
        self.comImageView = [[UIImageView alloc]init];
        [self.comImageView sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
        
        [self addSubview:self.comImageView];
        
        self.nameLable = [[UILabel alloc]init];
        self.nameLable.text = model.title;
        self.nameLable.textAlignment = NSTextAlignmentCenter;
        self.nameLable.font =[UIFont systemFontOfSize:12];
        [self addSubview:self.nameLable];
        
        
        self.nowPicLable = [[UILabel alloc]init];
        self.nowPicLable.text = [NSString stringWithFormat:@"%.2f",model.price];
        self.nowPicLable.font = [UIFont systemFontOfSize:15];
        self.nowPicLable.textAlignment = NSTextAlignmentCenter;
        self.nowPicLable.textColor =[UIColor redColor];
        [self addSubview:self.nowPicLable];
        
        self.oldPicLable = [[UILabel alloc]init];
        self.oldPicLable.textAlignment = NSTextAlignmentCenter;
        self.oldPicLable.text = [NSString stringWithFormat:@"%ld",(long)model.origin_price];
        self.oldPicLable.font =[UIFont systemFontOfSize:10];
        self.oldPicLable.textColor =[UIColor grayColor];
        [self addSubview:self.oldPicLable];
    }

    return self;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.comImageView.frame = CGRectMake(0, 0, self.width, self.height/2);
//    self.comImageView.layer.cornerRadius = self.width/2;
//    self.comImageView.clipsToBounds = YES;
    self.nameLable.frame = CGRectMake(0, self.height/2, self.width, self.height/6);
    self.nowPicLable.frame = CGRectMake(0, self.height/2+self.height/6, self.width, self.height/6);
    self.oldPicLable.frame = CGRectMake(0, self.height-self.height/6, self.width, self.height/6);
    
}


@end
