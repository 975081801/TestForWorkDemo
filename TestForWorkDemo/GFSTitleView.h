//
//  GFSTitleView.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFSTitleView : UIView

@property (nonatomic, strong) UIColor *fillColor;
@property(nonatomic,assign,getter=isSelected)BOOL selected;
@property(nonatomic,copy)NSString *title;
/**
 *  数值
 */
@property(nonatomic,assign)int value;
@end
