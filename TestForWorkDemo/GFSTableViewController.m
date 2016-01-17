//
//  GFSTableViewController.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSTableViewController.h"
#import "GFSTitleBar.h"
#import "GFSTitleView.h"
#import "GFSTableViewCellFrame.h"
#import "GFSTableViewCell.h"
#import "GFSPhoto.h"
@interface GFSTableViewController()<UITableViewDataSource,UITableViewDelegate>
@end
@implementation GFSTableViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self loadData];
}
- (void)setDisplay:(NSMutableArray *)display
{
    _display = display;
    
    [self.tableView reloadData];
}
- (NSArray *)better
{
    if (!_better) {
        _better = [NSMutableArray array];
        for (GFSTableViewCellFrame *frame in self.total) {
            GFSEvaluete *evaluete = frame.evaluete;
            if (evaluete.evalueteLevel >= 8) {//8分以上好评
                [_better addObject:frame];
            }
        }
    }
    return _better;
}
- (NSMutableArray *)photo
{
    if (!_photo) {
        _photo = [NSMutableArray array];
        for (GFSTableViewCellFrame *frame in self.total) {
            GFSEvaluete *evaluete = frame.evaluete;
            if (evaluete.photos.count > 0) {// 有图
                [_photo addObject:frame];
            }
        }
    }
    return _photo;
}
- (void)setTotal:(NSMutableArray *)total
{
    _total = total;
    [self.tableView reloadData];
}
#pragma mark- tableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.display.count;
}

#warning 应该是加载网络数据的  模拟用不同数组代表加载数据。  真实网络应该是根据点击修改请求参数 发送请求  加载数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    GFSTableViewCell *cell = [GFSTableViewCell cellWithTableView:tableView];
    
    // 设置cell内容数据
    GFSTableViewCellFrame  *cellFrame = self.display[indexPath.row];
    
    cell.cellFrame = cellFrame;
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GFSTableViewCellFrame *frame = self.display[indexPath.row];
    return frame.cellHeight;
}
/**
 *  loadData加载数据
 */
- (void)loadData
{
#warning 注意 虚拟数据
    // 正常用AFN等框架  封装请求参数 发送请求 并在这里解析数据
    // 根据解析的每一条评论  赋值给每一个cellFrame.evaluete  数据传入即可
    // 在这里模拟加载  直接用假的数据
    GFSEvaluete *evaluete1 = [[GFSEvaluete alloc]init];
    GFSCustomer *customer1 = [[GFSCustomer alloc]init];
    GFSBuyProduct *boughtProduct1 = [[GFSBuyProduct alloc]init];
    
    boughtProduct1.sex = @"男款";
    boughtProduct1.style = @"运动T恤";
    boughtProduct1.color = @"白色";
    boughtProduct1.size = @"XL";
    
    
    customer1.boughtProduct = boughtProduct1;
    customer1.vipLevel = 4;
    customer1.iconUrl = @"02.jpg";
    customer1.name = @"感觉突然呵呵哒";
    
    //    @property(nonatomic,copy)NSString *create_at;
    evaluete1.customer = customer1;
    evaluete1.content = @"果然还不错的样子果然还不错的样子果然还不错的样子果然还不错的样子果然还不错的样子果然还不错的样子";
    evaluete1.evalueteLevel = 9;
    GFSPhoto *photo1 = [[GFSPhoto alloc]init];
    photo1.thumbnail_pic = @"01.jpg";
    photo1.bigger_pic = photo1.thumbnail_pic;
    GFSPhoto *photo2 = [[GFSPhoto alloc]init];
    photo2.thumbnail_pic = @"03.jpg";
    photo2.bigger_pic = photo2.thumbnail_pic;
    GFSPhoto *photo3 = [[GFSPhoto alloc]init];
    photo3.thumbnail_pic = @"05.jpg";
    photo3.bigger_pic = photo3.thumbnail_pic;
    GFSPhoto *photo4 = [[GFSPhoto alloc]init];
    photo4.thumbnail_pic = @"06.jpg";
    photo4.bigger_pic = photo4.thumbnail_pic;
    GFSPhoto *photo5 = [[GFSPhoto alloc]init];
    photo5.thumbnail_pic = @"02.jpg";
    photo5.bigger_pic = photo5.thumbnail_pic;
    
    evaluete1.photos = @[photo1,photo2,photo3];
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"YYYY-M-d HH:mm:ss";
    evaluete1.create_at = [fmt stringFromDate:[NSDate date]];
    
    GFSTableViewCellFrame *cellFrame1 = [[GFSTableViewCellFrame alloc]init];
    cellFrame1.evaluete = evaluete1;
    NSMutableArray *frameArray = [NSMutableArray array];
    [frameArray addObject:cellFrame1];
    
    GFSEvaluete *evaluete2 = [[GFSEvaluete alloc]init];
    GFSCustomer *customer2 = [[GFSCustomer alloc]init];
    GFSBuyProduct *boughtProduct2 = [[GFSBuyProduct alloc]init];
    
    boughtProduct2.sex = @"女款";
    boughtProduct2.style = @"运动T恤";
    boughtProduct2.color = @"黑色";
    boughtProduct2.size = @"XL";
    
    
    customer2.boughtProduct = boughtProduct1;
    customer2.vipLevel = 5;
    customer2.iconUrl = @"06.jpg";
    customer2.name = @"就是感觉呵呵哒";
    
    //    @property(nonatomic,copy)NSString *create_at;
    evaluete2.customer = customer2;
    evaluete2.content = @"依然很漂亮依然很漂亮依然很漂亮依然很漂亮依然很漂亮依然很漂亮依然很漂亮依然很漂亮";
    evaluete2.evalueteLevel = 10;
    evaluete2.create_at = [fmt stringFromDate:[NSDate dateWithTimeIntervalSinceNow:1220]];
    
    GFSTableViewCellFrame *cellFrame2 = [[GFSTableViewCellFrame alloc]init];
    cellFrame2.evaluete = evaluete2;
    [frameArray addObject:cellFrame2];
    
    self.total = frameArray;
}

@end
