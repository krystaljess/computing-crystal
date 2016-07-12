//
//  DyuFileManger.h
//  BaiSi
//
//  Created by xiaomage on 16/6/21.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DyuFileManger : NSObject
/**
 *  指定一个文件夹路径,获取文件夹尺寸
 *
 *  @param directoryPath 文件夹全路径
 *
 *  @return 文件夹尺寸
 */
+ (NSInteger)getDirectorySizeOfDirectoryPath:(NSString *)directoryPath;

/**
 *  删除文件夹
 *
 *  @param directoryPath 文件夹路径
 */
+ (void)removeDirectoryPath:(NSString *)directoryPath;

@end
