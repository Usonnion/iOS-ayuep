//
//  NSString+Format.m
//  约拍
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 ArtisticPhoto. All rights reserved.
//

#import "NSString+Format.h"

@implementation NSString (Format)

+ (BOOL)isNilOrEmpty:(NSString *)str
{
    return [str isKindOfClass:[NSNull class]] || !str || [str isEqualToString:@""];
}

@end
