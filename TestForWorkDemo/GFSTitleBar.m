//
//  GFSTitleBar.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSTitleBar.h"
#import "GFSTitleView.h"
@interface GFSTitleBar()
/**
 *  title数组
 */
@property(nonatomic,strong)NSMutableArray *titleArray;
/**
 *  分割线
 */
@property(nonatomic,strong)NSMutableArray *dividers;
/**
 *  选中的按钮
 */
@property(nonatomic,strong)GFSTitleView *selectedTitleView;
@end
@implementation GFSTitleBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        for (int i = 0; i< 5; i++) {
            GFSTitleView *title = [[GFSTitleView alloc]init];
            title.tag = i;
            [self addSubview:title];
            [self.titleArray addObject:title];
        }
        
    }
    return self;
}
- (void)setSelectedTitleView:(GFSTitleView *)selectedTitleView
{
    
}
#pragma mark-点击处理
/**
 *  判断点击事件点击的title
 *
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    [self.titleArray enumerateObjectsUsingBlock:^(GFSTitleView *title, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectContainsPoint(title.frame, point)) {
            
            self.selectedTitleView.selected = NO;
            title.selected = YES;
            self.selectedTitleView = title;
            
            *stop = YES;
        }
    }];
    return [super hitTest:point withEvent:event];
}
@end
