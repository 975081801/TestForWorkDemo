//
//  GFSPhotoViews.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSPhotoViews.h"
#import "GFSPhoto.h"
#import "GFSPhotoView.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"

@implementation GFSPhotoViews

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled =YES;
        // 初始化5个子控件(假设最多5张图)
        for (int i = 0; i<5; i++) {
            GFSPhotoView *photoView = [[GFSPhotoView alloc]init];
            
            photoView.userInteractionEnabled = YES;
            photoView.tag = i;
            // 添加点击放大图片动作
            
            [photoView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(photoTap:)]];
            [self addSubview:photoView];
            
        }
    }
    return self;
}
- (void)photoTap:(UITapGestureRecognizer *)recognizer
{
    
    long int count = self.photos.count;
    // 封装图片数据
    NSMutableArray *photosArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0 ; i< count; i++) {
        // 一个MJPhoto对应一个显示的图片
        MJPhoto *mjphoto = [[MJPhoto alloc]init];
        // 获取相应的view
        mjphoto.srcImageView = self.subviews[i];
        
        GFSPhoto *aPhoto = self.photos[i];
        // 替换URL中的关键词  显示大图 模拟直接加载原图
        NSString *photoURL = aPhoto.bigger_pic;
        
        mjphoto.image = [UIImage imageNamed:photoURL];
        
        [photosArray addObject:mjphoto];
    }
    // 显示相册 浏览器
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = recognizer.view.tag; // 弹出相册时显示的第一张图片是？
    browser.photos = photosArray; // 设置所有的图片
    
    [browser show];
}
/**
 *  重写setter方法  取得photo数量 判断photoView显示与否
 */
- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    for (int i = 0; i<self.subviews.count; i++) {
        // 取出相应位置的view
        GFSPhotoView *photoView = self.subviews[i];
        if (i< photos.count) {// 需要显示
            // 显示图片
            photoView.hidden = NO;
            // 传递模型数据
            photoView.photo = self.photos[i];
            // 设置子控件的frame
            int maxColums = (int)photos.count;
            int col = i % maxColums;
            
            CGFloat photoX = col * (GFSPhotoW + GFSPhotoMargin);
            CGFloat photoY = 0;
            photoView.frame = CGRectMake(photoX, photoY, GFSPhotoW, GFSPhotoH);
            
            if (photos.count == 1) {
                photoView.contentMode = UIViewContentModeScaleAspectFit;
                photoView.hidden = NO;
            }else{
                photoView.contentMode = UIViewContentModeScaleAspectFill;
                // 超出部分裁剪
                photoView.clipsToBounds = YES;
                photoView.hidden = NO;
            }
        }else{
            photoView.hidden = YES;
        }
    }
}
/**
 *  根据图片的个数返回相册的最终尺寸
 */
+ (CGSize)photosViewSizeWithPhotoCount:(NSInteger)count
{
    // 高度
    CGFloat photosH = GFSPhotoH ;
    // 总列数
    long int cols = count;
    // 宽度
    CGFloat photosW = cols * GFSPhotoW + (cols -1)* GFSPhotoMargin;
    return CGSizeMake(photosW, photosH);
    
}

@end
