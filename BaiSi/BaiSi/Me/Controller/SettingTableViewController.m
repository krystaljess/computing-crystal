//
//  SettingTableViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/16.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "SettingTableViewController.h"
#import "DyuFileManger.h"
#import <SDImageCache.h>
#define DyuChanePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
@interface SettingTableViewController ()
@end

@implementation SettingTableViewController
    static NSString *ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self TotalSizeStr];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//设置尺寸cell
-(NSString *)TotalSizeStr
{
    NSString *chancePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    //获取文件夹尺寸
    NSString *celltitle = nil;
    NSInteger totalsize = [DyuFileManger getDirectorySizeOfDirectoryPath:chancePath];
    if(totalsize > 1000 * 1000){
        totalsize = totalsize / 1000 / 1000;
        celltitle = [NSString stringWithFormat:@"%.1ldMB",totalsize];
    }else if (totalsize > 1000){
        totalsize = totalsize / 1000;
        celltitle = [NSString stringWithFormat:@"%.1ldKB",totalsize];
    }else{
        celltitle = [NSString stringWithFormat:@"%ldB",totalsize];
    }
    celltitle = [NSString stringWithFormat:@"清理缓存(%@)",celltitle];
    return celltitle;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [DyuFileManger removeDirectoryPath:DyuChanePath];
    [self.tableView reloadData];
}
/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //删除文件夹
    [[NSFileManager defaultManager] removeItemAtPath:DyuChanePath error:nil];
    //创建文件夹
    [[NSFileManager defaultManager] createDirectoryAtPath:DyuChanePath withIntermediateDirectories:YES attributes:nil error:nil];
    // 刷新表格
    [self.tableView reloadData];
}*/
//获取文件尺寸
/*- (NSInteger)getDirectorySizeOfDirectoryPath:(NSString *)directoryPath
{
    //创建管理者对象
    NSFileManager *mgr = [NSFileManager defaultManager];
    // 2.遍历文件夹里面所有文件
    // subpathsAtPath:传入一个文件夹路径,就能获取这个文件夹下所有子路径(多级目录下)
    //子路径
    NSArray *subpaths = [mgr subpathsAtPath:directoryPath];
    // 3.拼接完整文件名
    NSInteger totalsize = 0;
    for (NSString *path in subpaths) {
        NSString *strpath = [directoryPath stringByAppendingPathComponent:path];
    // 3.1 判断下是否是隐藏文件
        if([strpath containsString:@".DS_Store"]) continue;
    // 3.2 判断下是否是文件夹
        BOOL DisDirectory;
        [mgr fileExistsAtPath:strpath isDirectory:&DisDirectory];
        
        if(DisDirectory) continue;
    // 4.attributesOfItemAtPath : 传入一个文件路径,就能获取文件信息
       NSDictionary *dict = [mgr attributesOfItemAtPath:strpath error:nil];
    // 5.获取文件尺寸 添加到总体尺寸
        totalsize += [dict fileSize];
        
    }
    return totalsize;
}*/
// 根据SDWebImage学习如何获取缓存尺寸 => 找到获取尺寸实现方法(getSize) => 查看这个方法底层实现 => 自己写一个方法跟它有同样功能就好 => 总结出思路

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = [self TotalSizeStr];
    return cell;
}







@end
