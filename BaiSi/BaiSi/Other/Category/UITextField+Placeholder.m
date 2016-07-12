//
//  UITextField+Placeholder.m
//  BaiSi
//
//  Created by xiaomage on 16/6/21.
//  Copyright © 2016年 dyuk. All rights reserved.
//

#import "UITextField+Placeholder.h"

@implementation UITextField (Placeholder)
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if(self.placeholder.length == 0)
    {
        self.placeholder = @" ";
    }
    UILabel *placeholder = [self valueForKey:@"placeholderLabel"];
    placeholder.textColor = placeholderColor;
}

- (UIColor *)placeholderColor
{
    return nil;
}
@end
