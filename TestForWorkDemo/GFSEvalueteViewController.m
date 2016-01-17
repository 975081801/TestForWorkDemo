//
//  GFSEvalueteViewController.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSEvalueteViewController.h"
#import "GFSTitleBar.h"
#import "GFSEvalueteTableViewController.h"
@interface GFSEvalueteViewController ()<GFSTitleBarDelegate>
/**
 *  表格
 */
@property(nonatomic,weak)GFSEvalueteTableViewController *tableView;
/**
 *  标题工具栏
 */
@property(nonatomic,weak)GFSTitleBar *titleBar;
@end
#warning 应该是加载网络数据的  模拟
@implementation GFSEvalueteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏
    [self setupNavagationTheme];
    // 设置titleBar
    [self setupTitleBar];
    
}
/**
 *  设置titleBar
 */
- (void)setupTitleBar
{
    GFSTitleBar *titleBar = [[GFSTitleBar alloc]init];
    CGFloat titleBarY = 64;
    CGFloat titleBarW = self.view.bounds.size.width;
    CGFloat titleBarH = 50;
    titleBar.frame = CGRectMake(0, titleBarY, titleBarW, titleBarH);
    titleBar.backgroundColor = GFSColor(100, 100, 100);
    titleBar.delegate = self;
    [self.view addSubview:titleBar];
    self.titleBar = titleBar;
}
/**
 *  设置导航栏
 */
- (void)setupNavagationTheme
{
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:nil action:nil];
    self.title = @"商品评价";
}
@end
