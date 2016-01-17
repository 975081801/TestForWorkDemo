//
//  GFSTableViewCell.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GFSTableViewCellFrame;
@interface GFSTableViewCell : UITableViewCell
/** 每一个评价cell的frame*/
@property(nonatomic,strong)GFSTableViewCellFrame *cellFrame;
/**
 *  快速创建一个cell
 *
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
