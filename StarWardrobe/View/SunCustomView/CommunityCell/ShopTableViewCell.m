//
//  ShopTableViewCell.m
//  ShoppingOnline
//
//  Created by sun on 16/6/20.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "ShopTableViewCell.h"

@interface ShopTableViewCell () {
    
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

@implementation ShopTableViewCell

#pragma mark --- 重写cell的初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createView];
    }
    return self;
}


#pragma mark --- 创建cell上面的子视图
- (void)createView {
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.frame];
    bgView.backgroundColor = [UIColor magentaColor];
    [self.contentView addSubview:bgView];
    _bgView = bgView;
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [bgView addSubview:imageView];
    _imageView = imageView;
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLable.numberOfLines = 0;
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

#pragma mark --- cell上button点击事件转化成block块
- (void)buttonCallBackBlock:(cellBlock)buttonBlock {
    
    self.blockHandle = buttonBlock;
    
}

#pragma mark --- cell上的子视图自动布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
//    PosterModel *model = self.model;
//    
//    if (model.cModel.picUrl) {
//
//        float imageWidth = [model.width floatValue];
//        float imageHeight = [model.height floatValue]*(SCREENSIZE.width/2)/imageWidth;
//        _imageView.frame = CGRectMake(5, 5, SCREENSIZE.width/2-10, imageHeight);
//        [_imageView sd_setImageWithURL:[NSURL URLWithString:model.cModel.picUrl]];
//    }
//    
//    if (model.cModel.des) {
//        
//        _titleLabel.frame = CGRectMake(5, CGRectGetMaxY(_imageView.frame), SCREENSIZE.width/2-10, 60);
//        _titleLabel.text = model.cModel.des;
//    }
//    
//    if (model.cModel.itemsCount) {
//        
//        _leftButton.frame =CGRectMake(5, CGRectGetMaxY(_titleLabel.frame), SCREENSIZE.width/8-20, 35);
//        [_leftButton setBackgroundImage:[UIImage imageNamed:@"list_icon_link"] forState:UIControlStateNormal];
//        
//        _leftLabel.frame = CGRectMake(CGRectGetMaxX(_leftButton.frame)+5, CGRectGetMaxY(_titleLabel.frame), SCREENSIZE.width/8, 35);
//        _leftLabel.text = model.cModel.itemsCount;
//    }
//    
//    if (model.cModel.collectionCount) {
//        
//        _rightButton.frame =CGRectMake(CGRectGetMaxX(_leftLabel.frame)+5, CGRectGetMaxY(_titleLabel.frame), SCREENSIZE.width/8-20, 35);
//        [_rightButton setBackgroundImage:[UIImage imageNamed:@"list_icon_like"] forState:UIControlStateNormal];
//        
//        _rightLabel.frame = CGRectMake(CGRectGetMaxX(_rightButton.frame)+5, CGRectGetMaxY(_titleLabel.frame),SCREENSIZE.width/8, 35);
//        _rightLabel.text = model.cModel.collectionCount;
//      
//        
//    }
//    _bgView.frame = self.contentView.bounds;
//     // NSLog(@"--->>%s",__FUNCTION__);
//
}

#pragma mark  --- 清除cell上面的所有子视图
- (void)setAllDefault {
    
    [_bgView removeFromSuperview];
    _bgView = nil;
    
    [self createView];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
