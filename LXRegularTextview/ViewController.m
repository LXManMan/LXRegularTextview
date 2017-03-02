//
//  ViewController.m
//  TestTexview
//
//  Created by zlwl001 on 2017/2/28.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "ZLStatusTextView.h"
//#define kTempText @"【史上最全签约秘笈，教你应对节后招聘[推荐]】过完年，求职大战又将打响，有些毕业生将面临签三方、落实合同、处理档案。提醒大家签约千万别大意！三方协议≠劳动合同？签三方要注意什么？哪些合同要慎签？档案如何处理？单位拒收怎么办？签了三方不想去怎么做？史上最全签约攻略↓↓转给毕业生！"
#define kTempText  @"简书：http://jianshu.com哈哈哈[调皮][流汗][偷笑][再见][可爱][色][害羞][委屈][委屈][抓狂][酷][酷][嘘][嘘][龇牙][大哭][大哭][大哭][龇牙][嘘][嘘][调皮][调皮]哈哈哈哈"
#define  KURlREGULAR @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(((http[s]{0,1}|ftp)://|)((?:(?:25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d)))\\.){3}(?:25[0-5]|2[0-4]\\d|((1\\d{2})|([1-9]?\\d))))(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
#define KPHONENUMBERREGLAR @"\\d{3}-\\d{8}|\\d{3}-\\d{7}|\\d{4}-\\d{8}|\\d{4}-\\d{7}|1+[3578]+\\d{9}|\\d{8}|\\d{7}"
#import "ZLStatus.h"
#import "ZLFrame.h"
#import "LxButton.h"
@interface ViewController ()<UITextViewDelegate>
@property(nonatomic,strong)ZLStatusTextView *textview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.textview =[[ZLStatusTextView alloc]initWithFrame:CGRectMake(20, 100, 250, 200)];
    ZLStatus *status = [[ZLStatus alloc]init];
    status.text = kTempText;
   
   
    ZLFrame *zlFrame =[[ZLFrame alloc]init];
    zlFrame.frameX = self.textview.frame.origin.x;
    zlFrame.frameY = self.textview.frame.origin.y;
    zlFrame.maxWidth = self.textview.frame.size.width;
    zlFrame.status = status;
    
    self.textview.zlFrame = zlFrame;
    //设置最大行数用于展开
    self.textview.maxLine = 3;
    self.textview.isShowAll = YES;
    [self.view addSubview:self.textview];
    self.textview.backgroundColor =[UIColor lightGrayColor];
   
  
    LxButton *button =[LxButton LXButtonWithTitle:@"限制最大行数" titleFont:[UIFont systemFontOfSize:15] Image:nil backgroundImage:nil backgroundColor:[UIColor brownColor] titleColor:[UIColor blueColor] frame:CGRectMake(20, 40, 150, 40)];
    
    [self.view addSubview:button];
    __weak ViewController *weakSelf = self;
    [button addClickBlock:^(UIButton *button) {
       
        weakSelf.textview.isShowAll =!weakSelf.textview.isShowAll;
    }];

}



@end
