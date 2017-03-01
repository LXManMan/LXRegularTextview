//
//  ZLFrame.h
//  TestTexview
//
//  Created by zlwl001 on 2017/3/1.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLStatus.h"
@interface ZLFrame : NSObject

//设置

/** 限制最大行数  这一步必须在设置完contentLabelF之后设置*/
@property(nonatomic,assign)int  maxNumLine;
@property(nonatomic,strong)ZLStatus *status;
@property(nonatomic,assign)CGFloat frameX;
@property(nonatomic,assign)CGFloat frameY;
@property(nonatomic,assign)CGFloat maxWidth;
//取值
/**   */
/** 正文 */
@property (nonatomic, assign) CGRect contentLabelF;
@property(nonatomic,assign)CGRect   maxNumLabelF;

@end
