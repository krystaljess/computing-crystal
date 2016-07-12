//
//  DyuLoginRightTableViewCell.m
//  BaiSi
//
//  Created by xiaomage on 16/6/30.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuLoginRightTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "UIImage+Image.h"
#import "DyuUserModel.h"
@interface DyuLoginRightTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *totaLable;
@property (weak, nonatomic) IBOutlet UILabel *BottemLable;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;


@end

@implementation DyuLoginRightTableViewCell
- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    return [[[NSBundle mainBundle] loadNibNamed:@"DyuLoginRightTableViewCell" owner:nil options:nil] firstObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(DyuUserModel *)Model
{
    _Model = Model;
    _totaLable.text = Model.screen_name;
    _BottemLable.text =[NSString stringWithFormat:@"%@人订阅",Model.fans_count];
    [_ImageView sd_setImageWithURL:[NSURL URLWithString:Model.header] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        _ImageView.image = [image setCircularPicture];
    }];
}
- (IBAction)RightBtn:(UIButton *)sender {
    
}

@end
