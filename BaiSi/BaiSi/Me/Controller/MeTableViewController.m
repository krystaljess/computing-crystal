//
//  MeTableViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/20.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "MeTableViewController.h"
#import "UIBarButtonItem+Item.h"
#import "SettingTableViewController.h"
#import "DyuSquareCell.h"
#import "DyuSquare.h"
#import "UIView+Frame.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "DyuWKViewController.h"

@interface MeTableViewController ()<UICollectionViewDataSource ,UICollectionViewDelegate>
@property(nonatomic ,weak)UICollectionView *collection;

@property(nonatomic , strong)NSMutableArray *square;
@end

@implementation MeTableViewController
static NSString * const ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.backgroundColor =[UIColor colorWithRed:215/255 green:215/255 blue:215/255 alpha:1];
    
    [self setNavItem];
    
    //设置数据
    [self loadData];
    //collertion
    [self setCollection];
    // 处理每个cell之间间距
    // 分组样式tableView,每一组默认自带头部和尾部间距
    self.tableView.sectionFooterHeight = 10;
    self.tableView.sectionHeaderHeight = 0;
    
    // 设置顶部额外滚动区域-25
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setNavItem
{
    
    UIBarButtonItem *rigthOne = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(Setting)];
    UIBarButtonItem *rigthTwo = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] selectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(leftItemClick:)];
    self.navigationItem.rightBarButtonItems = @[rigthOne,rigthTwo];
    self.navigationItem.title = @"我";
}

-(void)leftItemClick:(UIButton *)butten
{
    butten.selected = !butten.selected;
    NSLog(@"点击了我right按钮");
}
-(void)Setting
{
    SettingTableViewController *setting = [[SettingTableViewController alloc] init];
    
    setting.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setting animated:YES];
}

//数据
-(void)loadData
{
    //创建请求会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //拼接请求参数
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"square";
    dict[@"c"] = @"topic";
    
    //发送数据
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //转模型
        _square = [DyuSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
        
        //设置collection高度
        
        NSInteger count = _square.count;
        //计算总行数
        NSInteger rows = (count - 1) / 4 + 1;
        
        //计算高度
        
        CGFloat h = rows * 96 + (rows - 1) * 1;
        _collection.height = h;
        
        //设置tableciew滚动范围
        self.tableView.tableFooterView = _collection;
        
        
        //刷新数据
        [_collection reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}
/*
  UICollectionView使用步骤:
  1.初始化的时候要有布局
  2.cell一定要注册
  3.自定义cell
  
  // tableView滚动范围 根据自己的内容去计算
  // 只能重新设置tableView底部视图,告诉更新内容
  // 不能自己去设置tableView滚动范围,没有效果
  */

-(void)setCollection
{
    //设置布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
//    @property (nonatomic) CGFloat minimumLineSpacing;
//    @property (nonatomic) CGFloat minimumInteritemSpacing;
//    @property (nonatomic) CGSize itemSize;
//    @property (nonatomic) CGSize estimatedItemSize NS_AVAILABLE_IOS(8_0); // defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
//    @property (nonatomic) UICollectionViewScrollDirection scrollDirection; // default is UICollectionViewScrollDirectionVertical
//    @property (nonatomic) CGSize headerReferenceSize;
//    @property (nonatomic) CGSize footerReferenceSize;
//    @property (nonatomic) UIEdgeInsets sectionInset;
    layout.itemSize = CGSizeMake(93,93);
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    
    //创建UICollectionView
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
    collection.backgroundColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1];
    collection.dataSource = self;
    collection.delegate = self;
    //注册cell 只能注册
    [collection registerNib:[UINib nibWithNibName:@"DyuSquareCell" bundle:nil] forCellWithReuseIdentifier:ID];
    _collection = collection;
    
    self.tableView.tableFooterView = collection;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _square.count;
    
}
// 返回cell样式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DyuSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.square = _square[indexPath.row];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DyuSquare *item = _square[indexPath.row];
    
    DyuWKViewController *wkview = [[DyuWKViewController alloc] init];
    wkview.url = item.url;
    [self.navigationController pushViewController:wkview animated:YES];
}
@end
