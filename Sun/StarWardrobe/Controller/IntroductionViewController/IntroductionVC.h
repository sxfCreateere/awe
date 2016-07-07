//
//  IntroductionVC.h
//  StarWardrobe
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroductionVC : UIViewController

@property (nonatomic,copy) DidSelectedEnter block;

- (void)enterRootVC:(DidSelectedEnter)newBlock;

@end
