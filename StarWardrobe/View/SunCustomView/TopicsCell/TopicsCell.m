//
//  TopicsCell.m
//  Matches
//
//  Created by sun on 16/7/3.
//  Copyright © 2016年 sun. All rights reserved.
//

#import "TopicsCell.h"
@interface TopicsCell () {
    
    UIView      *_bgView;
    
    UIImageView *_imageView;
    UILabel     *_titleLabel;
    UILabel     *_rightTitleLabel;
    UILabel     *_dateLabel;
    UILabel     *_leftLabel;
    UIButton    *_leftButton;
    UILabel     *_middleLabel;
    UIButton    *_middleButton;
    UILabel     *_rightLabel;
    UIButton    *_rightButton;
}

@property (nonatomic, strong)cellBlock blockHandle;

@end

@implementation TopicsCell

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
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:bgView];
    _bgView = bgView;

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [bgView addSubview:imageView];
    _imageView = imageView;
    
    _titleLabel = [self createLabelWithView:_bgView];
    _rightTitleLabel = [self createLabelWithView:_bgView];

   _dateLabel = [self createLabelWithView:_bgView];
    _dateLabel.font = [UIFont systemFontOfSize:10];
    _dateLabel.textColor = [UIColor grayColor];

    _leftLabel = [self createLabelWithView:_bgView];
    
    _leftButton = [self createButtonWithView:_bgView];
    // [_leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _middleButton = [self createButtonWithView:_bgView];
//    [_middleButton addTarget:self action:@selector(middleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
  
    
    _middleLabel = [self createLabelWithView:_bgView];

    _rightButton = [self createButtonWithView:_bgView];
    [_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
   
    _rightLabel = [self createLabelWithView:_bgView];
 
}

#pragma mark - 创建子视图
- (id)createLabelWithView:(UIView *)view {
    
    UILabel *subView = [[UILabel alloc] initWithFrame:CGRectZero];
    [view addSubview:subView];

    return subView;
}

- (id)createButtonWithView:(UIView *)view {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:button];
    
    return button;
}

#pragma mark - cell上button点击事件
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
    
    ItemsModel *model = self.model;
    
    if (model.cModel.des) {
        
        _titleLabel.frame = CGRectMake(10, 2, kMainBoundsW*5/6, 30);
        _titleLabel.text = model.cModel.title;
    }
    
    if (model.cModel.category) {
        
        _rightTitleLabel.frame = CGRectMake(kMainBoundsW*5/6, 10, 50, 20);
        _rightTitleLabel.attributedText = [AssistTool setTextWithString:[NSString stringWithFormat:@"#%@#",model.cModel.category] withColor:BXColor(129, 129, 129) withFont:10 withFontRange:NSMakeRange(0, model.cModel.category.length+2)];
        
    }
    
    if (model.cModel.year) {
        
        _dateLabel.frame = CGRectMake(10, CGRectGetMaxY(_titleLabel.frame), kMainBoundsW/6, 8);
        _dateLabel.text = [NSString stringWithFormat:@"%@.%@.%@",model.cModel.year,model.cModel.month,model.cModel.day];
    }
    
    if (model.cModel.picUrl) {

        _imageView.frame = CGRectMake(0, CGRectGetMaxY(_titleLabel.frame)+12, kMainBoundsW, kMainBoundsH/2);
        [_imageView sd_setImageWithURL:[NSURL URLWithString:model.cModel.picUrl]];
        
    }

    if (model.cModel.commentCount) {
        
        _leftButton.frame =CGRectMake(kMainBoundsW/12, CGRectGetMaxY(_imageView.frame)+10, kMainBoundsW/20, 15);
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"icon_bbs_detail_comment_title"] forState:UIControlStateNormal];
        
        _leftLabel.frame = CGRectMake(CGRectGetMaxX(_leftButton.frame)+5, CGRectGetMaxY(_imageView.frame)+5, kMainBoundsW/8, 20);
        _leftLabel.text = model.cModel.commentCount;

    }
    
    if (model.cModel.v) {
        
        _middleButton.frame =CGRectMake(kMainBoundsW*4/9, CGRectGetMaxY(_imageView.frame)+5, kMainBoundsW/18, 20);
        [_middleButton setBackgroundImage:[UIImage imageNamed:@"list_icon_link"] forState:UIControlStateNormal];
        
        _middleLabel.frame = CGRectMake(CGRectGetMaxX(_middleButton.frame)+5, CGRectGetMaxY(_imageView.frame)+5, kMainBoundsW/8, 20);
        _middleLabel.text = model.cModel.v;
       // KSLog(@"%@",model.cModel.v);
    }

    if (model.cModel.collectionCount) {
        
        _rightButton.frame =CGRectMake(kMainBoundsW*7/9, CGRectGetMaxY(_imageView.frame)+5, kMainBoundsW/18, 20);
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"bottom_like_button@3x"] forState:UIControlStateNormal];
        
        _rightLabel.frame = CGRectMake(CGRectGetMaxX(_rightButton.frame)+5, CGRectGetMaxY(_imageView.frame)+5,kMainBoundsW/8, 20);
        _rightLabel.text = model.cModel.collectionCount;
        
        
    }
    _bgView.frame = self.contentView.bounds;
    // NSLog(@"--->>%s",__FUNCTION__);
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
