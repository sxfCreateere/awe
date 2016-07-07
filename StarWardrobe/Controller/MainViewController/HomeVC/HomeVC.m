//
//  HomeVC.m
//  StarWardrobe
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "HomeVC.h"
<<<<<<< HEAD
<<<<<<< HEAD

@interface HomeVC ()
=======
=======
>>>>>>> master
#import "ReslutVC.h"
#import "BXTabBarButton.h"
#import "NetRequestClass.h"
#import "TopSVModel.h"
#import "XPosterCVCell.h"
#import "BoutiqueDataModel.h"
#import "BoutiqueView.h"
#import "XShowComModel.h"
#import "ShowComCV.h"
#import "XRequestTool.h"
#import "MJRefresh.h"

#define RootURL http://api-v2.mall.hichao.com
#define BgSVTag 10
#define TopSVTag 11
#define CellIdentifier  @"posterCell"
#define BoutiqueURL(a) @"http://api-v2.mall.hichao.com/mall/region/new?region_id=(a)&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=CBD795AD-1BFC-40FE-A351-407FEAC7219D&gs=640x1136&gos=8.4.1&access_token="

typedef NS_ENUM(NSInteger, UICollectionTag) {
    ShowComCVTag = 30,
    PosterCVTag = 31,
};

@interface HomeVC ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>

{
    UIScrollView * _bgScrollView;
    UIScrollView * _topSV;
    UIPageControl * _topPageControl;
    UICollectionView * _posterCV;
    NSTimer * _topSVTimer;
    NSInteger _topTimerNum;
    
    UITableView * _boutiqueTV;
    UICollectionView *_weaterFullView;
    CGFloat _oldTableViewY;
    CGSize _boutiqueTVContentSize;
    CGSize _weaterCVContentSize;
    UISegmentedControl * _showPicViewControl;
    NSInteger refreshNum ;
}

@property (nonatomic,retain)NSMutableArray *  topDataArray;
@property (nonatomic,retain)NSMutableArray *  posterCVDataArray;
@property (nonatomic,retain)NSMutableArray *  boutiqueTVArray;
@property (nonatomic,assign)CGFloat topSVHight;
@property (nonatomic,retain)NSMutableArray * showComCVDataArray;

<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master

@end

@implementation HomeVC

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> master
-(void)createANSTimer{
    
    _topSVTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(handoverScrollViewSubView) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:_topSVTimer forMode:NSRunLoopCommonModes];
    
}

-(void)handoverScrollViewSubView{
    _topTimerNum++;
    _topTimerNum=_topTimerNum % _topDataArray.count;
    _topSV.contentOffset = CGPointMake(_topTimerNum*kMainBoundsW, 0);
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_topSVTimer invalidate];
    _topSVTimer = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    _topTimerNum = 0;
    [self createANSTimer];
}

<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
<<<<<<< HEAD
<<<<<<< HEAD
    self.title = @"Home";
    

//    ClassifyView *view = [[ClassifyView alloc]initWithFrame:kMainBounds];
//    [self.view addSubview:view];
    
}

=======
=======
>>>>>>> master
    refreshNum = 0;
    
    [self setNavigationBarItem];
    
    [self getTopSVDataResultWith:nil];
    [self getPosterDataResultWith:nil];
    [self createTopScrollView];
    
    
    [self getBoutiqueDataResultWith:nil];
    [self createJingPinGuanView];
    
    [self getWaterFallDataWithIndex:0 andResultWith:nil];
    [self createWeaterFullView];

    BOOL isHttpRequest =  [NetRequestClass netWorkReachabilityWithURLString:@"https://www.apple.com"];
    
    if (isHttpRequest) {
        
        NSLog(@"Yes %d",isHttpRequest);
    }else{
        
        [_bgScrollView.mj_header beginRefreshing];
        NSLog(@"No %d",isHttpRequest);
    }
    
    
}

- (void)getWaterFallDataWithIndex:(NSInteger) index  andResultWith:(DidSelectedEnter)isBlock{
    
    
    [XRequestTool requestShowCVChangeDataWithTag:index returnData:^(NSArray *array) {
    
        self.showComCVDataArray  = nil;
        [self.showComCVDataArray addObjectsFromArray:array];
        [_weaterFullView reloadData];
        
        if (isBlock) {
            isBlock();
        }
        
    }];

}

