//
//  GFSTableViewCellFrame.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//  cell 的frame模型

#import "GFSTableViewCellFrame.h"
#import "GFSPhotoViews.h"
@implementation GFSTableViewCellFrame
- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}
/**
 *  赋值  接收数据后根据数据计算frame
 *
 */
- (void)setEvaluete:(GFSEvaluete *)evaluete
{
    _evaluete = evaluete;
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    // 1.头像
    CGFloat iconX = GFSCellBorder;
    CGFloat iconY = GFSCellBorder;
    CGFloat iconWH = 35;
    _iconViewF = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    // 2.昵称
    CGFloat nameX = CGRectGetMaxX(_iconViewF) + GFSCellBorder;
    CGFloat nameY = iconY;
    CGSize nameSize = [evaluete.customer.name sizeWithAttributes:[NSDictionary dictionaryWithObject:GFSNameFont forKey:NSFontAttributeName]];
    _nameLabelF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    // 3.会员图标
    if (evaluete.customer.vipLevel) {// 如果是会员
        CGFloat vipX = CGRectGetMaxX(_nameLabelF) + GFSCellBorder;
        CGFloat vipY = nameY;
        // 先设置与文字相同高度  居中显示
        CGFloat vipW = 14;
        CGFloat vipH = nameSize.height;
        _vipViewF = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    // 4.评价星级图标
    CGFloat levelH = nameSize.height;
    CGFloat levelW = 60;
    CGFloat levelY = nameY;
    CGFloat levelX = cellW - levelW -2*GFSCellBorder;
    _levelIconF = CGRectMake(levelX, levelY, levelW, levelH);
    
    // 5.正文
    CGFloat contentX = iconX ;
    // 可能头像y值高  或者时间高 利用MAX
    CGFloat contentY = CGRectGetMaxY(_iconViewF) + GFSCellBorder;
    NSDictionary *attrs = [NSDictionary dictionaryWithObject:GFSContentFont forKey:NSFontAttributeName];
    CGSize contentSize = [evaluete.content boundingRectWithSize:CGSizeMake(cellW - 2*contentX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil ].size;
    _contentLabelF = CGRectMake(contentX, contentY, contentSize.width, contentSize.height);
    _cellHeight = CGRectGetMaxY(_contentLabelF);
    // 6.配图
    if (evaluete.photos.count) {// 如果有图
        CGSize photoviewSize = [GFSPhotoViews photosViewSizeWithPhotoCount:evaluete.photos.count];
        CGFloat photoX = contentX;
        
        CGFloat photoY = CGRectGetMaxY(_contentLabelF) + GFSCellBorder;
        _photoViewF = CGRectMake(photoX, photoY, photoviewSize.width, photoviewSize.height);
        _cellHeight = CGRectGetMaxY(_photoViewF);
    }

    // 7.时间
    CGFloat timeX = iconX;
    CGFloat timeY = _cellHeight + GFSCellBorder;
    CGSize timeSize = [evaluete.create_at sizeWithAttributes:[NSDictionary dictionaryWithObject:GFSTimeFont forKey:NSFontAttributeName]];
    _timeLabelF = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    // 8.已购买信息
    CGFloat boughtLableX = CGRectGetMaxX(_timeLabelF) + GFSCellBorder;
    CGFloat boughtLableY = timeY;
    
    CGSize boughtLableSzie = [evaluete.customer.boughtStr sizeWithAttributes:@{NSFontAttributeName:GFSTimeFont}];
    
    _boughtLableF = CGRectMake(boughtLableX, boughtLableY, boughtLableSzie.width, boughtLableSzie.height);
    // 9 cell高度
    _cellHeight = CGRectGetMaxY(_timeLabelF) + GFSCellBorder*0.5;

}
@end
