//
//  GFSTableViewCell.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSTableViewCell.h"
#import "GFSPhotoViews.h"
#import "GFSEvaluete.h"
#import "GFSTableViewCellFrame.h"
@interface GFSTableViewCell()
/**  头像 */
@property(nonatomic,weak)UIImageView *iconView;
/** 昵称 */
@property(nonatomic,weak)UILabel *nameLabel;
/** 会员图标 */
@property(nonatomic,weak)UIImageView *vipView;
/** 评价级别 */
@property(nonatomic,weak)UIImageView *levelIcon;
/**  时间 */
@property(nonatomic,weak)UILabel *timeLabel;
/** 正文 */
@property(nonatomic,weak)UILabel *contentLabel;
/** 配图 */
@property(nonatomic,weak)GFSPhotoViews *photoView;
/** 已购买详情 */
@property(nonatomic,weak)UILabel *boughtLable;
@end
@implementation GFSTableViewCell

/**
 *  快速创建一个cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    // 创建cell
    static NSString *ID = @"evaluete";
    GFSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[GFSTableViewCell alloc ]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 添加子控件
        [self setupSubviews];
    }
    return self;
}
- (void)setCellFrame:(GFSTableViewCellFrame *)cellFrame
{
    _cellFrame = cellFrame;
    // 设置子控件尺寸
    // 1.取模型
    GFSEvaluete *evaluete = cellFrame.evaluete;
    GFSCustomer *customer = evaluete.customer;
//    GFSBuyProduct *boughtProduct = customer.boughtProduct;
    // 2.头像
    self.iconView.image = [UIImage imageNamed:customer.iconUrl];
    self.iconView.frame = cellFrame.iconViewF;
    // 3.昵称
    self.nameLabel.text = customer.name;
    self.nameLabel.frame = cellFrame.nameLabelF;
    // 4.vip
    if (customer.vipLevel) {
        self.vipView.hidden = NO;
        self.vipView.image = [UIImage imageWithName:[NSString stringWithFormat:@"vip_%d", customer.vipLevel]];
        self.vipView.frame = cellFrame.vipViewF;
        self.nameLabel.textColor = [UIColor blackColor];
    }else{
        // cell的循环利用  有状态改变就必须有改回去的方式
        self.vipView.hidden = YES;
    }
    // 5.评价星级
    self.levelIcon.frame = cellFrame.levelIconF;
    self.levelIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"level_%d",evaluete.evalueteLevel]];
    
    // 6.正文
    self.contentLabel.text = evaluete.content;
    
    self.contentLabel.frame = cellFrame.contentLabelF;
    
    // 7.配图
    if (evaluete.photos.count) {
        self.photoView.hidden = NO;
        self.photoView.photos = evaluete.photos;
        self.photoView.frame = cellFrame.photoViewF;
    } else {
        self.photoView.hidden = YES;
    }
    // 8.时间
    self.timeLabel.text = evaluete.create_at;
    self.timeLabel.frame = cellFrame.timeLabelF;
    
    // 9.已购买信息
    self.boughtLable.text = customer.boughtStr;
    CGSize boughtSize = [self.boughtLable.text sizeWithAttributes:@{NSFontAttributeName:GFSTimeFont}];
    CGFloat boughtLableX = CGRectGetMaxX(cellFrame.timeLabelF) + GFSCellBorder;
    CGFloat boughtLableY = self.timeLabel.frame.origin.y;
    
    CGRect boughtFrame = CGRectMake(boughtLableX, boughtLableY, boughtSize.width, boughtSize.height);
    self.boughtLable.frame = boughtFrame;
}
/**
 *  修改cell在tableView显示的部分属性
 */
- (void)setFrame:(CGRect)frame
{
    frame.origin.y += GFSTableBorder;
//    frame.origin.x = 0;
//    frame.size.width -= 2 * WBStatusTableBorder;
    frame.size.height -= GFSTableBorder;
    
    [super setFrame:frame];
}
- (void)setupSubviews
{
    self.selectedBackgroundView = [[UIView alloc]init];
    self.backgroundColor = [UIColor whiteColor];
    self.userInteractionEnabled = YES;
    /**  头像 */
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:iconView];
    self.iconView = iconView;
    
    /** 昵称 */
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.font = GFSTitleFont;
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    /** 会员图标 */
    UIImageView *vipView = [[UIImageView alloc]init];
    vipView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:vipView];
    self.vipView = vipView;
    
    /** 评价级别 */
    UIImageView *levelIcon = [[UIImageView alloc]init];
    levelIcon.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:levelIcon];
    self.levelIcon = levelIcon;
    
    /** 正文 */
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = GFSColor(39, 39, 39, 1.0);
    contentLabel.font = GFSContentFont;
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    /** 配图 */
    GFSPhotoViews *photoView = [[GFSPhotoViews alloc]init];
    [self addSubview:photoView];
    self.photoView = photoView;
    
    /**  时间 */
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.font = GFSTimeFont;
    timeLabel.textColor = GFSColor(240, 140, 19, 1.0);
    timeLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    /** 已购买信息 */
    UILabel *boughtLable = [[UILabel alloc]init];
    boughtLable.font = GFSTimeFont;
    boughtLable.textColor = GFSColor(240, 140, 19, 1.0);
    boughtLable.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:boughtLable];
    self.timeLabel = boughtLable;
}
@end
