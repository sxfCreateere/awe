//
//  CustomCell.m
//  Pinterest3.0
//
//  Created by sun on 16/6/27.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "CustomCell.h"
#import "UIImageView+WebCache.h"


#define SCREENWidth [UIScreen mainScreen].bounds.size.width
#define SCREENHeight [UIScreen mainScreen].bounds.size.height

@interface CustomCell ()
{
    
    UIView      *_bgView;
    
    UIImageView *_imageView;
    UILabel     *_titleLabel;
    UILabel     *_leftLabel;
    UIButton    *_leftButton;
    UILabel     *_rightLabel;
    UIButton    *_rightButton;
}

@property (nonatomic, strong)cellBlock blockHandle;

@end

@implementation CustomCell

#pragma mark - 重写cell的初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
  
    self = [super initWithFrame:frame];
    if (self) {

        [self createView];
    }
    return self;
    
}

#pragma mark - 创建cell上面的子视图
- (void)createView {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:bgView];
    _bgView = bgView;
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [bgView addSubview:imageView];
    _imageView = imageView;
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    [bgView addSubview:titleLable];
    _titleLabel = titleLable;
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [bgView addSubview:leftLabel];
    _leftLabel = leftLabel;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
       // [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:leftButton];
    _leftButton = leftButton;
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:rightButton];
    _rightButton = rightButton;
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [bgView addSubview:rightLabel];
    _rightLabel = rightLabel;
    
    
    
}

#pragma mark --- cell上button点击事件
- (void)rightButtonClick:(UIButton *)sender {
    
    if (self.blockHandle) {
        self.blockHandle();
    }
    
}

#pragma mark - cell上button点击事件转化成block块
- (void)buttonCallBackBlock:(cellBlock)buttonBlock {
    
    self.blockHandle = buttonBlock;
    
}

- (void)setItModel:(ItemsModel *)itModel {
    
        ItemsModel *model = itModel;
    if (!model.cModel.day) {
        
        float imageWidth = [model.width floatValue];
        float imageHeight = [model.height floatValue]*(SCREENWidth/2)/imageWidth;
        _imageView.frame = CGRectMake(0, 0,SCREENWidth/2-10, imageHeight);

    if (model.cModel.picUrl) {
        
     [_imageView sd_setImageWithURL:[NSURL URLWithString:model.cModel.picUrl]];
        
    } else {
        
         _imageView.image = [UIImage imageNamed:@"iPad"];
    }
        
        _titleLabel.frame = CGRectMake(5, CGRectGetMaxY(_imageView.frame)+5, SCREENWidth/2-10, 20);
        _titleLabel.font = [UIFont systemFontOfSize:17];
    if (model.cModel.des) {
        
            _titleLabel.text = model.cModel.des;
    } else {
        _titleLabel.text = @"";
    }
        
        
        _leftButton.frame =CGRectMake(20, CGRectGetMaxY(_titleLabel.frame), SCREENWidth/20, 20);
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"list_icon_link"] forState:UIControlStateNormal];

        _leftLabel.frame = CGRectMake(CGRectGetMaxX(_leftButton.frame)+5, CGRectGetMaxY(_titleLabel.frame), SCREENWidth/8, 20);
        if (model.cModel.itemsCount){
        
        _leftLabel.text = model.cModel.itemsCount;
        
    } else {
        
        _leftLabel.text = @"0";
    }
        
        _rightButton.frame =CGRectMake(SCREENWidth/4, CGRectGetMaxY(_titleLabel.frame), SCREENWidth/20, 20);
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"bottom_like_button@3x"] forState:UIControlStateNormal];

        _rightLabel.frame = CGRectMake(CGRectGetMaxX(_rightButton.frame)+5, CGRectGetMaxY(_titleLabel.frame),SCREENWidth/8, 20);
        _rightLabel.font = [UIFont systemFontOfSize:17];
    if (model.cModel.collectionCount) {
        
        _rightLabel.text = model.cModel.collectionCount;
        
    } else {
        
        _rightLabel.text = @"0";
    }
        
    }else {
       
        _leftButton.frame = CGRectZero;
        _rightButton.frame = CGRectZero;
        _titleLabel.frame = CGRectMake(5, 10, 25, 25);
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.text = model.cModel.day;
        
        float imageWidth = [model.width floatValue];
        float imageHeight = [model.height floatValue]*(SCREENWidth/2)/imageWidth;
        _imageView.frame = CGRectMake(0, 35,SCREENWidth/2-10, imageHeight);
        
        _leftLabel.frame = CGRectMake(CGRectGetMaxX(_titleLabel.frame), 10, 30, 20);
        _leftLabel.numberOfLines = 0;

        
    if (model.cModel.picUrl) {
        
            [_imageView sd_setImageWithURL:[NSURL URLWithString:model.cModel.picUrl]];

    } else {
        
         _imageView.image = [UIImage imageNamed:@"iPad"];
    }
    
    if (model.cModel.weekDay) {
        
    _leftLabel.attributedText = [AssistTool setTextWithString:model.cModel.weekDay withColor:BXColor(129, 129, 129) withFont:8 withFontRange:NSMakeRange(0, model.cModel.weekDay.length)];
     
    } else {
        
        _leftLabel.text = @"";
    }
    
    if (model.cModel.showTime) {
        
        _rightLabel.frame = CGRectMake(SCREENWidth/3, 10,SCREENWidth/4, 20);
        _rightLabel.font = [UIFont boldSystemFontOfSize:10];
        NSString  *str = [NSString stringWithFormat:@"%@ 发布",model.cModel.showTime];
        _rightLabel.attributedText = [AssistTool setTextWithString:str withColor:BXColor(129, 129, 129) withFont:8 withFontRange:NSMakeRange(model.cModel.showTime.length, 3)];

    } else {
        
        _rightLabel.text = @"";
    }
}
    _bgView.frame = self.contentView.bounds;
  
}

#pragma mark  --- 清除cell上面的所有子视图
- (void)setAllDefault {
    
    [_bgView removeFromSuperview];
    
    [self createView];
    
}

@end
