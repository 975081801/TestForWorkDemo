//
//  GFSPhotoViews.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFSPhotoViews : UIImageView
/**
 *  需要展示的图片(数组里面装的都是GFSPhoto模型)
 */
@property(nonatomic,strong)NSArray *photos;
/**
 *  根据图片的个数返回相册的最终尺寸
 */
+ (CGSize)photosViewSizeWithPhotoCount:(NSInteger)count;
@end
