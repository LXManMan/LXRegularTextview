//
//  ZLSpecial.h
//  TestTexview
//
//  Created by zlwl001 on 2017/3/1.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLSpecial : NSObject
/** 这段特殊文字的内容 */
@property (nonatomic, copy) NSString *text;
/** 这段特殊文字的范围 */
@property (nonatomic, assign) NSRange range;
@property(nonatomic,copy)NSString *urlString;
@end
