//
//  CollocationVC.m
//  StarWardrobe
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "CollocationVC.h"
<<<<<<< HEAD
<<<<<<< HEAD
#import "CustomCell.h"
#import "TopicsCell.h"

#define CustomCellID  @"CollectionViewCellID"
#define HeaderID @"HeaderID"
#define TopicsCellID @"TopicsCellID"

@interface CollocationVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,PinterestDelegate,UITableViewDataSource,UITableViewDelegate> {
    
    UIView *bgView;
    NSString *firstUrl;
    NSDictionary *classifyDic;
    UICollectionView  *matchesCollectionView;
    UICollectionView  *classifyCollectionView;
    ClassifyView   *classifyView;
    UILabel  *classifyLabel;
    UIView  *animationView;
    UIButton  *leftButton;
    UIButton  *rightButton;
    UITableView  *topicsTableView;
}

@property (nonatomic, strong)NSMutableArray  *latestArray;
@property (nonatomic,strong)NSMutableArray *topicsArray;
@property (nonatomic ,strong)NSMutableArray *myClassifyArray;
@property (nonatomic, strong)NSMutableArray *addClassifyArray;
=======

@interface CollocationVC ()

>>>>>>> master
=======

@interface CollocationVC ()

>>>>>>> master
@end

@implementation CollocationVC

<<<<<<< HEAD
<<<<<<< HEAD
#pragma mark    --- 视图将要出现 ---
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   // [self headerRefreshInfo];
    
}
 
=======
>>>>>>> master
=======
>>>>>>> master
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
<<<<<<< HEAD
<<<<<<< HEAD
    self.navigationItem.titleView =  [self customNavView];
   
    [self getLatestData];
    [self createView];
    [self createTopicsTableView];
    self.view.backgroundColor = [UIColor redColor];
}

#pragma mark - 自定义导航
- (UIView *)customNavView{
    
    classifyDic = [AssistTool getClassifyData];
    self.addClassifyArray = (NSMutableArray *)[classifyDic allKeys];

    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    
    leftButton = [self  createButtonWithTitle:@"搭配" withView:navView];
    leftButton.selected = YES;
    leftButton.frame = CGRectMake(10, 0, 40, navView.frame.size.height);
    [leftButton addTarget:self action:@selector(matches:) forControlEvents:UIControlEventTouchUpInside];
    
    
    rightButton = [self  createButtonWithTitle:@"专题" withView:navView];
    rightButton.frame = CGRectMake(60, 0, 40, navView.frame.size.height);
    [rightButton addTarget:self action:@selector(topics:) forControlEvents:UIControlEventTouchUpInside];
    
    animationView = [[UIView alloc]initWithFrame:CGRectMake( 10, 25, 40, 4)];
    animationView.backgroundColor = [UIColor magentaColor];
    [navView addSubview:animationView];
    
   
    
    return navView;
}

- (UIButton *)createButtonWithTitle:(NSString *)title withView:(UIView *)view {
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor magentaColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [view addSubview:button];
    
    return button;
}

