//
//  UIImage+GFS.h
//
//  Created by 管复生 on 15/12/16.
//  Copyright (c) 2015年 Gfs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GFS)
/**
 *  分系统不同 加载不同图片
 *
 *  @param name 图片名
 *
 *  @return 图片
 */
+ (UIImage *)imageWithName:(NSString *)name;
/**
 *  返回一张自由拉伸的图片
 *
 */
+ (UIImage *)resizeImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
@end
