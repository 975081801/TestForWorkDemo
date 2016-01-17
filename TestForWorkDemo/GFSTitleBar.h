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
@class GFSTitleBar;
@protocol GFSTitleBarDelegate <NSObject>

@optional
- (void)titleBar:(GFSTitleBar *)titleBar didClickedTitle:(GFSTitleType)titletype;

@end
@interface GFSTitleBar : UIView
@property(nonatomic,weak)id<GFSTitleBarDelegate> delegate;
@end