#pragma mark - 搭配按钮点击事件
- (void)matches:(UIButton *)sender{
    
    sender.selected = YES;
    rightButton.selected = NO;
    [UIView animateWithDuration:0.5 animations:^{
        
        bgView.frame = CGRectMake(0, 64, kMainBoundsW, kMainBoundsH-64);
        topicsTableView.frame = CGRectMake(kMainBoundsW, 25, kMainBoundsW, kMainBoundsH-25);
        animationView.frame = CGRectMake(sender.frame.origin.x, 25, 40, 4);
        
    }];
    
    [sender setTitleColor:[UIColor magentaColor] forState:UIControlStateSelected];
    [sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
}

#pragma mark - 专题按钮点击事件
- (void)topics:(UIButton *)sender{
    
    [self getTopicsData];
    sender.selected = YES;
    leftButton.selected = NO;
    [UIView animateWithDuration:0.5 animations:^{
        
        bgView.frame = CGRectMake(-kMainBoundsW, 64, kMainBoundsW, kMainBoundsH-64);
        topicsTableView.frame = CGRectMake(0, 25, kMainBoundsW, kMainBoundsH-25);
        animationView.frame = CGRectMake(sender.frame.origin.x, 25, 40, 4);
    }];
    
    [sender setTitleColor:[UIColor magentaColor] forState:UIControlStateSelected];
    [sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    

}


#pragma mark - 懒加载数组

- (NSMutableArray *)myClassifyArray {
    
    if (!_myClassifyArray) {
        
        _myClassifyArray = [NSMutableArray array];
    }
    
    return _myClassifyArray;
}

- (NSMutableArray *)addClassifyArray {
    
    if (!_addClassifyArray) {
        
        _addClassifyArray = [NSMutableArray array];
    }
    
    return _addClassifyArray;
}

- (NSMutableArray *)latestArray {
    
    if (!_latestArray) {
        
        _latestArray = [NSMutableArray array];
    }
    
    return _latestArray;
}

- (NSMutableArray *)topicsArray {
    
    if (!_topicsArray) {
        
        _topicsArray = [NSMutableArray array];
    }
    
    return _topicsArray;
}

#pragma mark - 创建视图控件
- (void)createView {

    
    bgView =[[UIView alloc]initWithFrame:CGRectMake(0, 64, kMainBoundsW, kMainBoundsH-64)];
    [self.view addSubview:bgView];
    
    [self createTopView];

    
    UICollectionViewPintersetFlowLayout  *layout = [[UICollectionViewPintersetFlowLayout alloc]init];
    layout.delegate = self;
    layout.itemWidth = kMainBoundsW/2 - 10;
    layout.columnCount = 2;
    layout.sectionIntsets = UIEdgeInsetsMake(5, 5, 5, 5);
    
    
    matchesCollectionView = [self  createCollectionWithFrame:CGRectMake(0, 30, kMainBoundsW, kMainBoundsH-94) withLayout:layout];
    
      [self createClassifyView];
    
    [matchesCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];
    [matchesCollectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:CustomCellID];
    
    [self refreshInfo];
  

}

- (void)createTopView {
    
    
    TopScrollView *topView =[[TopScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW*5/6, 30) With:self.myClassifyArray];
    [topView buttonCallBackBlock:^(UIButton *sender) {
        
//        [self getLatestDataWithUrl:classifyDic[sender.currentTitle]];
        // [self refreshInfoWith:url];
        NSLog(@"%@",sender.currentTitle);
        
    }];
    [bgView addSubview:topView];
}


#pragma mark - 选择分类按钮

- (void)createClassifyView {
    
    classifyView = [[ClassifyView alloc]initWithFrame:CGRectMake(0, 64, kMainBoundsW, 0) withMyClassifyArray:self.myClassifyArray withAddArray:self.addClassifyArray];
    
 
    [classifyView  myClassifyButtonCallBackBlock:^(UIButton *sender) {
   
        NSLog(@"%@",sender.currentTitle);
        
    }];
    

    [classifyView addClassifyButtonCallBackBlock:^(UIButton *sender) {

       // NSLog(@"%@",sender.currentTitle);
        
    }];
    classifyView.clipsToBounds = YES;
    classifyView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:classifyView];
    
    classifyLabel = [[UILabel alloc]initWithFrame:CGRectMake(kMainBoundsW*2/5, 64, kMainBoundsW/5, 0)];
    [classifyView addSubview:classifyLabel];
    
    UIButton  *classifyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [classifyButton setBackgroundImage:[UIImage imageNamed:@"icon_class_open@3x"] forState:UIControlStateNormal];
    [classifyButton addTarget:self action:@selector(chooseClassify:) forControlEvents:UIControlEventTouchUpInside];
    classifyButton.backgroundColor = [UIColor whiteColor];
    classifyButton.frame = CGRectMake(kMainBoundsW*6/7, 5, 20, 20);
    [bgView addSubview:classifyButton];
    
}
- (void)chooseClassify:(UIButton *)sender {
    
    classifyLabel.text = @"频道定制";
    sender.selected = !sender.selected;
    if (sender.selected) {
        
        [UIView animateWithDuration:0.5 animations:^{
          
        classifyLabel.frame = CGRectMake(kMainBoundsW*2/5, 0, kMainBoundsW/5, 30);
        classifyView.frame = CGRectMake(0, 0, kMainBoundsW, kMainBoundsH);
        sender.transform = CGAffineTransformMakeRotation(M_PI);
   
        }];
  
    } else {
        
        [UIView animateWithDuration:0.5 animations:^{
        
        classifyLabel.frame = CGRectMake(kMainBoundsW*2/5, 0, kMainBoundsW/5, 0);
        classifyView.frame = CGRectMake(0, 0, kMainBoundsW, 0);
        sender.transform = CGAffineTransformMakeRotation(-M_PI*2);
            
        }];
        
    }

    
}

- (UICollectionView *)createCollectionWithFrame:(CGRect)frame withLayout:(UICollectionViewPintersetFlowLayout *)layout{
    
  UICollectionView  *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [bgView addSubview:collectionView];

    return collectionView;
}

- (void)createTopicsTableView {
    
    topicsTableView = [[UITableView alloc]initWithFrame:CGRectMake(kMainBoundsW, 25, kMainBoundsW, kMainBoundsH) style:UITableViewStyleGrouped];
    topicsTableView.delegate = self;
    topicsTableView.dataSource = self;
    [self.view addSubview:topicsTableView];

    self.view.backgroundColor = [UIColor redColor];
    [topicsTableView registerClass:[TopicsCell class] forCellReuseIdentifier:TopicsCellID];
    
}


#pragma mark  -  添加刷新控件
-(void)refreshInfo{
 
    [self refreshAllDataWith:matchesCollectionView with:^(bool isOnline) {
        
        if (isOnline) {
            
            [self getLatestData];

        }
    }];
    
    [self refreshAllDataWith:topicsTableView with:^(bool isOnline) {
   
        if (isOnline) {
            
            [self getTopicsData];
            
        }
    }];
    
}

- (void)refreshAllDataWith:(UIScrollView *)view with:(void(^)(bool isOnline))refresh {
    
    view.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
            //在这个地方判断是否有网 ，如果有网则请求数据
            if (netConnetState) {
                
                refresh(YES);
            }
            else{
                refresh(NO);
                [view.mj_header endRefreshing];
            }
            
        }];
    }];
    
    [view.mj_header beginRefreshing];

    view.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       
        [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {

            //在这个地方判断是否有网 ，如果有网则请求数据
            if (netConnetState) {
                
                refresh(YES);
            }
            else{
                
                refresh(NO);
                [view.mj_footer endRefreshing];
            }
            
        }];
    }];
    
    [view.mj_footer beginRefreshing];
    
}