-(void)getPosterDataResultWith:(DidSelectedEnter)isBlock {
    
    [XRequestTool requestPosterData:^(NSArray *array) {
        
        self.posterCVDataArray = nil;
        [self.posterCVDataArray addObjectsFromArray:array];
        [_posterCV reloadData];
        
        if (isBlock) {
            isBlock();
        }
    }];
    
}

-(void)getBoutiqueDataResultWith:(DidSelectedEnter)isBlock{
    [XRequestTool requestBoutiqueData:^(NSArray *array) {
        
        self.boutiqueTVArray = nil;
        [self.boutiqueTVArray addObjectsFromArray:array];
        [_boutiqueTV reloadData];
        
        _boutiqueTVContentSize = _boutiqueTV.contentSize;
        _bgScrollView.contentSize = CGSizeMake(0, 690+_boutiqueTVContentSize.height+3250);
        
        if (isBlock) {
            isBlock();
        }
    }];
}

-(void)getTopSVDataResultWith:(DidSelectedEnter)isBlock
{
    [XRequestTool requestTopSVData:^(NSArray *array) {
        
        self.topDataArray = nil;
        [self.topDataArray addObjectsFromArray:array];
        
        [self updateTopScrollView];
        if (isBlock) {
            isBlock();
        }
    }];
}


#pragma mark ----创建瀑布流

-(void)createWeaterFullView{
    
    
    NSArray * array = @[@"今日上新",@"上装",@"裙装",@"裤装"];
    
    UISegmentedControl * showPicViewControl = [[UISegmentedControl alloc]initWithItems:array];
    showPicViewControl.frame = CGRectMake(0, 1300, kMainBoundsW, 40);
    showPicViewControl.selectedSegmentIndex = 0;
    [showPicViewControl addTarget:self action:@selector(changeShowPicView:) forControlEvents:UIControlEventValueChanged];
    [_bgScrollView addSubview:showPicViewControl];
    
    _showPicViewControl = showPicViewControl;
    
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    UICollectionView *weaterFullView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 1340, kMainBoundsW, kMainBoundsH-64-20) collectionViewLayout:layout];
    weaterFullView.delegate = self;
    weaterFullView.dataSource = self;
    weaterFullView.tag = ShowComCVTag;
    weaterFullView.scrollEnabled = NO;
    weaterFullView.backgroundColor = [UIColor whiteColor];
    [weaterFullView registerClass:[ShowComCV class] forCellWithReuseIdentifier:@"cellID"];
    
    [_bgScrollView addSubview:weaterFullView];
    _weaterFullView = weaterFullView;
    
}

-(void)changeShowPicView:(UISegmentedControl *)segment
{
    NSInteger index = segment.selectedSegmentIndex;
//    NSLog(@"%ld",index);
    [self getWaterFallDataWithIndex:index andResultWith:nil];
    
//    NSLog(@" -------- %f",_weaterFullView.contentSize.height);
    
    _bgScrollView.contentSize = CGSizeMake(0, 690+_boutiqueTVContentSize.height+3250);
}

-(NSMutableArray *)showComCVDataArray
{
    if (!_showComCVDataArray) {
        _showComCVDataArray = @[].mutableCopy;
    }
    
    return _showComCVDataArray;
}


