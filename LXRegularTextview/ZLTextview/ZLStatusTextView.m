//
//  ZLStatusTextView.m
//  TestTexview
//
//  Created by zlwl001 on 2017/3/1.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "ZLStatusTextView.h"
#import "ZLSpecial.h"
#define ZLStatusTextViewCoverTag 999
@implementation ZLStatusTextView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.editable = NO;
        self.textContainerInset = UIEdgeInsetsMake(0, -5, 0, -5);
        // 禁止滚动, 让文字完全显示出来
        self.scrollEnabled = NO;
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 触摸对象
    UITouch *touch = [touches anyObject];
    
    // 触摸点
    CGPoint point = [touch locationInView:self];
    
    NSArray *specials = [self.attributedText attribute:@"specials" atIndex:0 effectiveRange:NULL];
    BOOL contains = NO;
    
    for (ZLSpecial *special in specials) {
        self.selectedRange = special.range;
        // self.selectedRange --影响--> self.selectedTextRange
        // 获得选中范围的矩形框
        NSArray *rects = [self selectionRectsForRange:self.selectedTextRange];
        // 清空选中范围
        self.selectedRange = NSMakeRange(0, 0);
        
        for (UITextSelectionRect *selectionRect in rects) {
            CGRect rect = selectionRect.rect;
            if (rect.size.width == 0 || rect.size.height == 0) continue;
            
            if (CGRectContainsPoint(rect, point)) { // 点中了某个特殊字符串
                contains = YES;
                break;
            }
        }
        
        if (contains) {
            for (UITextSelectionRect *selectionRect in rects) {
                CGRect rect = selectionRect.rect;
                if (rect.size.width == 0 || rect.size.height == 0) continue;
                
                UIView *cover = [[UIView alloc] init];
                cover.backgroundColor = [UIColor greenColor];
                cover.frame = rect;
                cover.tag = ZLStatusTextViewCoverTag;
                cover.layer.cornerRadius = 5;
                [self insertSubview:cover atIndex:0];
            }
            
            break;
        }
    }
    
    // 在被触摸的特殊字符串后面显示一段高亮的背景
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 触摸对象
        UITouch *touch = [touches anyObject];
        
        // 触摸点
        CGPoint point = [touch locationInView:self];
        
        NSArray *specials = [self.attributedText attribute:@"specials" atIndex:0 effectiveRange:NULL];
        BOOL contains = NO;
        
        for (ZLSpecial *special in specials) {
            self.selectedRange = special.range;
            // self.selectedRange --影响--> self.selectedTextRange
            // 获得选中范围的矩形框
            NSArray *rects = [self selectionRectsForRange:self.selectedTextRange];
            // 清空选中范围
            self.selectedRange = NSMakeRange(0, 0);
            
            for (UITextSelectionRect *selectionRect in rects) {
                CGRect rect = selectionRect.rect;
                if (rect.size.width == 0 || rect.size.height == 0) continue;
                
                if (CGRectContainsPoint(rect, point)) { // 点中了某个特殊字符串
                    contains = YES;
                    break;
                }
            }
            
            if (contains) {
                for (UITextSelectionRect *selectionRect in rects) {
                    CGRect rect = selectionRect.rect;
                    if (rect.size.width == 0 || rect.size.height == 0) continue;
                    
                    if (special.urlString) {
                        NSString *urlStr = special.urlString;
                        NSURL *url =[NSURL URLWithString:urlStr];
                        if (url.scheme) {
                            [[UIApplication sharedApplication]openURL:url];
                        }else{
                            NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",special.text];
                            UIWebView *callWebview = [[UIWebView alloc] init];
                            [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
                            [self addSubview:callWebview];
                    }
                    }
                }
                
                break;
            }
        }

        [self touchesCancelled:touches withEvent:event];
    });
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 去掉特殊字符串后面的高亮背景
    for (UIView *child in self.subviews) {
        if (child.tag == ZLStatusTextViewCoverTag) [child removeFromSuperview];
    }
}
-(void)setZlFrame:(ZLFrame *)zlFrame{
    _zlFrame = zlFrame;
    self.attributedText = zlFrame.status.attributedText;
    self.frame = zlFrame.contentLabelF;
    
    
}
-(void)setMaxLine:(int)maxLine{
    _maxLine = maxLine;
    [self.zlFrame setMaxNumLine:maxLine];
    if (self.zlFrame.maxNumLabelF.size.height > self.zlFrame.contentLabelF.size.height) {
        self.frame = self.zlFrame.contentLabelF;
    }else{
        self.frame = self.zlFrame.maxNumLabelF;
    }
    
}
-(void)setIsShowAll:(BOOL)isShowAll{
    _isShowAll = isShowAll;
    if (isShowAll) {
        self.frame = self.zlFrame.contentLabelF;

    }else{
        [self setMaxLine:self.maxLine];
        
    }
}
@end