#pragma mark - 获得相应数据
- (void)getLatestData{

    NSString  *url = @"http://api-v2.mall.hichao.com/star/list?category=%E5%85%A8%E9%83%A8&lts=&pin=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=";
    
    NSString  *latestFlag = @"";
    if (matchesCollectionView.contentOffset.y > kMainBoundsH/2) {
       latestFlag = [[NSUserDefaults standardUserDefaults]objectForKey:@"latestFlag"];
        
    } else {
        
        [self.latestArray removeAllObjects];
    }
    
    [self getDataWithUrl:url withValue:latestFlag withKey:@"latestFlag" with:self.latestArray with:matchesCollectionView];
    
    [matchesCollectionView.mj_header endRefreshing];
    [matchesCollectionView.mj_footer endRefreshing];
                
    
}

- (void)getTopicsData {
    
    NSString *url = @"http://api-v2.mall.hichao.com/mix_topics?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=ECC2B810-D18C-4BCE-84B8-688CE56E5399&gs=1536x2048&gos=9.3.1&access_token=";
    
    NSString  *topicsFlag = @"";
    if (topicsTableView.contentOffset.y > kMainBoundsH/2) {
   topicsFlag = [[NSUserDefaults standardUserDefaults]objectForKey:@"topicsFlag"];
      
    } else {
 
        [self.topicsArray removeAllObjects];
    }
    [self getDataWithUrl:url withValue:topicsFlag withKey:@"topicsFlag" with:self.topicsArray with:topicsTableView];
    [topicsTableView.mj_header endRefreshing];
    [topicsTableView.mj_footer endRefreshing];
  
}


- (void)getDataWithUrl:(NSString *)url withValue:(NSString *)value withKey:(NSString *)key with:(NSMutableArray *)dataArray with:(id)view{
    
    [NetRequestClass netWorkReachabilityWithURLString:NETWORKINGURL  completion:^(BOOL netConnetState) {
        if (netConnetState) {
            [NetRequestClass netRequestGETWithRequestURL:url WithParameter:@{@"flag":value} WithReturnValeuBlock:^(id responseObject, NSError *error) {
                
                if (responseObject) {
                    
                    NSString  *flag = responseObject[@"data"][@"flag"];
                    [[NSUserDefaults standardUserDefaults]setObject:flag forKey:key];
                    NSArray *array = responseObject[@"data"][@"items"];
                    if (!array) {
                        KSLog(@"没有返回数据");
                        return ;
                    }
                    
                    for (NSInteger i = 0; i < array.count ; i++) {
                        
                        NSDictionary  *dic  = array[i];
                        
                        ItemsModel   *model = [ItemsModel createITModelWithDic:dic];
                        
                        [dataArray addObject:model];
                    }
                    
                    [view reloadData];
              }
                
            }];
        }
    }];
  
}


#pragma mark - myCollectionView 协议方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (!self.latestArray) {
        
        return 0;
    }
    return self.latestArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    return CGSizeMake(kMainBoundsW/2-20, 200);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(20, 10, 10, 10);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView  *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID forIndexPath:indexPath];
    headerView.backgroundColor = [UIColor magentaColor];
    
    
    
    return headerView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CustomCellID forIndexPath:indexPath];
    
    //[cell setAllDefault];
    cell.itModel = self.latestArray[indexPath.row];
    
    return cell;
}

- (CGFloat)getHeightWithIndexPath:(NSIndexPath *)indexPath {
    
    ItemsModel  *itModel = self.latestArray[indexPath.row];
    CGFloat height = [itModel.height floatValue] * (kMainBoundsW/2 - 10)/[itModel.width floatValue];
    
    
    return height + 60;
    
    
}

#pragma mark - topicsTableView 协议方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.topicsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopicsCell  *cell = [tableView dequeueReusableCellWithIdentifier:TopicsCellID forIndexPath:indexPath];
    cell.model = self.topicsArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return kMainBoundsH/2 + 80;
    
=======
    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
>>>>>>> master
=======
    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
>>>>>>> master
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

<<<<<<< HEAD
<<<<<<< HEAD

@end

=======
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
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
