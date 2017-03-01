//
//  ZLTextPart.m
//  TestTexview
//
//  Created by zlwl001 on 2017/3/1.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "ZLTextPart.h"

@implementation ZLTextPart
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ - %@", self.text, NSStringFromRange(self.range)];
}
@end
