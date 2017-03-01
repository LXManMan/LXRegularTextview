//
//  ZLFrame.m
//  TestTexview
//
//  Created by zlwl001 on 2017/3/1.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "ZLFrame.h"
@interface ZLFrame()
//检测高度的label;
@property(nonatomic,strong)UILabel *templateLabel;
@end
@implementation ZLFrame
-(void)setStatus:(ZLStatus *)status{
    _status = status;
    CGSize contentSize = [status.attributedText boundingRectWithSize:CGSizeMake(self.maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    self.contentLabelF = (CGRect){{self.frameX , self.frameY}, contentSize};
    
}
-(void)setMaxNumLine:(int)maxNumLine{
    _maxNumLine = maxNumLine;
    
    self.templateLabel.frame =CGRectMake(self.frameX, self.frameY, self.maxWidth, 0);
    self.templateLabel.attributedText = self.status.attributedText;
    self.templateLabel.numberOfLines = maxNumLine;
    [self.templateLabel sizeToFit];
    self.maxNumLabelF = self.templateLabel.frame;
    
}
-(void)setFrameX:(CGFloat)frameX{
    _frameX = frameX;
}
-(void)setFrameY:(CGFloat)frameY{
    _frameY = frameY;
}
-(void)setMaxWidth:(CGFloat)maxWidth{
    _maxWidth = maxWidth;
}

-(UILabel *)templateLabel{
    if (!_templateLabel) {
        _templateLabel =[[UILabel alloc]init];
        
    }
    return _templateLabel;
}
@end
