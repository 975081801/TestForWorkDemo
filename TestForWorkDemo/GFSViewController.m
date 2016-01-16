//
//  GFSViewController.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSViewController.h"
#import "GFSEvalueteViewController.h"
@interface GFSViewController ()
- (IBAction)evalueteClick;

@end

@implementation GFSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)evalueteClick
{
    GFSEvalueteViewController *vc = [[GFSEvalueteViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
