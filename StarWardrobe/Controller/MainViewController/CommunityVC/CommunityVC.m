//
//  CommunityVC.m
//  StarWardrobe
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Xyc. All rights reserved.
//

<<<<<<< HEAD
<<<<<<< HEAD
#define CommunityCellID @"CommunityCellID"
#define TopOffSet _topScrollView.contentOffset.x
#import "CommunityVC.h"



@interface CommunityVC ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

{
    UIScrollView  *_mainScrollView;
    UIScrollView  *_topScrollView;
    UITableView  *table;
    UIPageControl  *_page;
    NSTimer   *timer;
    float  speed;
    
}

@property (nonatomic, strong)NSMutableArray  *mainDataArray;
@property (nonatomic, strong)NSMutableArray  *topDataArray;
@property (nonatomic, strong)NSMutableArray *indexArray;
=======
#import "CommunityVC.h"

@interface CommunityVC ()
>>>>>>> master
=======
#import "CommunityVC.h"

@interface CommunityVC ()
>>>>>>> master

@end

@implementation CommunityVC

<<<<<<< HEAD
<<<<<<< HEAD
#pragma mark --- 视图将要出现
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    speed = -kMainBoundsW;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        timer = [NSTimer  scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(autoMove) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]run];
        
    });
    
}

#pragma mark --- 视图已经加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //获得顶部滚动视图数据
    [self getDataArrayForTopScrollView];
    
    //创建视图
    [self createView];
    
    //获得TableView数据
    [self getDataArrayForTableView];
    
}

#pragma mark --- 懒加载tableView数据源
- (NSMutableArray *)mainDataArray {
    
    if (!_mainDataArray) {
        _mainDataArray = [NSMutableArray array];
    }
    
    return _mainDataArray;
}

#pragma mark --- 懒加载topScrollview数据源
- (NSMutableArray *)topDataArray {
    
    if (!_topDataArray) {
        _topDataArray = [NSMutableArray array];
    }
    
    return _topDataArray;
}

#pragma mark --- 懒加载盛装索引的数据源
- (NSMutableArray *)indexArray {
    
    if (!_indexArray) {
        _indexArray = [NSMutableArray arrayWithObjects:[NSMutableArray array],[NSMutableArray array], nil];
    }
    
    return _indexArray;
}

#pragma mark --- 创建scrollView
- (void)createView {
    
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_logo"]];
    
    UIScrollView  *mainScrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    mainScrollView.backgroundColor = [UIColor whiteColor];
    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
    
    _mainScrollView = mainScrollView;
    
    UIScrollView  *topScrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, kMainBoundsH/3)];
    topScrollView.pagingEnabled = YES;
    topScrollView.showsHorizontalScrollIndicator = NO;
    topScrollView.bounces = NO;
    topScrollView.delegate = self;
    [mainScrollView addSubview:topScrollView];
    
    _topScrollView = topScrollView;

    [self createTableView];
}

#pragma mark --- 创建pageController
- (void)createPage {
    
    UIPageControl  *page = [[UIPageControl alloc]initWithFrame:CGRectMake(kMainBoundsW/6, CGRectGetMaxY(_topScrollView.frame)-40, kMainBoundsW*2/3, 30)];
    page.numberOfPages = self.topDataArray.count;
    page.pageIndicatorTintColor = [UIColor whiteColor];
    page.currentPageIndicatorTintColor = [UIColor blackColor];
    [page addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventTouchUpInside];
    [_mainScrollView addSubview:page];
    
    _page = page;
    
}

#pragma mark --- 当pageControl的当前页改变时调用
- (void)pageChange:(UIPageControl *)page {
    
    _topScrollView.contentOffset = CGPointMake(kMainBoundsW*page.currentPage, 0);
    
}


#pragma mark --- 获得topScrollView数据源
- (void)getDataArrayForTopScrollView {
  
    NSString  *url = @"http://api-v2.mall.hichao.com/forum/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=";
    
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
           KSLog(@"responseObject");
        if (netConnetState) {
            [NetRequestClass netRequestGETWithRequestURL:url WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
                
                KSLog(@"responseObject");

                if (responseObject) {
                    
                    NSArray  *array = responseObject[@"data"][@"items"];
                    
                    for (NSInteger i = 0; i<array.count; i++) {
                        NSDictionary *dic =array[i][@"component"];
                        NSString *picUrl = dic[@"picUrl"] ;
                        [_topDataArray addObject:picUrl];
                    }
                    [self createTopImageView];
                    [self createPage];
                    
                    KSLog(@"%@",responseObject);
                }
                
            }];
        }
    }];
    
    
}

