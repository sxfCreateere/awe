//
//  ITTabBarVC.m
//  ITMVVMDemo
//
//  Created by Box on 16/5/10.
//  Copyright © 2016年 Box. All rights reserved.
//

#import "ITTabBarVC.h"

<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> master
=======

>>>>>>> master
#import "HomeVC.h"
#import "ShoopCarVC.h"
#import "CollocationVC.h"
#import "CommunityVC.h"
#import "NanYiBangVC.h"



#define kTabbarHeight 49
#define  kContentFrame  CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-kTabbarHeight)
#define  kDockFrame CGRectMake(0, self.view.frame.size.height-kTabbarHeight, self.view.frame.size.width, kTabbarHeight)

@interface ITTabBarVC ()<UITabBarControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, assign) BOOL jump;
@property (nonatomic, assign) NSInteger lastSelectIndex;
@property (nonatomic, strong) UIView *redPoint;
/** view */
@property (nonatomic, strong) UIView *mytabbar;

@property (nonatomic, strong) id popDelegate;
/** 保存所有控制器对应按钮的内容（UITabBarItem）*/
@property (nonatomic, strong) NSMutableArray *items;


@end

@implementation ITTabBarVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.view.backgroundColor = BXColor(231, 231, 231);
    // 添加所有子控制器
    [self addAllChildVc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addAllChildVc {
    // 添加初始化子控制器
    HomeVC *home = [[HomeVC alloc] init];
    home.view.backgroundColor = Global_mainBackgroundColor;
    [self addOneChildVC:home title:@"首页" imageName:@"bottom_home_icon@2x.png" selectedImageName:@"bottom_home_icon_on@2x.png"];
    
    CollocationVC *colloVC = [[CollocationVC alloc]init];
    [self addOneChildVC:colloVC title:@"搭配" imageName:@"bottom_dapei_icon@2x.png" selectedImageName:@"bottom_dapei_icon_on@2x.png"];
    colloVC.view.backgroundColor = Global_mainBackgroundColor;
    
    CommunityVC * commVC = [[CommunityVC alloc]init];
    [self addOneChildVC:commVC title:@"社区" imageName:@"bottom_bbs_icon@2x.png" selectedImageName:@"bottom_bbs_icon_on@2x.png"];
    commVC.view.backgroundColor = Global_mainBackgroundColor;
    
    ShoopCarVC * shCarVC =[[ShoopCarVC alloc]init];
    [self addOneChildVC:shCarVC title:@"购物车" imageName:@"bottom_shopping_icon@2x" selectedImageName:@"bottom_shopping_icon_on@2x"];
    shCarVC.view.backgroundColor = Global_mainBackgroundColor;
    
    NanYiBangVC * nybVC =[[NanYiBangVC alloc]init];
    [self addOneChildVC:nybVC title:@"男衣邦" imageName:@"bottom_head_sort@2x.png" selectedImageName:@"bottom_sort_icon_on@3x.png"];
   nybVC.view.backgroundColor = Global_mainBackgroundColor;

}

/**
 *  添加一个自控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中时的图标
 */

- (void)addOneChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
<<<<<<< HEAD
<<<<<<< HEAD
=======
    
    
>>>>>>> master
=======
    
    
>>>>>>> master
    // 设置标题
    childVc.tabBarItem.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置tabbarItem的普通文字
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [[UIColor alloc]initWithRed:113/255.0 green:109/255.0 blue:104/255.0 alpha:1];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = BXColor(255, 0, 106);
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 不要渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 记录所有控制器对应按钮的内容
    [self.items addObject:childVc.tabBarItem];
    
    // 添加为tabbar控制器的子控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
<<<<<<< HEAD
<<<<<<< HEAD
    
=======
>>>>>>> master
=======
>>>>>>> master
    nav.delegate = self;
    [self addChildViewController:nav];
}

<<<<<<< HEAD
<<<<<<< HEAD
#pragma mark - BXTabBarDelegate方法
//// 监听tabBar上按钮的点击
//- (void)tabBar:(BXTabBar *)tabBar didClickBtn:(NSInteger)index
//{
//    self.selectedIndex = index;
//}
//
//#pragma mark navVC代理
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    UIViewController *root = navigationController.viewControllers.firstObject;
//    if (viewController != root) {
//        //更改导航控制器的高度
//        navigationController.view.frame = self.view.bounds;
//        //从HomeViewController移除
//        [self.mytabbar removeFromSuperview];
//        // 调整tabbar的Y值
//        CGRect dockFrame = self.mytabbar.frame;
//        
//        if ([root.view isKindOfClass:[UIScrollView class]]) {
//            UIScrollView *scrollview = (UIScrollView *)root.view;
//            dockFrame.origin.y = scrollview.contentOffset.y + root.view.frame.size.height - kTabbarHeight;
//        } else {
//            // dockFrame.origin.y -= kDockHeight;
//            
//            dockFrame.origin.y = root.view.frame.size.height - kTabbarHeight;
//        }
//        _mytabbar.frame = dockFrame;
//        
//        
//        //添加dock到根控制器界面
//        [root.view addSubview:_mytabbar];
//    }
//}
//
//// 完全展示完调用
//-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    UIViewController *root = navigationController.viewControllers.firstObject;
//    ITNavigationController *nav = (ITNavigationController *)navigationController;
//    if (viewController == root) {
//        // 更改导航控制器view的frame
//        navigationController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kTabbarHeight);
//        
//        navigationController.interactivePopGestureRecognizer.delegate = nav.popDelegate;
//        // 让Dock从root上移除
//        [_mytabbar removeFromSuperview];
//        
//        //_mytabbar添加dock到HomeViewController
//        _mytabbar.frame = self.tabBar.frame;
//        [self.view addSubview:_mytabbar];
//    }
//}
//
=======
>>>>>>> master
=======
>>>>>>> master

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
