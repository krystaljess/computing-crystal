//
//  DyuThemePictureView.m
//  BaiSi
//
//  Created by xiaomage on 16/6/25.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuThemePictureView.h"
#import "DyuThemeItem.h"
#import "DyuModalViewController.h"
#import "Dyu.pch"
#import <DALabeledCircularProgressView.h>
#import <UIImageView+WebCache.h>
@interface DyuThemePictureView ()
@property (weak, nonatomic) IBOutlet UIButton *BigPicture;
@property (weak, nonatomic) IBOutlet UIImageView *Image;
@property (weak, nonatomic) IBOutlet UIImageView *Gif;

@property (nonatomic , strong)DyuThemeItem *item;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progress;
@end

@implementation DyuThemePictureView
- (void)awakeFromNib
{
    _progress.roundedCorners = 10;
    _progress.progressTintColor = [UIColor whiteColor];
    _progress.trackTintColor = [UIColor clearColor];
    _progress.progressLabel.textColor = [UIColor whiteColor];
}
-(void)setItem:(DyuThemeItem *)item
{
    _item = item;
    
    [_Image sd_setImageWithURL:[NSURL URLWithString:item.image1] placeholderImage:nil options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        CGFloat pass = 1.0 * receivedSize / expectedSize;
        if(pass <= 0) return ;
        _progress.progress = pass;
        _progress.progressLabel.text = [NSString stringWithFormat:@"%.1f%%",pass * 100];

        
    }  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if(!item.is_big) return ;
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(_Image.bounds.size, NO, 0);
        //设置尺寸
        CGFloat mager = 10;
        CGFloat w = ScreenW - mager * 2;
        CGFloat h = w / item.width * item.height;
        [image drawInRect:CGRectMake(0, 0, w, h)];
        //生成图片
        image = UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文
        UIGraphicsEndImageContext();
        _Image.image = image;
    }];
    
    _Gif.hidden = !item.is_gif;
    _BigPicture.hidden = !item.is_big;
    //大图进行裁剪
//    if(item.is_big){
//        _Image.layer.masksToBounds = YES;
//        _Image.contentMode = UIViewContentModeTop;
//    }else{
//        _Image.layer.masksToBounds = NO;
//        _Image.contentMode = UIViewContentModeScaleToFill;
//    }
    
}
- (IBAction)BigPicture:(UIButton *)sender {
    
//    NSNotification *notifica = [NSNotification notificationWithName:@"通知" object:nil];
//    
//    [[NSNotificationCenter defaultCenter] postNotification:notifica];
    
    DyuModalViewController *vc = [[DyuModalViewController alloc] init];
    vc.item = _item;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
}

@end
