//
//  GFSCustomer.m
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/16.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import "GFSCustomer.h"

@implementation GFSCustomer
- (int)vipLevel
{
    return _vipLevel? _vipLevel:0;
}
- (NSString *)boughtStr
{
    return[NSString stringWithFormat:@"已购：%@ 款式：%@ 颜色：%@ 尺码：%@",self.boughtProduct.sex,self.boughtProduct.style,self.boughtProduct.color,self.boughtProduct.size];
}
@end
