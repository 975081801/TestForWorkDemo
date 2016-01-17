//
//  GFSTableViewCell.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSTableViewCell.h"
@interface GFSTableViewCell()

@end
@implementation GFSTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithFrame:(CGRect)frame
{
    return self;
}
/**
 *  修改部分属性
 */
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
}
@end
