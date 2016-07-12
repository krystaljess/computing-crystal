//
//  DyuThemeItem.h
//  BaiSi
//
//  Created by xiaomage on 16/6/25.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class DyuHotCommentModel;
typedef enum: NSUInteger {
    DyuThemeTypeAll = 1,
    DyuThemeTypePicture = 10,
    DyuThemeTypeVideo = 41,
    DyuThemeTypeVoice = 31,
    DyuThemeTypeText = 29
} DyuThemeType;
@interface DyuThemeItem : NSObject

//头像
@property(nonatomic , strong)NSString *profile_image;
//昵称
@property(nonatomic , strong)NSString *name;
//发布时间
@property(nonatomic , strong)NSString *passtime;
//内容
@property(nonatomic , strong)NSString *text;



/***********图片************/
@property(nonatomic , assign)DyuThemeType type;
/** 小图 **/
@property(nonatomic , strong)NSString *image0;
/** 大图 **/
@property(nonatomic , strong)NSString *image1;
/** 中图 **/
@property(nonatomic , strong)NSString *image2;

@property(nonatomic , assign)BOOL is_gif;
@property(nonatomic , assign)BOOL is_big;
@property(nonatomic , assign)CGFloat width;
@property(nonatomic , assign)CGFloat height;

/**********视频*********/

@property(nonatomic, assign) NSInteger playcount;

@property(nonatomic, assign) NSInteger videotime;

/**********声音*********/
@property(nonatomic, assign) NSInteger voicetime;

/**********bottem******/
@property(nonatomic , assign)NSString *ding;
@property(nonatomic , assign)NSString *cai;
@property(nonatomic , assign)NSString *repost;
@property(nonatomic , assign)NSString *comment;

/**********评论********/
@property(nonatomic, strong) NSArray*top_cmt;
@property (nonatomic, strong) DyuHotCommentModel *HotComment;
@end
