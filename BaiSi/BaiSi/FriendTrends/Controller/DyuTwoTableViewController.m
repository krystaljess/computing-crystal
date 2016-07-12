
//
//  DyuTwoTableViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/30.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuTwoTableViewController.h"
#import "DyuLoginTheme.h"
#import "DyuUserModel.h"
#import "DyuLoginRightTableViewCell.h"
#import <MJExtension/MJExtension.h>
#import <AFNetworking/AFNetworking.h>
@interface DyuTwoTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *RightTable;
@property (weak, nonatomic) IBOutlet UITableView *LeftTable;

@property(nonatomic , strong)AFHTTPSessionManager *mgr;

@property(nonatomic , strong)NSArray *array;
@property(nonatomic , strong)NSArray *ary;
@end

static NSString *ID = @"cell";
static NSString *CellID = @"celler";
@implementation DyuTwoTableViewController
-(AFHTTPSessionManager *)mgr
{
    if(_mgr == nil)
    {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_LeftTable registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    [_RightTable registerClass:[DyuLoginRightTableViewCell class] forCellReuseIdentifier:CellID];
    //[控制器是导航控制器]添加两个tableview或其他控件时 可能造成添加view时会自动帮你frame下移64(tabar)高度 开始第一个下移64高度 第二个会下移两个导航条高度,需要设置automaticallyAdjustsScrollViewInsets属性为NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.LeftTable.tableFooterView =   [[UIView alloc] init];
    self.RightTable.tableFooterView = [[UIView alloc] init];

    //加载数据
    self.mgr = [AFHTTPSessionManager manager];
    //创建请求数据
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    
    [self.mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        _array = [DyuLoginTheme mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [_LeftTable reloadData];
        
        //默认选中第一行
        NSIndexPath *firstPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.LeftTable selectRowAtIndexPath:firstPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        [self tableView:self.LeftTable didSelectRowAtIndexPath:firstPath];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView
 
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == _LeftTable)
    {
        return _array.count;
    }
     return _ary.count;
}
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == _LeftTable) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        DyuLoginTheme *Item = _array[indexPath.row];
        cell.textLabel.text = Item.name;
        return cell;
    }

    DyuLoginRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    cell.Model = _ary[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.backgroundColor = [UIColor clearColor];
    if(tableView == _RightTable) return;
    DyuLoginTheme *model = _array[indexPath.row];
    //创建请求数据
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"category_id"] = model.ID;
    [self.mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        // 获取字典数组
        NSArray *dictArr = responseObject[@"list"];
        
        // 字典数组转模型数组
        _ary = [DyuUserModel mj_objectArrayWithKeyValuesArray:dictArr];
        [_RightTable reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
-(UIView *)setRedView
{
    UIView *vc = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 35)];
    vc.backgroundColor = [UIColor redColor];
    return vc;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _LeftTable){
        return 35;
    }
    
    return 65;
    
    
}
@end
