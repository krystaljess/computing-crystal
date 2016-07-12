//
//  DyuModalViewController.m
//  BaiSi
//
//  Created by xiaomage on 16/6/27.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "DyuModalViewController.h"
#import "UIView+Frame.h"
#import "DyuThemeItem.h"
#import <DALabeledCircularProgressView.h>
#import <UIImageView+WebCache.h>
#import "Dyu.pch"
@interface DyuModalViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic , strong)UIImageView *imageview;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *prossgrees;


@end

@implementation DyuModalViewController
//@property(nonatomic, strong) UIColor *trackTintColor UI_APPEARANCE_SELECTOR;
//@property(nonatomic, strong) UIColor *progressTintColor UI_APPEARANCE_SELECTOR;
//@property(nonatomic, strong) UIColor *innerTintColor UI_APPEARANCE_SELECTOR;
-(void)awakeFromNib
{
    _prossgrees.roundedCorners = 10;
    _prossgrees.progressTintColor = [UIColor whiteColor];
    _prossgrees.trackTintColor = [UIColor clearColor];
    _prossgrees.progressLabel.textColor = [UIColor clearColor];
//    _progress.roundedCorners = 10;
//    _progress.progressTintColor = [UIColor whiteColor];
//    _progress.trackTintColor = [UIColor clearColor];
//    _progress.progressLabel.textColor = [UIColor whiteColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    UIImageView *imageview = [[UIImageView alloc] init];
    
    [imageview sd_setImageWithURL:[NSURL URLWithString:_item.image1] placeholderImage:nil options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        CGFloat parss = 1.0 * receivedSize / expectedSize;
        _prossgrees.progress = parss;
        _prossgrees.progressLabel.text = [NSString stringWithFormat:@"%.1f%%",parss * 100];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        _prossgrees.hidden = YES;
        self.scrollView.contentSize = CGSizeMake(ScreenW,ScreenW / _item.width * _item.height);
        imageview.frame = CGRectMake(0, 0,ScreenW,ScreenW / _item.width * _item.height);
        if (image.size.height <= ScreenH) {
            imageview.center = CGPointMake(ScreenW * 0.5, ScreenH * 0.5);
        }
        _imageview = imageview;
        [self.scrollView addSubview:imageview];
        
        if (_item.width > ScreenW) {
            self.scrollView.maximumZoomScale = _item.width /ScreenW;
            self.scrollView.minimumZoomScale = 1;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)comentBtn:(UIButton *)sender {
}
- (IBAction)GoBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageview;
}
@end
