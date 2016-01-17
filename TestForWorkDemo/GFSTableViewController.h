//
//  GFSTableViewController.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFSTableViewController : UITableViewController   
/**
 *  展示的 数据(内部为cellFrame数组)
 */
@property(nonatomic,strong)NSMutableArray *display;
/**
 *  全部
 */
@property(nonatomic,strong)NSMutableArray *total;
/**
 *  好评
 */
@property(nonatomic,strong)NSMutableArray *better;
/**
 *  中评
 */
@property(nonatomic,strong)NSMutableArray *middle;
/**
 *  差评
 */
@property(nonatomic,strong)NSMutableArray *bad;
/**
 *  有图
 */
@property(nonatomic,strong)NSMutableArray *photo;
@end
