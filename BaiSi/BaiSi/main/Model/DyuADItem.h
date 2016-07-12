//
//  DyuADItem.h
//  BaiSi
//
//  Created by xiaomage on 16/6/18.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DyuADItem : NSObject
//图片
@property(nonatomic , strong)NSString *w_picurl;
//广告链接
@property(nonatomic , strong)NSString *ori_curl;

//图片大小
@property(nonatomic , assign)CGFloat w;
@property(nonatomic , assign)CGFloat h;
@end
