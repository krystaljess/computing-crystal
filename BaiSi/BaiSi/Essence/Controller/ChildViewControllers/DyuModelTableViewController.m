//
//  DyuModelTableViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/29.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuModelTableViewController.h"
#import "DyuThemeViewCell.h"
#import "DyuThemeItem.h"
#import "DyuThemeViewModel.h"
#import "NewViewController.h"
#import "DyuModalViewController.h"
#import <MJExtension/MJExtension.h>
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>

@interface DyuModelTableViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSMutableArray *themeViewModals;
@property(nonatomic ,strong)NSString *maxtime;

@property(nonatomic , strong)AFHTTPSessionManager *mgr;
@end

@implementation DyuModelTableViewController
static NSString *ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(99, 0, 49, 0);
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    [self.tableView registerClass:[DyuThemeViewCell class] forCellReuseIdentifier:ID];
    
    [self loadNewData];
    
    [self setupRefreshView];
    
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor lightGrayColor];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentView) name:@"通知" object:nil];
}
-(AFHTTPSessionManager *)mgr
{
    if(_mgr == nil){
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}
-(NSMutableArray *)themeViewModals
{
    if(_themeViewModals == nil){
        _themeViewModals = [NSMutableArray array];
    }
    return _themeViewModals;
}
-(void)loadNewData
{
    //设置请求信息
    //type	false	int	1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
    NSMutableDictionary *pramer = [NSMutableDictionary dictionary];
    pramer[@"a"] = [self setList];
    pramer[@"c"] = @"data";
    pramer[@"type"] = @(self.DyuType);
    
    //请求数据
    [self.mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:pramer progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *_Nullable responseObject) {
        
        //创建数组
        NSArray *arry = responseObject[@"list"];
        //保存数据
        NSArray *item = [DyuThemeItem mj_objectArrayWithKeyValuesArray:arry];
        
        for (DyuThemeItem *model in item) {
            DyuThemeViewModel *mide = [[DyuThemeViewModel alloc] init];
            mide.item = model;
            [self.themeViewModals addObject:mide];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
-(void)setupRefreshView
{
    MJRefreshNormalHeader *hesder = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(Hearder)];
    hesder.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.tableView.mj_header = hesder;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footer)];
    self.tableView.mj_footer = footer;
}
#pragma mark - 请求数据
-(NSString *)setList
{
    if([self.parentViewController isKindOfClass:[NewViewController class]]){
        return @"newlist";
    }else{
        return @"list";
    }
}
-(void)Hearder
{
    //设置请求信息
    NSMutableDictionary *pramer = [NSMutableDictionary dictionary];
    pramer[@"a"] = [self setList];
    pramer[@"c"] = @"data";
    pramer[@"maxtime"] = _maxtime;
    pramer[@"type"] = @(DyuThemeTypeAll);
    //请求数据
    [self.mgr  GET:@"http://api.budejie.com/api/api_open.php" parameters:pramer progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *_Nullable responseObject) {
        [self.tableView.mj_header endRefreshing];
        _maxtime = responseObject[@"info"][@"maxtime"];
        //创建数组
        NSArray *arry = responseObject[@"list"];
        //保存数据
        NSArray *item = [DyuThemeItem mj_objectArrayWithKeyValuesArray:arry];
        
        for (DyuThemeItem *model in item) {
            DyuThemeViewModel *mide = [[DyuThemeViewModel alloc] init];
            mide.item = model;
            [self.themeViewModals addObject:mide];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
-(void)footer
{
    NSMutableDictionary *pramer = [NSMutableDictionary dictionary];
    pramer[@"a"] = [self setList];
    pramer[@"c"] = @"data";
    pramer[@"maxtime"] = _maxtime;
    pramer[@"type"] = @(DyuThemeTypeAll);
    //请求数据
    [self.mgr  GET:@"http://api.budejie.com/api/api_open.php" parameters:pramer progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *_Nullable responseObject) {
        [self.tableView.mj_footer endRefreshing];
        _maxtime = responseObject[@"info"][@"maxtime"];
        //创建数组
        NSArray *arry = responseObject[@"list"];
        //保存数据
        NSArray *item = [DyuThemeItem mj_objectArrayWithKeyValuesArray:arry];
        
        for (DyuThemeItem *model in item) {
            DyuThemeViewModel *mide = [[DyuThemeViewModel alloc] init];
            mide.item = model;
            [self.themeViewModals addObject:mide];
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)presentView
//{
//    DyuModalViewController *vc = [[DyuModalViewController alloc] init];
//    [self.navigationController presentViewController:vc animated:YES completion:nil];
//}
#pragma mark - Table view data source
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _themeViewModals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DyuThemeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.model = _themeViewModals[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DyuThemeViewModel *model =_themeViewModals[indexPath.row];
    return model.cellH;
}
@end
