//
//  GFSTitleBar.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 定义按钮类型用于绑定tag
 */
typedef enum {
    kGFSTitleTypeAll,
    kGFSTitleTypeBetter,
    kGFSTitleTypeMiddle,
    kGFSTitleTypeBad,
    kGFSTitleTypePhoto
}GFSTitleType;
@class GFSTitleBar,GFSTitleView;
/**
 *  通知或者代理 皆可实现 这里用代理
 */
@protocol GFSTitleBarDelegate <NSObject>

@optional
- (void)titleBar:(GFSTitleBar *)titleBar didClickedTitle:(GFSTitleType)titletype;

@end
@interface GFSTitleBar : UIView
@property(nonatomic,weak)id<GFSTitleBarDelegate> delegate;
@property(nonatomic,weak)GFSTitleView *total;
@property(nonatomic,weak)GFSTitleView *better;
@property(nonatomic,weak)GFSTitleView *middle;
@property(nonatomic,weak)GFSTitleView *bad;
@property(nonatomic,weak)GFSTitleView *photoTitle;
@end
