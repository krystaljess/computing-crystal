//
//  DyuLoginTheme.h
//  BaiSi
//
//  Created by xiaomage on 16/6/30.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DyuLoginTheme : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *ID;
// 推荐用户组
@property (nonatomic, strong) NSMutableArray *users;

// 页码数
@property(nonatomic, assign) NSInteger page;
// 总页码
@property(nonatomic, assign) NSInteger total_page;
@end