#pragma  mark ---创建精品馆视图
-(void)createJingPinGuanView
{
    _boutiqueTV =[[UITableView alloc]initWithFrame:CGRectMake(0, 690, kMainBoundsW, kMainBoundsH-64-49) style:UITableViewStyleGrouped];
    _oldTableViewY = _boutiqueTV.center.y;
    _boutiqueTV.delegate = self;
    _boutiqueTV.dataSource = self;
    _boutiqueTV.tag = 200;
    _boutiqueTV.scrollEnabled = NO;
    [_bgScrollView addSubview:_boutiqueTV];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return  self.boutiqueTVArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cellone"];
    
    if (!cell) {
    
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellone"];
    }
    
    UIView * view =[cell.contentView.subviews firstObject];
    [view removeFromSuperview];
    cell.backgroundColor = [UIColor whiteColor];
    BoutiqueView * cellView =[[BoutiqueView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 600)];
    [cellView setViewControlStyleWithDataArray:_boutiqueTVArray[indexPath.row]];
    
    [cell.contentView addSubview:cellView];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 600;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

-(NSMutableArray *)boutiqueTVArray
{
    if (!_boutiqueTVArray) {
        _boutiqueTVArray = @[].mutableCopy;
        
    }
    return  _boutiqueTVArray;
}


#pragma mark --create背景SV和子View

-(void)createTopScrollView{
    
    
    UIScrollView * bgScrollView =[[UIScrollView alloc]init];
    bgScrollView.autoresizesSubviews = NO;
    bgScrollView.frame = CGRectMake(0, 64, kMainBoundsW, kMainBoundsH-64-49);
    bgScrollView.contentSize = CGSizeMake(kMainBoundsW, kMainBoundsH*10);
    bgScrollView.backgroundColor = [UIColor redColor];
    bgScrollView.delegate = self;
    bgScrollView.tag = BgSVTag;
    [self.view addSubview:bgScrollView];
    _bgScrollView = bgScrollView;
    
    bgScrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
        
        dispatch_group_t refreshGroup = dispatch_group_create();
        
        dispatch_group_enter(refreshGroup);
        [self getBoutiqueDataResultWith:^{
            dispatch_group_leave(refreshGroup);
        }];
        
        dispatch_group_enter(refreshGroup);
        [self getPosterDataResultWith:^{
            dispatch_group_leave(refreshGroup);
        }];
        
        dispatch_group_enter(refreshGroup);
        [self getTopSVDataResultWith:^{
            dispatch_group_leave(refreshGroup);
        }];
        
        dispatch_group_enter(refreshGroup);
        [self getWaterFallDataWithIndex:0 andResultWith:^{
            dispatch_group_leave(refreshGroup);
        }];
        
        
        dispatch_group_notify(refreshGroup, dispatch_get_main_queue(), ^{
           
            [bgScrollView.mj_header endRefreshing];
        });
        
    }];
    
    
    bgScrollView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        
        
        [XRequestTool footerRefreshDataWithNum:refreshNum refreshData:^(NSArray *array) {
            
            [_showComCVDataArray addObjectsFromArray:array];
            [_weaterFullView reloadData];
            
            _bgScrollView.contentSize = CGSizeMake(0, _bgScrollView.contentSize.height+ 3250);
            
            [bgScrollView.mj_footer endRefreshing];
        }];
        
        refreshNum ++;
    }];
    
    
    
    
    UIScrollView * topSV =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsW, 200)];
    topSV.autoresizesSubviews = NO;
    topSV.pagingEnabled = YES;
    topSV.showsHorizontalScrollIndicator = NO;
    topSV.bounces = NO;
    topSV.delegate = self;
    topSV.tag = TopSVTag;
    
    [bgScrollView addSubview:topSV];
    topSV.contentSize = CGSizeMake(0, (self.topDataArray.count+2)*kMainBoundsW);
    _topSV = topSV;
    
    UIPageControl * pageControl = [[UIPageControl alloc]init];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [pageControl addTarget:self action:@selector(topSVScroll:) forControlEvents:UIControlEventValueChanged];
    [bgScrollView addSubview:pageControl];
    _topPageControl = pageControl;
    
    
    UICollectionViewFlowLayout * posterCVLayout =[[UICollectionViewFlowLayout alloc]init];
    posterCVLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *  posterCV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, topSV.bounds.size.height, kMainBoundsW, 400) collectionViewLayout:posterCVLayout];
    posterCV.delegate = self;
    posterCV.tag =PosterCVTag;
    posterCV.dataSource = self;
    posterCV.backgroundColor = [UIColor grayColor];
    [bgScrollView addSubview:posterCV];
    
    [posterCV registerClass:[XPosterCVCell class] forCellWithReuseIdentifier:CellIdentifier];
    _posterCV = posterCV;
    
}

#pragma mark --PosterCV方法

