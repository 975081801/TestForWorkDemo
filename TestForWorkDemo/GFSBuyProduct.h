//
//  GFSBuyProduct.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//  已购买的物品模型

#import <Foundation/Foundation.h>

@interface GFSBuyProduct : NSObject
/**
 *  款式
 */
@property(nonatomic,copy)NSString *style;
/**
 *  颜色
 */
@property(nonatomic,copy)NSString *color;
/**
 *  尺码
 */
@property(nonatomic,copy)NSString *size;
@end
