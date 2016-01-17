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
    self.valueLable = valueLable;
    
    UIView *underLine = [[UIView alloc]init];
    // 默认隐藏
    underLine.hidden =YES;
    underLine.layer.cornerRadius = 3;
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
//    [UIView animateWithDuration:0.5 animations:^{
        self.underLine.hidden = !selected;
        if (self.underLine.hidden) {
            
            self.fillColor = GFSColor(0, 0, 0, 1);
        } else {
            self.fillColor = [UIColor greenColor];
        }
//    }];
    
}
- (void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    
    self.titleLable.textColor = fillColor;
    self.underLine.backgroundColor = fillColor;
    self.valueLable.textColor = fillColor;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置各控件尺寸
    
    CGFloat titleLableY = GFSTitleMarginY;
    NSDictionary *titleAttr = @{NSFontAttributeName:GFSTitleFont};
    CGFloat titleLableH = [self.titleLable.text sizeWithAttributes:titleAttr].height;
    CGFloat titleLableW = self.frame.size.width;
    self.titleLable.frame = CGRectMake(0, titleLableY, titleLableW, titleLableH);
    // value
    
    NSDictionary *valueAttr = @{NSFontAttributeName:GFSValueFont};
    CGFloat valueY = GFSTitleMarginY + CGRectGetMaxY(self.titleLable.frame);
    CGFloat valueW = titleLableW;
//    CGFloat valueH = 20;
    CGFloat valueH = [self.valueLable.text sizeWithAttributes:valueAttr].height;
    self.valueLable.frame = CGRectMake(0, valueY, valueW, valueH);
    
    // underLine
    CGFloat underX = 10;
    CGFloat underH = 3;
    CGFloat underW = titleLableW - 2*underX;
    CGFloat underY = CGRectGetMaxY(self.frame) - underH;
    self.underLine.frame = CGRectMake(underX, underY, underW, underH);
}
@end
