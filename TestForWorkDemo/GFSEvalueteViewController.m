//
//  GFSEvalueteViewController.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSEvalueteViewController.h"
#import "GFSTitleBar.h"
#import "GFSTitleView.h"
#import "GFSTableViewCellFrame.h"
#import "GFSTableViewCell.h"
#import "GFSPhoto.h"
#import "GFSTableViewController.h"
@interface GFSEvalueteViewController ()<GFSTitleBarDelegate,UITableViewDelegate,UITableViewDataSource>
/**
 *  标题工具栏
 */
@property(nonatomic,weak)GFSTitleBar *titleBar;
@property(nonatomic,weak)GFSTableViewController *tableViewController;

@end

@implementation GFSEvalueteViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    // 设置导航栏
    [self setupNavagationTheme];
    // 设置titleBar
    [self setupTitleBar];
    [self titleBar:self.titleBar didClickedTitle:kGFSTitleTypeAll];
}
#pragma mark-懒加载

- (void)setupTableView
{
    // tableView
    GFSTableViewController *tableViewController = [[GFSTableViewController alloc]init];
    tableViewController.tableView.frame = self.view.bounds;
    [self addChildViewController:tableViewController];
    self.tableViewController = tableViewController;
    [self.view addSubview:self.tableViewController.tableView];
}
/**
 *  设置titleBar
 */
- (void)setupTitleBar
{
    // titlebar
    GFSTitleBar *titleBar = [[GFSTitleBar alloc]init];
    //传入数值
    titleBar.total.value = (int)self.tableViewController.total.count;
    titleBar.better.value = (int)self.tableViewController.better.count;
    titleBar.middle.value = (int)self.tableViewController.middle.count;
    titleBar.bad.value = (int)self.tableViewController.bad.count;
    titleBar.photoTitle.value = (int)self.tableViewController.photo.count;
    
    CGFloat titleBarW = self.view.bounds.size.width;
    CGFloat titleBarH = 45;
    CGFloat titleBarY = 64;
    titleBar.frame = CGRectMake(0, titleBarY, titleBarW, titleBarH);
//    titleBar.backgroundColor = [UIColor grayColor];
    titleBar.delegate = self;
//    [self.view addSubview:titleBar];
    [self.view insertSubview:titleBar aboveSubview:self.tableViewController.tableView];
    self.titleBar = titleBar;
    
    self.tableViewController.tableView.contentInset = UIEdgeInsetsMake( titleBarH, 0, 20, 0);
}
/**
 *  设置导航栏
 */
- (void)setupNavagationTheme
{
        self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageWithName:@"navigationbar_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.title = @"商品评价";
}

#pragma mark-代理方法 实现表格数据切换（模拟用数组  实际网络是修改请求参数）
- (void)titleBar:(GFSTitleBar *)titleBar didClickedTitle:(GFSTitleType)titletype
{
    switch (titletype) {
        case kGFSTitleTypeAll:
            self.tableViewController.display = self.tableViewController.total;
            break;
        case kGFSTitleTypeBetter:
            self.tableViewController.display = self.tableViewController.better;
            break;
        case kGFSTitleTypeMiddle:
            self.tableViewController.display = self.tableViewController.middle;
            break;
        case kGFSTitleTypeBad:
            self.tableViewController.display = self.tableViewController.bad;
            break;
        default:
            self.tableViewController.display = self.tableViewController.photo;
            break;
    }
}
@end
