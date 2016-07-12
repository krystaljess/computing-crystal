//
//  DyuLableTableViewCell.m
//  BaiSi
//
//  Created by xiaomage on 16/6/19.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuLableTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "LableModel.h"
@interface DyuLableTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *number;

@end
@implementation DyuLableTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setFrame:(CGRect)frame
{
    frame.size.height -= 10;
    frame.origin.y += 10;
    frame.size.width -= 20;
    frame.origin.x += 10;
    
    [super setFrame:frame];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)ClickLike:(UIButton *)sender {
}
-(void)setLableM:(LableModel *)LableM
{
    _LableM = LableM;
    
    [_image sd_setImageWithURL:[NSURL URLWithString:LableM.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if(image == nil){
            return ;
        }
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        [path addClip];
        
        [image drawAtPoint:CGPointZero];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        _image.image = image;
    }];
    _title.text = LableM.theme_name;
    
    //设置订阅数
    NSString *numText = [NSString stringWithFormat:@"%@人订阅",LableM.sub_number];
    
    CGFloat num = [numText floatValue];
    
    if(num > 10000.0){
        num = num / 10000.0;
        numText = [NSString stringWithFormat:@"%.1f万人订阅",num];
        numText = [numText stringByReplacingOccurrencesOfString:@".0" withString:@""];
        
    }
    _number.text = numText;
}
- (IBAction)lable:(UIButton *)sender {
    NSLog(@"点击了订阅");
}
@end
