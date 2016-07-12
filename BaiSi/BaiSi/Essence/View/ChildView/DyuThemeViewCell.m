//
//  DyuThemeViewCell.m
//  BaiSi
//
//  Created by xiaomage on 16/6/25.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuThemeViewCell.h"
#import "DyuTotaCell.h"
#import "DyuThemePictureView.h"
#import "DyuThemeItem.h"
#import "DyuThemeVideoView.h"
#import "DyuThemeVoiceView.h"
#import "DyuBottemView.h"
#import "DyuHotComentView.h"
@interface DyuThemeViewCell ()
@property(nonatomic , weak)DyuTotaCell *totacell;
@property(nonatomic , weak)DyuThemePictureView *picture;
@property(nonatomic , weak)DyuThemeVideoView *Video;
@property(nonatomic , weak)DyuThemeVoiceView *Voice;
@property(nonatomic , weak)DyuBottemView *Bottem;
@property(nonatomic , weak)DyuHotComentView *HotComent;

@end
@implementation DyuThemeViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //R:234 G:199 B:141
        self.backgroundColor = [UIColor colorWithRed:234 green:199 blue:141 alpha:0.8];
        DyuTotaCell *cel = [DyuTotaCell viewForXib];
        [self.contentView addSubview:cel];
        _totacell = cel;
        
        DyuThemePictureView *picture = [DyuThemePictureView viewForXib];
        [self.contentView addSubview:picture];
        _picture = picture;
        
        DyuThemeVideoView *Video = [DyuThemeVideoView viewForXib];
        [self.contentView addSubview:Video];
        _Video = Video;
        
        DyuThemeVoiceView *Voice = [DyuThemeVoiceView viewForXib];
        [self.contentView addSubview:Voice];
        _Voice = Voice;
        
        DyuBottemView *bottem = [DyuBottemView viewForXib];
        [self.contentView addSubview:bottem];
        _Bottem = bottem;
        
        DyuHotComentView *HotComent = [DyuHotComentView viewForXib];
        [self.contentView addSubview:HotComent];
        _HotComent = HotComent;
        
    }
    return self;
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += 10;
    frame.size.height -= 10;
    
    [super setFrame:frame];
}
-(void)setModel:(DyuThemeViewModel *)model
{
    _model = model;
    _totacell.frame = model.topViewFrame;
    _totacell.Item = model.item;
    
    _Bottem.frame = model.bottemFrame;
    _Bottem.Item = model.item;
    if(model.item.HotComment) {
        _HotComent.frame = model.hotViewFrame;
        _HotComent.Item = model.item;
        _HotComent.hidden = NO;
    } else {
        _HotComent.hidden = YES;
    }
    
    if (model.item.type == DyuThemeTypeText) {
        _picture.hidden = YES;
        _Video.hidden = YES;
        _Voice.hidden = YES;
    }else if (model.item.type == DyuThemeTypePicture) {
        _picture.frame = model.middleViewFrame;
        _picture.Item = model.item;
        _Video.hidden = YES;
        _Voice.hidden = YES;
        _picture.hidden = NO;
    }else if (model.item.type == DyuThemeTypeVideo) {
        _Video.frame = model.middleViewFrame;
        _Video.Item = model.item;
        _Video.hidden = NO;
        _Voice.hidden = YES;
        _picture.hidden = YES;
    }else if (model.item.type == DyuThemeTypeVoice) {
        
        _Voice.frame = model.middleViewFrame;
        _Voice.Item = model.item;
        
        _Video.hidden = YES;
        _Voice.hidden = NO;
        _picture.hidden = YES;
    }
}
@end
