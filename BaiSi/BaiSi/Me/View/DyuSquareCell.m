//
//  DyuSquareCell.m
//  BaiSi
//
//  Created by xiaomage on 16/6/20.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuSquareCell.h"
#import "DyuSquare.h"
#import <UIImageView+WebCache.h>
@interface DyuSquareCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
@implementation DyuSquareCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setSquare:(DyuSquare *)square
{
    _square =square;
    [_image sd_setImageWithURL:[NSURL URLWithString:square.icon]];
    _name.text = square.name;
    
}
@end