-(NSMutableArray *)posterCVDataArray
{
    if (!_posterCVDataArray)
    {
        _posterCVDataArray = [NSMutableArray array];
        
    }
    return _posterCVDataArray;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == ShowComCVTag) {
        
        return self.showComCVDataArray.count;
        
    }else if (collectionView.tag == PosterCVTag){
        
        return self.posterCVDataArray.count;
        
    }else{
        return 0;
    }
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == ShowComCVTag) {
        
        ShowComCV * cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
        XShowComModel * model = _showComCVDataArray[indexPath.row];
        
        cell.dataModel = model;
        
       return cell;
        
    }else {
        
        XPosterCVCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        
        NSString * imageUrl = _posterCVDataArray[indexPath.row];
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.layer.cornerRadius = 5;
        cell.clipsToBounds = YES;
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
        
        return cell;
        
    }
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == ShowComCVTag) {
        
        
        return CGSizeMake((kMainBoundsW-30)/2, 350);
    }else {
        
        return CGSizeMake((kMainBoundsW-30)/2, 400-20);
    }
}

//这个是设置每个区四周的距离的
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (collectionView.tag == ShowComCVTag) {
        
        return UIEdgeInsetsMake(10, 10,10,10);
    }else {
        
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
}

#pragma mark --topSV方法、数据、设置

-(void)topSVScroll:(UIPageControl *)page
{
    _topSV.contentOffset = CGPointMake(kMainBoundsW*(page.currentPage+1), 0);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    switch (scrollView.tag) {
        case TopSVTag:
        {
            if (scrollView.contentOffset.x == (_topDataArray.count+1)*kMainBoundsW) {
                scrollView.contentOffset = CGPointMake(kMainBoundsW, 0);
            }
            if (scrollView.contentOffset.x == 0) {
                scrollView.contentOffset = CGPointMake((_topDataArray.count)*kMainBoundsW, 0);
            }
            
            _topPageControl.currentPage = (scrollView.contentOffset.x+5)/kMainBoundsW-1;
            _topTimerNum = scrollView.contentOffset.x/kMainBoundsW;
        }
            break;
            
         case BgSVTag:
        {
            if (scrollView.contentOffset.y<690) {
                _boutiqueTV.center = CGPointMake(_boutiqueTV.center.x,_oldTableViewY);
            }
            
            if (scrollView.contentOffset.y>=690 && scrollView.contentOffset.y < 690+_boutiqueTVContentSize.height-_boutiqueTV.height) {
                
                _boutiqueTV.frame =CGRectMake(0, scrollView.contentOffset.y, kMainBoundsW, kMainBoundsH-64-49);
                _boutiqueTV.contentOffset = CGPointMake(0, scrollView.contentOffset.y-690);
                
                _showPicViewControl.frame = CGRectMake(0, scrollView.contentOffset.y+kMainBoundsH-64-49,kMainBoundsW, 40);
                _weaterFullView.frame = CGRectMake(0, scrollView.contentOffset.y+kMainBoundsH-64-49+40, kMainBoundsW, kMainBoundsH-64-49);
                
            }
            
            if (scrollView.contentOffset.y > 690+_boutiqueTVContentSize.height-_boutiqueTV.height && scrollView.contentOffset.y< 690+_boutiqueTVContentSize.height ) {
                
                 _boutiqueTV.frame =CGRectMake(0, 690+_boutiqueTVContentSize.height-_boutiqueTV.height, kMainBoundsW, kMainBoundsH-64-49);
                _boutiqueTV.contentOffset = CGPointMake(0, _boutiqueTVContentSize.height-_boutiqueTV.height);
                
                _showPicViewControl.frame = CGRectMake(0, 690+_boutiqueTVContentSize.height-_boutiqueTV.height+kMainBoundsH-64-49,kMainBoundsW, 40);
                _weaterFullView.frame = CGRectMake(0, 690+_boutiqueTVContentSize.height-_boutiqueTV.height+kMainBoundsH-64-49+40, kMainBoundsW, kMainBoundsH-64-49);
                
            }

            if ( scrollView.contentOffset.y >=690+_boutiqueTVContentSize.height) {
                
                _showPicViewControl.frame = CGRectMake(0,scrollView.contentOffset.y,kMainBoundsW, 40);
                
                _weaterFullView.frame = CGRectMake(0, scrollView.contentOffset.y+40, kMainBoundsW, kMainBoundsH-64-49);
                _weaterFullView.contentOffset = CGPointMake(0, scrollView.contentOffset.y-690-_boutiqueTVContentSize.height);

            }
            
            
            
        }
            break;
        default:
            break;
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    switch (scrollView.tag) {
        case TopSVTag:
        {
            [_topSVTimer invalidate];
            _topSVTimer = nil;
        }
            break;
            
        default:
            break;
    }

}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    switch (scrollView.tag) {
        case TopSVTag:
        {
            if (decelerate == YES) {
                [self createANSTimer];
            }

        }
            break;
            
            
            
        default:
            break;
    }

}

