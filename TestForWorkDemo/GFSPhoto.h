//
//  GFSPhoto.h
//  TestForWorkDemo
//
//  Created by 管复生 on 16/1/17.
//  Copyright © 2016年 GFS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GFSPhoto : NSObject
/**
 *  缩略图
 */
@property (nonatomic, copy) NSString *thumbnail_pic;
/**
 *  大图
 */
@property(nonatomic,copy)NSString *bigger_pic;
@end
