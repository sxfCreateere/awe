//
//  IntroductionVC.m
//  StarWardrobe
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "IntroductionVC.h"

@interface IntroductionVC ()<UIScrollViewDelegate>

@end

@implementation IntroductionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    [self createView];
}

-(void)createView{
    
    UIScrollView *backView =[[UIScrollView alloc]initWithFrame:kMainBounds];
    backView.pagingEnabled = YES;
    backView.contentSize = CGSizeMake(kMainBoundsW*4, kMainBoundsH);
    backView.bounces = NO;
    for (int i= 0; i<4; i++) {
        
        UIImageView *bgimage = [[UIImageView alloc]init];
        bgimage.frame = CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, kMainBoundsH);
        bgimage.image = [UIImage imageNamed:[NSString stringWithFormat:@"1024-768-%d-1.jpg",i+1]];
        [backView addSubview:bgimage];
        
        UIImageView *image = [[UIImageView alloc]init];
        image.frame = CGRectMake(0, 0, kMainBoundsW, kMainBoundsH);
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"1024-768-%d",i+1]];
        [bgimage addSubview:image];
    }
    
    backView.delegate = self;
    [self.view addSubview:backView];
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeSystem];
    button.bounds = CGRectMake(0, 0, 120, 50);
    button.center = CGPointMake(kMainBoundsW/2, kMainBoundsH-50);

    [button addTarget:self action:@selector(ClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)ClickButton:(UIButton *)sender{
     self.block();
}

-(void)enterRootVC:(DidSelectedEnter)newBlock
{
    self.block = newBlock;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
