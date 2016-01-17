//
//  GFSTableViewCellFrame.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//  cell 的frame模型

#import <Foundation/Foundation.h>
#import "GFSEvaluete.h"
@interface GFSTableViewCellFrame : NSObject
/**  头像 */
@property(nonatomic,assign,readonly)CGRect iconViewF;
/** 昵称 */
@property(nonatomic,assign,readonly)CGRect nameLabelF;
/** 会员图标 */
@property(nonatomic,assign,readonly)CGRect vipViewF;
/** 评价等级图 */
@property (nonatomic, assign, readonly) CGRect levelIconF;
/**  时间 */
@property(nonatomic,assign,readonly)CGRect timeLabelF;
/**  已购买 */
@property (nonatomic, assign, readonly) CGRect boughtLableF;
/** 正文 */
@property(nonatomic,assign,readonly)CGRect contentLabelF;
/** 配图 */
@property(nonatomic,assign,readonly)CGRect photoViewF;
/** cell的高度 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property(nonatomic,strong)GFSEvaluete *evaluete;
@end
