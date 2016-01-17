//
//  NSDateFormatter+GFS.m
//
//  Created by 管复生 on 15/12/26.
//  Copyright (c) 2015年 Gfs. All rights reserved.
//

#import "NSDateFormatter+GFS.h"

@implementation NSDateFormatter (GFS)

+ (instancetype)initWithFormatter
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.shortWeekdaySymbols = @[@"Mon",@"Tues",@"Wed",@"Thur",@"Fri",@"Sat",@"Sun"];
    fmt.shortMonthSymbols = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"];
    
    return fmt;
}
@end
