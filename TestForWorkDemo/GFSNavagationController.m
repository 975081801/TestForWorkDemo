//
//  GFSNavagationController.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//  自定义导航

#import "GFSNavagationController.h"

@interface GFSNavagationController ()
//@property(nonatomic,weak)UILabel *titlelable;
@end

@implementation GFSNavagationController


+ (void)initialize
{
    [self setupNavBarButtonTheme];
    [self setupTheme];
}
+ (void)setupNavBarButtonTheme
{
    // 获取当前按钮
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置背景 针对iOS6
    if (!iOS7) {
        // 按钮的三种状态都要考虑到
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    // 设置文字属性
    NSMutableDictionary *textAttrs = [[NSMutableDictionary alloc]init];
    
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:iOS7 ? 14 : 12];
    textAttrs[NSForegroundColorAttributeName] = iOS7 ? [UIColor orangeColor] : [UIColor grayColor];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor clearColor];
    shadow.shadowOffset = CGSizeMake(0, 0);
    shadow.shadowBlurRadius = 0;
    textAttrs[NSShadowAttributeName] = shadow;
    
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
}

+ (void)setupTheme
{
    // 取出当前的navBar对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置标题属性
    NSMutableDictionary *textAttrs = [[NSMutableDictionary alloc]init];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    // 阴影设置
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor clearColor];
    shadow.shadowOffset = CGSizeMake(0, 0);
    shadow.shadowBlurRadius = 0;
    textAttrs[NSShadowAttributeName] = shadow;
    
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:19.0];
    [navBar setTitleTextAttributes:textAttrs];
}

/**
 *  拦截底部tabBar（整体项目中用的到  暂时做的没用到）
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // 隐藏底部tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
#warning 自定义导航的按钮等自定义未做

@end