-(void)setTopSVHight:(CGFloat)topSVHight
{
    if (_topSVHight != topSVHight) {
        _topSVHight = topSVHight;
    }
}

-(void)updateTopScrollView{
    
    NSInteger arrayCount = _topDataArray.count +2;
    
    _topSV.contentSize = CGSizeMake(arrayCount*kMainBoundsW, 0);
    _topPageControl.numberOfPages = _topDataArray.count;
    
    for (int i = 0; i<arrayCount; i++) {
        
        TopSVModel * topModel;
        
        if (i!=0 && i!=arrayCount-1) {
            topModel = _topDataArray[i-1];
           
        }else if(i==0)
        {
             topModel = [_topDataArray lastObject];
            
        }else if (i ==arrayCount-1) {
            
            topModel = [_topDataArray firstObject];
        }
        
        UIImageView * imageview =[[UIImageView alloc]init];
        
        
        float  scale = kMainBoundsW/topModel.width;
         NSInteger height = scale*topModel.height;
        self.topSVHight = height;

        imageview.frame = CGRectMake(i*kMainBoundsW,0, kMainBoundsW, height);
        [imageview sd_setImageWithURL:[NSURL URLWithString:topModel.picUrl]];
        
        
        _topSVHight = height;
        [_topSV addSubview:imageview];
    }
     _topSV.contentOffset = CGPointMake(kMainBoundsW,0 );
    _topSV.frame = CGRectMake(0, 0, kMainBoundsW, _topSVHight);
    _topPageControl.center = CGPointMake(kMainBoundsW/2, _topSV.center.y+_topSV.bounds.size.height/2-20);
    _topPageControl.bounds = CGRectMake(0, 0, _topPageControl.numberOfPages*20, 30);
    _posterCV.frame = CGRectMake(0, _topSV.bounds.size.height, kMainBoundsW,400);

}

-(NSMutableArray *)topDataArray
{
    if (!_topDataArray) {
        
        _topDataArray = [NSMutableArray array];
    }
    
    return _topDataArray;
}



#pragma mark 设置导航栏样式和点击方法 
-(void)setNavigationBarItem{

    
    UIView * navBGView =[[UIView alloc]initWithFrame:CGRectMake(0, 20, kMainBoundsW, 44)];
    
    [self.view addSubview:navBGView];
    
    BXTabBarButton *leftButton =[[BXTabBarButton alloc]initWithFrame:CGRectMake(5, 0, 44, 44)];
    [leftButton setTitle:@"分类" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"bottom_head_sort@2x.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(gotoClassifyVC:) forControlEvents:UIControlEventTouchUpInside];
    [navBGView addSubview:leftButton];
    
    UITextField * itemFiled =[[UITextField alloc]initWithFrame:CGRectMake(60, 2, kMainBoundsW-120, 40)];
    itemFiled.backgroundColor = [UIColor whiteColor];
    itemFiled.placeholder = @"🔍单品/品牌/红人";
    [itemFiled addTarget:self action:@selector(gotoSeachVC) forControlEvents:UIControlEventEditingDidBegin];
    [navBGView addSubview:itemFiled];
    
    BXTabBarButton *rightButton = [[BXTabBarButton alloc]initWithFrame:CGRectMake(kMainBoundsW-49, 0, 44, 44)];
    [rightButton setTitle:@"分类" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"button_head_massage@2x.png"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(gotoMessageVC:) forControlEvents:UIControlEventTouchUpInside];
    [navBGView addSubview:rightButton];
    
}

-(void)gotoClassifyVC:(UIButton *)sender{
    NSLog(@"+++++");
}

-(void)gotoMessageVC:(UIButton *)sender{
    NSLog(@"/////");
}

-(void)gotoSeachVC{
    NSLog(@"----");
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
