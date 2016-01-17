//
//  GFSCustomer.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//  顾客模型

#import <Foundation/Foundation.h>
#import "GFSBuyProduct.h"

@interface GFSCustomer : NSObject
/**
 *  会员等级  0为非会员(默认)
 */
@property(nonatomic,assign)int vipLevel;
/**
 *  头像URL   模拟实现利用本地图片
 */
@property(nonatomic,copy)NSString *iconUrl;
/**
 *  昵称
 */
@property(nonatomic,copy)NSString *name;
/**
 *  已购买的物品 （款式  颜色  尺寸）
 */
@property(nonatomic,copy)NSString *boughtStr;
@property(nonatomic,strong)GFSBuyProduct *boughtProduct;
@end
