//
//  DyuTotaCell.m
//  BaiSi
//
//  Created by xiaomage on 16/6/23.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuTotaCell.h"
#import "DyuThemeItem.h"
#import "UIImage+Image.h"
#import <UIImageView+WebCache.h>
@interface DyuTotaCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) IBOutlet UILabel *text;


@end

@implementation DyuTotaCell


-(void)setItem:(DyuThemeItem *)Item
{
    [_image sd_setImageWithURL:[NSURL URLWithString:Item.profile_image] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        _image.image = [image setCircularPicture];
    }];
//    _image.image = [UIImage setCircularPicture:_image.image];
//    _image.layer.masksToBounds = YES;
//    _image.layer.cornerRadius = _image.bounds.size.width * 0.5;
//    _image.layer.borderWidth = 45;
//    _image.layer.borderColor = [UIColor clearColor].CGColor;
    
    _name.text = Item.name;
    _timer.text = Item.passtime;
    _text.text = Item.text;
    self.autoresizingMask = UIViewAutoresizingNone;
    
}
@end
