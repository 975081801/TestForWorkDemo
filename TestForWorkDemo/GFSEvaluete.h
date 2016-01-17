//
//  GFSEvaluete.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//  评价数据模型

#import <Foundation/Foundation.h>
#import "GFSCustomer.h"
@interface GFSEvaluete : NSObject
/**
 *  顾客
 */
@property(nonatomic,strong)GFSCustomer *customer;
/**
 *  评价内容
 */
@property(nonatomic,copy)NSString *content;
/**
 *  评价星级  半颗星代表1分  五颗星10分  根据分值加载不同图片
 */
@property(nonatomic,assign)int evalueteLevel;
/**
 *  图片 （买家秀图片）
 */
@property(nonatomic,strong)NSArray *photos;
/**
 *  评价时间
 */
@property(nonatomic,copy)NSString *create_at;
@end
