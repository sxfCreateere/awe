//
//  ShowComCV.m
//  StarWardrobe
//
//  Created by Mac on 16/7/6.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "ShowComCV.h"

@implementation ShowComCV

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.contentView addSubview:self.bgView];
        
        self.picImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-65)];
        [self.bgView addSubview:self.picImageView];
        
        self.nationalFlagView = [[UIImageView alloc]initWithFrame:CGRectMake(10, frame.size.height-60, 15,15)];
        [self.bgView addSubview:self.nationalFlagView];
        
        self.nationalNameLable = [[UILabel alloc]initWithFrame:CGRectMake(27, frame.size.height-60, 60, 15)];
        self.nationalNameLable.font =[UIFont systemFontOfSize:10];
        [self.bgView addSubview:self.nationalNameLable];
        
        
        self.picNameLable = [[UILabel alloc]initWithFrame:CGRectMake(10, frame.size.height-45, frame.size.width, 15)];
        self.picNameLable.font = [UIFont boldSystemFontOfSize:10];
        [self.bgView addSubview:self.picNameLable];
        
        self.priceLable = [[UILabel alloc]initWithFrame:CGRectMake(10, frame.size.height-30, 60, 30)];
        self.priceLable.font = [UIFont systemFontOfSize:15];
        self.priceLable.textColor =[UIColor magentaColor];
        [self.bgView addSubview:self.priceLable];
        
        self.origin_priceLable = [[UILabel alloc]initWithFrame:CGRectMake(60, frame.size.height-20, 40, 15)];
        self.origin_priceLable.font =[UIFont systemFontOfSize:10];
        self.origin_priceLable.textColor =[UIColor grayColor];
        [self.bgView addSubview:self.origin_priceLable];
        
    }
    return self;
}


-(void)setDataModel:(XShowComModel *)dataModel
{
    if (_dataModel != dataModel) {
        
        _dataModel = dataModel;
        
        [self.picImageView sd_setImageWithURL:[NSURL URLWithString:dataModel.picUrl]];
        
//        NSLog(@"%@",dataModel.picUrl);
        
        [self.nationalFlagView sd_setImageWithURL:[NSURL URLWithString:dataModel.nationalFlag]];
        
        self.nationalNameLable.text = dataModel.country;
        self.picNameLable.text = dataModel.picDescription;
        self.priceLable.text = [NSString stringWithFormat:@"¥%@",dataModel.price];
        self.origin_priceLable.text = [NSString stringWithFormat:@"¥%@",dataModel.origin_price];
        
        
    }
    
    
}




@end
