# LXRegularTextview

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
