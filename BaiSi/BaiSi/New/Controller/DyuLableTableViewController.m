//
//  DyuLableTableViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/19.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuLableTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "LableModel.h"
#import "DyuLableTableViewCell.h"
#import <SVProgressHUD/SVProgressHUD.h>
@interface DyuLableTableViewController ()

@property(strong , nonatomic)NSArray *array;
@end

@implementation DyuLableTableViewController

static NSString *ID = @"cell";
/*
 1.设置头像为圆形
 2.处理订阅数
 */
/*
 默认cell的标示符 cell
 1.加载xib描述的cell 有几种方式
 1. NSBundle 一定要记得绑定标识符
 2. 注册xib
 
 在开发中,尽量注册
 */

// 谁不想修改,就用const去修饰
// const:修饰右边变量,被const修饰变量只读

/*
 1.让分割线占据全屏
 1.自定义分割线 2.设置系统属性就能搞定 (iOS6和iOS7适配 iOS7和iOS8适配) 3.重写cell的setFrame
 
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.title = @"订阅标签";
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    [SVProgressHUD showWithStatus:@"正在加载中~~~"];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"DyuLableTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self loadData];
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [SVProgressHUD dismiss];
}
-(NSArray *)array
{
    if(_array == nil){
        _array =  [NSArray array];
    }
    return _array;
}

-(void)loadData
{
    //创建请求会话
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    //拼接请求参数
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"a"] = @"tag_recommend";
    dict[@"c"] = @"topic";
    dict[@"action"] = @"sub";
    
    //发送请求
    [manage GET:@"http://api.budejie.com/api/api_open.php" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        _array = [LableModel mj_objectArrayWithKeyValuesArray:responseObject];

        //刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DyuLableTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.LableM = _array[indexPath.row];;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}
@end
