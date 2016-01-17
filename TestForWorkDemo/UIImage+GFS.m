//
//  UIImage+GFS.m
//
//  Created by 管复生 on 15/12/16.
//  Copyright (c) 2015年 Gfs. All rights reserved.
//

#import "UIImage+GFS.h"

@implementation UIImage (GFS)

+ (UIImage *)imageWithName:(NSString *)name
{
    if (iOS7) {
        // 添加后缀
        NSString *newName = [name stringByAppendingString:@"_os7"];
        
        UIImage *image = [UIImage imageNamed:newName];
        if (image == nil) {// 如果没有后缀
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    // 非iOS7
    return [UIImage imageNamed:name];
}
+ (UIImage *)resizeImageWithName:(NSString *)name
{
    UIImage *oldImage = [self imageWithName:name];
    
    return [oldImage stretchableImageWithLeftCapWidth:oldImage.size.width*0.5 topCapHeight:oldImage.size.height*0.5];
}
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *oldImage = [self imageWithName:name];
    
    return [oldImage stretchableImageWithLeftCapWidth:oldImage.size.width*left topCapHeight:oldImage.size.height*top];
}
@end
