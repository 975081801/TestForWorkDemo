//
//  GFSPhotoView.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//  一个photo

#import "GFSPhotoView.h"
#import "GFSPhoto.h"
@interface GFSPhotoView()
@end
@implementation GFSPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
        
    }
    return self;
}
- (void)setPhoto:(GFSPhoto *)photo
{
    _photo = photo;
    // 正常情况 网络加载图片
    // 下载图片 利用第三方框架
//    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
    
#warning 模拟直接加载
    self.image = [UIImage imageNamed:self.photo.thumbnail_pic];
}
@end
