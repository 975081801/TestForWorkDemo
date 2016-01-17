//
//  GFSTitleView.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSTitleView.h"
@interface GFSTitleView()

@property(nonatomic,weak)UIView *underLine;
@property(nonatomic,weak)UILabel *titleLable;
@property(nonatomic,weak)UILabel *valueLable;

@end
@implementation GFSTitleView

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [_fillColor set];
    
    UIRectFillUsingBlendMode(rect, kCGBlendModeSourceIn);
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 可交互
        self.userInteractionEnabled = YES;
        [self setup];
    }
    return self;
}
- (void)setup
{
    UILabel *titleLable = [[UILabel alloc]init];
    titleLable.font = GFSTitleFont;
    titleLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLable];
    self.titleLable = titleLable;
    
    UILabel *valueLable = [[UILabel alloc]init];
    valueLable.font = GFSValueFont;
    valueLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:valueLable];
    self.titleLable = valueLable;
    
    UIView *underLine = [[UIView alloc]init];
    // 默认隐藏
    underLine.hidden =YES;
    [self addSubview:underLine];
    self.underLine = underLine;
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLable.text = title;
}
- (void)setValue:(int)value
{
    _value = value;
    self.valueLable.text = [NSString stringWithFormat:@"(%d)",value];
}
- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    // 选中时显示下划线
    self.underLine.hidden = !selected;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置各控件尺寸
    
}
@end
