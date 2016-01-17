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
- (void)setBoughtProduct:(GFSBuyProduct *)boughtProduct
{
    _boughtProduct = boughtProduct;
    self.boughtStr = [NSString stringWithFormat:@"已购:%@ 款式:%@ 颜色:%@ 尺码:%@",boughtProduct.sex,boughtProduct.style,boughtProduct.color,boughtProduct.size];
}
@end
