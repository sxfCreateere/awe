//
//  BoutiqueView.m
//  StarWardrobe
//
//  Created by Mac on 16/7/5.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "BoutiqueView.h"
#import "PosterView.h"


#define  CollViewTag  20
#define  BrandCellTyte @"brandcell"
#define  CommodityCellTyte @"commodityCell"

@interface BoutiqueView ()<UIScrollViewDelegate>


{
    NSArray * _topArray;
    NSArray * _comArray;
    NSArray * _brandArray;
    NSMutableArray * _picArray;
    
}


@end


@implementation BoutiqueView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        self.topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height/6-10)];
        [self addSubview:self.topImageView];
        
        
        self.brandSV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, frame.size.height/6, frame.size.width,frame.size.height/6-10)];
        self.brandSV.showsHorizontalScrollIndicator = NO;
        self.brandSV.tag = CollViewTag;
        [self addSubview:self.brandSV];
        
                
        self.pastorSV = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,self.frame.size.height/3, self.frame.size.width,self.frame.size.height/3+40) delegate:nil placeholderImage:nil];
//        self.pastorSV.autoScroll = NO;
        [self addSubview:self.pastorSV];
       
        
       
        
        
        self.commoditySV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.size.height/3*2+50, frame.size.width, frame.size.height/3-40-10)];
        self.brandSV.showsHorizontalScrollIndicator = NO;
        self.commoditySV.tag = CollViewTag +1;
        [self addSubview:self.commoditySV];
        
    }
    return self;
}

-(void)setViewControlStyleWithDataArray:(BoutiqueDataModel *)model
{
    _topArray = model.topImageArray;
    _comArray = model.commodityArray;
    _brandArray = model.brandArray;
    _picArray = model.picturesArray;

    
    BoutiqueSubModel * topModel = [_topArray firstObject];
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:topModel.picUrl]];
    
    
    self.brandSV.contentSize = CGSizeMake(_brandArray.count*(10+self.brandSV.height)+10, 0);
    for (int i = 0; i<_brandArray.count; i++) {
        BoutiqueSubModel * model =_brandArray[i];
        UIImageView * image =[[UIImageView alloc]init];
        image.frame = CGRectMake(10+(10+self.brandSV.height)*i, 0, self.brandSV.height, self.brandSV.height);
//        NSLog(@"%@",model.picUrl);
        [image sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
        
        [self.brandSV addSubview:image];
    }
    
    
    NSMutableArray *sdArr =[NSMutableArray array];
    for (NSInteger i =0; i<_picArray.count; i++) {
        BoutiqueSubModel * model =_picArray[i];
        [sdArr addObject:model.picUrl];
    }
    self.pastorSV.imageURLStringsGroup = sdArr;
    
    
    
    
    self.commoditySV.contentSize = CGSizeMake(_comArray.count*(self.commoditySV.height/2+10)+10, 0);
    for (int i = 0; i<_comArray.count; i++) {
        
        BoutiqueSubModel * model =_comArray[i];
        
        PosterView * poster = [[PosterView alloc]initWithBoutiModel:model];
        poster.frame = CGRectMake(10+(self.commoditySV.height/2+10)*i, 0, self.commoditySV.height/2, self.commoditySV.height);
        [self.commoditySV addSubview:poster];
    }

}



#pragma mark --- delegate



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    
    
    
    
    
}




@end
