//
//  ZLStatusTextView.h
//  TestTexview
//
//  Created by zlwl001 on 2017/3/1.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLFrame.h"
@interface ZLStatusTextView : UITextView
/** 所有的特殊字符串(里面存放着HWSpecial) */
@property (nonatomic, strong) NSArray *specials;
@property(nonatomic,strong)ZLFrame *zlFrame;
@property(nonatomic,assign)int maxLine;
@property(nonatomic,assign)BOOL isShowAll;//是否全部显示
@end
