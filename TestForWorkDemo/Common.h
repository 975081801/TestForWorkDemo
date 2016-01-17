//
//  Common.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//  公用宏

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue]>=7.0)

#define GFSColor(r,g,b,a) [UIColor colorWithRed:(r)/255 green:(g)/255 blue:(b)/255 alpha:(a)]
/**
 *  标题字体
 */
#define GFSTitleFont [UIFont systemFontOfSize:16.0]
/**
 *  数值字体
 */
#define GFSValueFont [UIFont systemFontOfSize:14.0]
/**
 *  时间字体
 */
#define GFSTimeFont [UIFont systemFontOfSize:13.0]
#define GFSNameFont GFSTitleFont
#define GFSContentFont GFSTitleFont
/**
 *  标题竖直方向间距
 */
#define GFSTitleMarginY  1.0
/**
 *  图片宽度 高度  间距
 */
#define GFSPhotoW 50
#define GFSPhotoH 50
#define GFSPhotoMargin 8
/**
 *  cell间距
 */
#define GFSCellBorder 10
#define GFSTableBorder 5