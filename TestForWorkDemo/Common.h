//
//  Common.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//  公用宏

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue]>=7.0)

#define GFSColor(r,g,b) [UIColor colorWithRed:(r)/255 green:(g)/255 blue:(b)/255 alpha:1.0]
/**
 *  标题字体
 */
#define GFSTitleFont [UIFont systemFontOfSize:14.0]
/**
 *  数值字体
 */
#define GFSValueFont [UIFont systemFontOfSize:12.0]