//
//  DyuFileManger.m
//  BaiSi
//
//  Created by xiaomage on 16/6/21.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuFileManger.h"

@implementation DyuFileManger
+ (NSInteger)getDirectorySizeOfDirectoryPath:(NSString *)directoryPath
{
    // 1.创建文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL exist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!exist || !isDirectory) {
        // 报错
        NSException *excp = [NSException exceptionWithName:@"fileError" reason:@"传入路径是错误的" userInfo:nil];
        
        [excp raise];
    }
    // subpathsAtPath:传入一个文件夹路径,就能获取这个文件夹下所有子路径(多级目录下)
    //子路径
    NSArray *subpaths = [mgr subpathsAtPath:directoryPath];
    //拼接完整文件名
    NSInteger totalsize = 0;
    for (NSString *path in subpaths) {
        NSString *strpath = [directoryPath stringByAppendingPathComponent:path];
        // 3.1 判断隐藏文件
        if([strpath containsString:@".DS_Store"]) continue;
        // 3.2 判断
        BOOL DisDirectory;
        [mgr fileExistsAtPath:strpath isDirectory:&DisDirectory];
        
        if(DisDirectory) continue;
        // 4.attributesOfItemAtPath : 传入一个文件路径,就能获取文件信息
        NSDictionary *dict = [mgr attributesOfItemAtPath:strpath error:nil];
        // 5.获取文件尺寸
        totalsize += [dict fileSize];
        
    }
    return totalsize;
}
+ (void)removeDirectoryPath:(NSString *)directoryPath
{
    // 1.创建文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL exist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!exist || !isDirectory) { // 不存在文件夹
        // 报错
        NSException *excp = [NSException exceptionWithName:@"fileError" reason:@"传入路径是错误的" userInfo:nil];
        
        [excp raise];
    }
    //删除文件夹
    [[NSFileManager defaultManager] removeItemAtPath:directoryPath error:nil];
    //创建文件夹
    [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
}
@end
