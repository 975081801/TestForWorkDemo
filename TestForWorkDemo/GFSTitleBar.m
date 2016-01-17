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
        
        self.backgroundColor = [UIColor whiteColor];
       // 添加5个标题
        self.total = [self addTitleViewWithTitle:@"全部" andTag:kGFSTitleTypeAll];
        self.better =[self addTitleViewWithTitle:@"好评" andTag:kGFSTitleTypeBetter];
        self.middle = [self addTitleViewWithTitle:@"中评" andTag:kGFSTitleTypeMiddle];
        self.bad = [self addTitleViewWithTitle:@"差评" andTag:kGFSTitleTypeBad];
        self.photoTitle = [self addTitleViewWithTitle:@"有图" andTag:kGFSTitleTypePhoto];
        
        for (int i = 0 ; i<self.titleArray.count -1; i++) {
            [self addDividers];
        }
    }
    return self;
}
- (NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}
- (NSMutableArray *)dividers
{
    if (!_dividers) {
        _dividers = [NSMutableArray array];
    }
    return _dividers;
}
- (void)addDividers
{
    UIImageView *divider = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line_os7"]];
    [self.dividers addObject:divider];
    [self addSubview:divider];
}
- (GFSTitleView *)addTitleViewWithTitle:(NSString *)title andTag:(NSUInteger)tag
{
    GFSTitleView *titleView = [[GFSTitleView alloc]init];
    
    titleView.title = title;
    // 绑定tag
    titleView.tag = tag;
    [self.titleArray addObject:titleView];
    if (self.titleArray.count == 1) {
        [self titeViewClick:titleView];
    }
    [self addSubview:titleView];
    return titleView;
}
- (void)setSelectedTitleView:(GFSTitleView *)selectedTitleView
{
    _selectedTitleView = selectedTitleView;
    // 调用代理实现点击的界面交互
    if ([self.delegate respondsToSelector:@selector(titleBar:didClickedTitle:)]) {
        [self.delegate titleBar:self didClickedTitle:(GFSTitleType)selectedTitleView.tag];
    }
}
#pragma mark-点击处理
- (void)titeViewClick:(GFSTitleView *)title
{
    self.selectedTitleView.selected = NO;
    title.selected = YES;
    self.selectedTitleView = title;
}
/**
 *  判断点击事件点击的title
 *
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    [self.titleArray enumerateObjectsUsingBlock:^(GFSTitleView *title, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectContainsPoint(title.frame, point)) {
            
            [self titeViewClick:title];
            
            *stop = YES;
        }
    }];
    return [super hitTest:point withEvent:event];
}
/**
 *  子控件布局
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat titleW = (self.bounds.size.width - self.dividers.count *2)/ self.titleArray.count;
    CGFloat titleH = self.bounds.size.height;
    
    for (int i = 0; i< self.titleArray.count; i++) {
        GFSTitleView *title = self.titleArray[i];
        CGFloat titleX = i * (titleW + 2);
        title.frame = CGRectMake(titleX, 0, titleW, titleH);
    }
    for (int i= 0; i<self.dividers.count; i++) {
        UIImageView *divider = self.dividers[i];
        CGFloat dividerX = titleW + i*(titleW +2);
        
        divider.frame = CGRectMake(dividerX, 0, 2, titleH);
    }
}
@end
