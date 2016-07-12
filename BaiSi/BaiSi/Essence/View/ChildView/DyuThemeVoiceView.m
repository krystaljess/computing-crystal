//
//  DyuThemeVoiceView.m
//  BaiSi
//
//  Created by xiaomage on 16/6/26.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuThemeVoiceView.h"
#import <UIImageView+WebCache.h>
#import "DyuThemeItem.h"
@interface DyuThemeVoiceView ()
@property (weak, nonatomic) IBOutlet UILabel *TotaLable;
@property (weak, nonatomic) IBOutlet UILabel *BottemLable;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;


@end
@implementation DyuThemeVoiceView

- (IBAction)VoiceBtn:(UIButton *)sender {
}
-(void)setItem:(DyuThemeItem *)Item
{
    [_ImageView sd_setImageWithURL:[NSURL URLWithString:Item.image1]];
    _TotaLable.text = [NSString stringWithFormat:@"%ld人播放",Item.playcount];
    _BottemLable.text = [NSString stringWithFormat:@"%ld",Item.voicetime];
}
@end