#pragma mark --- 添加scrollView图片
- (void)createTopImageView{
    
    if (!self.topDataArray) {
        return;
    }
    
    _topScrollView.contentSize = CGSizeMake(kMainBoundsW*self.topDataArray.count, 0);
    for (NSInteger i = 0; i < self.topDataArray.count; i++) {
        
        UIImageView  *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, kMainBoundsH/3)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.topDataArray[i]]];
        [_topScrollView addSubview:imageView];
    }
    
}

#pragma mark  --- 计时器方法
- (void)autoMove {
    
    if (_page.currentPage == self.topDataArray.count-1||_page.currentPage==0) {
        
        speed = - speed;
        
    }
    
    [_topScrollView setContentOffset:CGPointMake(TopOffSet+speed, 0) animated:YES];
    
    _page.currentPage = (TopOffSet+100)/kMainBoundsW;
    
}

#pragma mark  --- 当scrollView 开始拖动时调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if ([scrollView isEqual: _topScrollView]) {
        
        [timer invalidate];
        timer = nil;
    }
    
}

#pragma mark  --- 当scrollView 结束拖动时调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (TopOffSet<0) {
        [_topScrollView setContentOffset:CGPointMake(100, 0) animated:YES];
    }
    
    if ([scrollView isEqual: _topScrollView]) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            timer = [NSTimer  scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(autoMove) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop]run];
            
            
        });
    }
    
}

#pragma mark --- TableView
- (void)createTableView {
    
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_topScrollView.frame), kMainBoundsW/2, kMainBoundsH) style: UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.scrollEnabled = NO;
    
    [_mainScrollView addSubview:table];
    
    [table registerClass:[ShopTableViewCell class] forCellReuseIdentifier:CommunityCellID];
    
}

#pragma mark --- 获得tableView数据源
- (void)getDataArrayForTableView {
    
    //    [self.mainDataArray addObjectsFromArray:array];
    //
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //
    //            [self reloadTableView];
    //        });
    //
    
    NSString  *url = @"http://api-v2.mall.hichao.com/forum/timeline?nav_id=5&nav_name=%E7%83%AD%E9%97%A8&flag=&user_id=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=";
    
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
        if (netConnetState) {
            [NetRequestClass netRequestGETWithRequestURL:url WithParameter:nil WithReturnValeuBlock:^(id responseObject, NSError *error) {
                
                if (responseObject) {
//                    
//                    NSArray  *array = responseObject[@"data"][@"items"];
//                    
//                    for (NSInteger i = 0; i<array.count; i++) {
//                        NSDictionary *dic =array[i][@"component"];
//                        NSString *picUrl = dic[@"picUrl"];
//                        [_topDataArray addObject:picUrl];
//                    }
                   
                    //KSLog(@"%@",responseObject);
                }
                
            }];
        }
    }];
    

    
    
    
    
}

#pragma mark --- 设置tableView行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
    
}

#pragma mark --- cell内容设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShopTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:CommunityCellID forIndexPath:indexPath];
    
    
    // [cell setAllDefault];
    
    //        cell.model = model;
    
    [cell buttonCallBackBlock:^{
        
    }];
    
    
    
    return cell;
    
}

#pragma mark --- table行高设置
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    
    return 50;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    
    
    return view;
}

#pragma mark --- 当MainscrollView 滑动时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    _page.currentPage = TopOffSet/kMainBoundsW;
    
    if ([scrollView isEqual: _mainScrollView]) {
        
        
        if (scrollView.contentOffset.y <=CGRectGetMaxY(_topScrollView.frame)) {
            
            table.frame = CGRectMake(0, CGRectGetMaxY(_topScrollView.frame), kMainBoundsW, kMainBoundsH);
            table.contentOffset = CGPointMake(0, 0);
            
            return;
            
        }
        
        table.center = CGPointMake(table.center.x, _mainScrollView.contentOffset.y + self.view.center.y);
        
        CGPoint offset = scrollView.contentOffset;
        
        offset.y -= CGRectGetMaxY(_topScrollView.frame);
        table.contentOffset = offset;
        // NSLog(@"%.2f --->> %.2f",_mainScrollView.contentOffset.y,self.view.center.y);
        
    }
    
}

#pragma mark --- 视图将要消失时调用
- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    [timer invalidate];
    timer = nil;
    
}


=======
=======
>>>>>>> master
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
<<<<<<< HEAD
<<<<<<< HEAD
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
=======
=======
>>>>>>> master
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master

@end
