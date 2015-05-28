//
//  DetailViewController.m
//  app
//
//  Created by ROYA on 15/4/7.
//  Copyright (c) 2015年 ROYA. All rights reserved.
//

#import "DetailViewController.h"
#import "DownViewController.h"
#import "DownData.h"

@interface DetailViewController ()<UIScrollViewDelegate>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"型号是 = %@",[UIDevice currentDevice].model);
    NSLog(@"名字是 = %@",[UIDevice currentDevice].name);
    NSLog(@"分辨率是 = %@",[UIScreen mainScreen]);
    //判断是否是iPhone6以上型号
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"是");
    }else{
        NSLog(@"否");
    }
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    _myscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _myscrollview.backgroundColor = [UIColor whiteColor];
    _myscrollview.scrollEnabled = YES;
    _myscrollview.delegate = self;
    _myscrollview.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,( [UIScreen mainScreen].bounds.size.height)+200*2+25);
    [self.view addSubview:_myscrollview];
    
   
    
    
    
    _navView2 = [[UIView alloc]initWithFrame:CGRectMake(0, ([UIScreen mainScreen].bounds.size.height)-60, [UIScreen mainScreen].bounds.size.width, 60)];
    _navView2.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
    [self.view addSubview:_navView2];
    
    
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor colorWithRed:77.0/255.0 green:190/255.0 blue:74/255.0 alpha:1.0];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        btn.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/4-5, 10, 200, 40);
    }else{
        btn.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/4-20, 10, 200, 40);
    }
    
    btn.layer.cornerRadius=5.0;
    [btn addTarget:self action:@selector(downlod:) forControlEvents:UIControlEventTouchUpInside];
    [_navView2 addSubview:btn];
    

    
    
    
    
    UILabel * lat9 = [[UILabel alloc]initWithFrame:CGRectMake(75, -5, 100, 50)];
    lat9.text=@"下   载";
    lat9.textColor=[UIColor whiteColor];
    lat9.font=[UIFont systemFontOfSize:18];
    [btn addSubview:lat9];
    
    //新的
    _myscrollview2 = [[UIScrollView alloc]init];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
            NSLog(@"6");
            _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 310+120);
            _myscrollview2.pagingEnabled = YES;
            _myscrollview2.delegate = self;
            _myscrollview2.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*5, 310+120);
            _myscrollview2.showsHorizontalScrollIndicator = NO;
            float _x = 0;
            for (int i = 1; i<=5; i++)
            {
                _imageView = [[UIImageView alloc]init];
                _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, 310+120);
                NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
                _imageView.image = [UIImage imageNamed:imageName];
                [_myscrollview2 addSubview:_imageView];
                _x+=255+120;
            }
            //点的信息
            _pagControl = [[UIPageControl alloc]initWithFrame:CGRectMake(30, [UIScreen mainScreen].bounds.size.height-50, 320, 30)];
            _pagControl.numberOfPages = 5;
            //设置点颜色
            //pagControl.pageIndicatorTintColor = [UIColor orangeColor];
            _pagControl.tag = 101;
            _pagControl.hidden = YES;
            [self.view addSubview:_pagControl];
            
        }else{
            NSLog(@"6puls");
            _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 310+120);
            _myscrollview2.pagingEnabled = YES;
            _myscrollview2.delegate = self;
            _myscrollview2.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*5, 310+120);
            _myscrollview2.showsHorizontalScrollIndicator = NO;
            float _x = 0;
            for (int i = 1; i<=5; i++)
            {
                _imageView = [[UIImageView alloc]init];
                _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, 310+120);
                NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
                _imageView.image = [UIImage imageNamed:imageName];
                [_myscrollview2 addSubview:_imageView];
                _x+=294+120;
            }
            
            //点的信息
            _pagControl = [[UIPageControl alloc]initWithFrame:CGRectMake(50, [UIScreen mainScreen].bounds.size.height-50, 320, 30)];
            _pagControl.numberOfPages = 5;
            //设置点颜色
            //pagControl.pageIndicatorTintColor = [UIColor orangeColor];
            _pagControl.tag = 101;
            _pagControl.hidden = YES;
            [self.view addSubview:_pagControl];
        }
    }else{
        _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 310);
        _myscrollview2.pagingEnabled = YES;
        _myscrollview2.delegate = self;
        
        _myscrollview2.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*5, 310);
        _myscrollview2.showsHorizontalScrollIndicator = NO;
        float _x = 0;
        for (int i = 1; i<=5; i++)
        {
            _imageView = [[UIImageView alloc]init];
            _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, 310);
            NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
            _imageView.image = [UIImage imageNamed:imageName];
            [_myscrollview2 addSubview:_imageView];
            _x+=320;
        }

        
        
        //点的信息
        _pagControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, 320, 30)];
        _pagControl.numberOfPages = 5;
        //设置点颜色
        //pagControl.pageIndicatorTintColor = [UIColor orangeColor];
        _pagControl.tag = 101;
        _pagControl.hidden = YES;
        [self.view addSubview:_pagControl];
    }
    
    [_myscrollview addSubview:_myscrollview2];
    /*
    _image1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"11.jpg"]];
   
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
         _image1.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 310+120);
        }else{
        NSLog(@"iPhone6以下");
        _image1.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 310);
        }
    
    [_myscrollview addSubview:_image1];
    */
    
    
    _myscrollview1 = [[UIScrollView alloc] init];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        _myscrollview1.frame = CGRectMake(0, 270+120, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }else{
        NSLog(@"iPhone6以下");
        _myscrollview1.frame = CGRectMake(0, 270, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
    _myscrollview1.backgroundColor = [UIColor clearColor];
    _myscrollview1.scrollEnabled = YES;
    _myscrollview1.delegate = self;
    _myscrollview1.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    
    [_myscrollview addSubview:_myscrollview1];
    
    UIView * vi1 = [[UIView alloc]initWithFrame:CGRectMake(30, 15, 80, 80)];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        vi1.frame = CGRectMake(30, 15, 80+20, 80+20);
    }else{
        NSLog(@"iPhone6以下");
        vi1.frame = CGRectMake(30, 15, 80, 80);
    }
    vi1.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
    vi1.layer.cornerRadius=10.0;
    [_myscrollview1 addSubview:vi1];
    
    UILabel * lat = [[UILabel alloc]init];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        lat.frame = CGRectMake(130+20,  43+10, 100, 50);
        lat.font=[UIFont systemFontOfSize:32];
    }else{
        NSLog(@"iPhone6以下");
        lat.frame = CGRectMake(130,  43, 100, 50);
        lat.font=[UIFont systemFontOfSize:22];
    }
    lat.text=@"时间轴";
    [_myscrollview1 addSubview:lat];
    
    
    UIImageView * image4 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sstar.png"]];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        image4.frame=CGRectMake(122+20, 81+15, 70+10, 20);
    }else{
        NSLog(@"iPhone6以下");
        image4.frame=CGRectMake(122, 81, 70, 20);
    }
    [_myscrollview1 addSubview:image4];
    
    UILabel * lat1 = [[UILabel alloc]init];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        lat1.frame=CGRectMake(130+20, 90+15, 300, 50);
    }else{
        NSLog(@"iPhone6以下");
        lat1.frame=CGRectMake(130, 90, 300, 50);
    }
    lat1.text=@"版本:2.69.2   大小:1.2M";
    lat1.textColor=[UIColor lightGrayColor];
    [_myscrollview1 addSubview:lat1];
    
    
    UIView * v1 = [[UIView alloc]init];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        v1.frame = CGRectMake(20, 130+25, [UIScreen mainScreen].bounds.size.width, 1);
    }else{
        NSLog(@"iPhone6以下");
        v1.frame = CGRectMake(20, 130, [UIScreen mainScreen].bounds.size.width, 1);
    }
    v1.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
    [_myscrollview1 addSubview:v1];
    
    UILabel * lat2 = [[UILabel alloc]init];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        lat2.frame = CGRectMake(30,  130+25, 100, 50);
    }else{
        NSLog(@"iPhone6以下");
        lat2.frame = CGRectMake(30,  130, 100, 50);
    }
    lat2.text=@"应用介绍";
    lat2.font=[UIFont systemFontOfSize:22];
    [_myscrollview1 addSubview:lat2];
    
   
   
    
    UITextView * text = [[UITextView alloc]initWithFrame:CGRectMake(5, 180, [UIScreen mainScreen].bounds.size.width-5, 120)];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        text.frame = CGRectMake(25, 180+25, [UIScreen mainScreen].bounds.size.width-30, 120);
    }else{
        NSLog(@"iPhone6以下");
        text.frame = CGRectMake(25, 180, [UIScreen mainScreen].bounds.size.width-30, 120);
    }
    
    
    text.text=@"做一个时间轴有很多理由。你可能希望创建一个关于如何展开项目和运作公司的时序图，追踪家族史，或者记录你职业生涯的进步轨迹。但不管是什么原因，你都需要一个合适的工具来让这个时间轴易于使用。你不能只是用一个电子表格或者文本文档来创建一个有用的互动工具。相反，你需要合适的软件来完成这项工作。Timeglider是一个提供免费和付费账户的网站。";
    text.font=[UIFont systemFontOfSize:19];
    [_myscrollview1 addSubview:text];
    
    UILabel*content = [[UILabel alloc] init];
   // UILabel*describe = [[UILabel alloc]init];
//    UITextView * describe = [[UITextView alloc]initWithFrame:CGRectMake(5, 180, [UIScreen mainScreen].bounds.size.width-5, 120)];
    
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        content.frame = CGRectMake(30,  330, 100, 50);
        content.text = @"信息";
        content.font=[UIFont systemFontOfSize:22];
        [_myscrollview1 addSubview:content];
        
        _label1 = [[UILabel alloc]init];
        _label2 = [[UILabel alloc]init];
        _label3 = [[UILabel alloc]init];
        _label4 = [[UILabel alloc]init];
        _label5 = [[UILabel alloc]init];
        _label6 = [[UILabel alloc]init];
        _label7 = [[UILabel alloc]init];
        
        _la1 = [[UILabel alloc] init];
        _la2 = [[UILabel alloc] init];
        _la3 = [[UILabel alloc] init];
        _la4 = [[UILabel alloc] init];
        _la5 = [[UILabel alloc] init];
        _la6 = [[UILabel alloc] init];
        _la7 = [[UILabel alloc] init];
        
        _label1.frame = CGRectMake(30, 360, 80, 50);
        _label2.frame = CGRectMake(30, 400, 80, 50);
        _label3.frame = CGRectMake(30, 440, 80, 50);
        _label4.frame = CGRectMake(30, 480, 80, 50);
        _label5.frame = CGRectMake(30, 520, 80, 50);
        _label6.frame = CGRectMake(30, 560, 80, 50);
        _label7.frame = CGRectMake(30, 600, 80, 50);
        
        _la1.frame = CGRectMake(110, 360, 80, 50);
        _la2.frame = CGRectMake(100, 400, 80, 50);
        _la3.frame = CGRectMake(80, 440, 80, 50);
        _la4.frame = CGRectMake(80, 480, 80, 50);
        _la5.frame = CGRectMake(80, 520, 80, 50);
        _la6.frame = CGRectMake(100, 560, 380, 50);
        _la7.frame = CGRectMake(80, 600, 80, 50);
        
        _label1.text = @"APP数量 : ";
        _label2.text = @"开发商 : ";
        _label3.text = @"类别 : ";
        _label4.text = @"大小 : ";
        _label5.text = @"评级 : ";
        _label6.text = @"兼容性 : ";
        _label7.text = @"语言 : ";
        
        _la1.text = @"6";
        _la2.text = @"Microso";
        _la3.text = @"效率";
        _la4.text = @"32.21MB";
        _la5.text = @"限4岁以上";
        _la6.text = @"需要IOS8.0或者更高版本。";
        _la7.text = @"中文";
        
        _label1.textColor = [UIColor lightGrayColor];
        _label2.textColor = [UIColor lightGrayColor];
        _label3.textColor = [UIColor lightGrayColor];
        _label4.textColor = [UIColor lightGrayColor];
        _label5.textColor = [UIColor lightGrayColor];
        _label6.textColor = [UIColor lightGrayColor];
        _label7.textColor = [UIColor lightGrayColor];
        
        [_myscrollview1 addSubview:_label1];
        [_myscrollview1 addSubview:_label2];
        [_myscrollview1 addSubview:_label3];
        [_myscrollview1 addSubview:_label4];
        [_myscrollview1 addSubview:_label5];
        [_myscrollview1 addSubview:_label6];
        [_myscrollview1 addSubview:_label7];
        
        [_myscrollview1 addSubview:_la1];
        [_myscrollview1 addSubview:_la2];
        [_myscrollview1 addSubview:_la3];
        [_myscrollview1 addSubview:_la4];
        [_myscrollview1 addSubview:_la5];
        [_myscrollview1 addSubview:_la6];
        [_myscrollview1 addSubview:_la7];

        
        
    }else{
        NSLog(@"iPhone6以下");
        content.frame = CGRectMake(30,  300, 100, 50);
        content.text = @"信息";
        content.font=[UIFont systemFontOfSize:22];
        [_myscrollview1 addSubview:content];
        
        _label1 = [[UILabel alloc]init];
        _label2 = [[UILabel alloc]init];
        _label3 = [[UILabel alloc]init];
        _label4 = [[UILabel alloc]init];
        _label5 = [[UILabel alloc]init];
        _label6 = [[UILabel alloc]init];
        _label7 = [[UILabel alloc]init];
        
        _la1 = [[UILabel alloc] init];
        _la2 = [[UILabel alloc] init];
        _la3 = [[UILabel alloc] init];
        _la4 = [[UILabel alloc] init];
        _la5 = [[UILabel alloc] init];
        _la6 = [[UILabel alloc] init];
        _la7 = [[UILabel alloc] init];
        
        _label1.frame = CGRectMake(30, 330, 80, 50);
        _label2.frame = CGRectMake(30, 360, 80, 50);
        _label3.frame = CGRectMake(30, 390, 80, 50);
        _label4.frame = CGRectMake(30, 420, 80, 50);
        _label5.frame = CGRectMake(30, 450, 80, 50);
        _label6.frame = CGRectMake(30, 480, 80, 50);
        _label7.frame = CGRectMake(30, 510, 80, 50);
        
        _la1.frame = CGRectMake(110, 330, 80, 50);
        _la2.frame = CGRectMake(100, 360, 80, 50);
        _la3.frame = CGRectMake(80, 390, 80, 50);
        _la4.frame = CGRectMake(80, 420, 80, 50);
        _la5.frame = CGRectMake(80, 450, 80, 50);
        _la6.frame = CGRectMake(100, 480, 380, 50);
        _la7.frame = CGRectMake(80, 510, 80, 50);
        
        _label1.text = @"APP数量 : ";
        _label2.text = @"开发商 : ";
        _label3.text = @"类别 : ";
        _label4.text = @"大小 : ";
        _label5.text = @"评级 : ";
        _label6.text = @"兼容性 : ";
        _label7.text = @"语言 : ";
        
        _la1.text = @"6";
        _la2.text = @"Microso";
        _la3.text = @"效率";
        _la4.text = @"32.21MB";
        _la5.text = @"限4岁以上";
        _la6.text = @"需要IOS8.0或者更高版本。";
        _la7.text = @"中文";
        
        _label1.textColor = [UIColor lightGrayColor];
        _label2.textColor = [UIColor lightGrayColor];
        _label3.textColor = [UIColor lightGrayColor];
        _label4.textColor = [UIColor lightGrayColor];
        _label5.textColor = [UIColor lightGrayColor];
        _label6.textColor = [UIColor lightGrayColor];
        _label7.textColor = [UIColor lightGrayColor];
        
        [_myscrollview1 addSubview:_label1];
        [_myscrollview1 addSubview:_label2];
        [_myscrollview1 addSubview:_label3];
        [_myscrollview1 addSubview:_label4];
//        [_myscrollview1 addSubview:_label5];
//        [_myscrollview1 addSubview:_label6];
//        [_myscrollview1 addSubview:_label7];
        
        [_myscrollview1 addSubview:_la1];
        [_myscrollview1 addSubview:_la2];
        [_myscrollview1 addSubview:_la3];
        [_myscrollview1 addSubview:_la4];
//        [_myscrollview1 addSubview:_la5];
//        [_myscrollview1 addSubview:_la6];
//        [_myscrollview1 addSubview:_la7];
        
    }
    
    
    
    
    UIView * v2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
    v2.backgroundColor = [UIColor clearColor];
    [text addSubview:v2];
    
    
    UIImageView * image3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3.png"]];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iPhone6以上");
        image3.frame=CGRectMake(5, 5, 70+20, 70+20);
    }else{
        NSLog(@"iPhone6以下");
        image3.frame=CGRectMake(5, 5, 70, 70);
    }
    
//    image3.backgroundColor = [UIColor blueColor];
    [vi1 addSubview:image3];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake(15, 30, 40, 40);
    [btn2 addTarget:self action:@selector(btn2:) forControlEvents:UIControlEventTouchUpInside];
    btn2.backgroundColor=[UIColor blackColor];
    btn2.alpha = 0.4;
    btn2.layer.cornerRadius=20.0;
    [_myscrollview addSubview:btn2];
    
    UIImageView * image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"22.png"]];
    image.frame=CGRectMake(-5, -5, 50, 50);
    [btn2 addSubview:image];
    
 
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isMemberOfClass:[UITableView class]])
    {
    }
    else
    {
        int current = scrollView.contentOffset.x/320;
        UIPageControl*pageControl = (UIPageControl*)[self.view viewWithTag:101];
        pageControl.currentPage = current;
        
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
   // scrollView.contentOffset.y; // 获取纵向滑动的距离
    NSLog(@"获取纵向滑动的距离:%f",scrollView.contentOffset.y);
  //  scrollView.contentOffset.x; //获取横向滑动的距离
    int currentPostion = _myscrollview.contentOffset.y;
    
    if (currentPostion  < -100) {
        NSLog(@"消失消失消失吧！！");
         _navView2.hidden = YES;
        _pagControl.hidden = NO;
        
        if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
            NSLog(@"iPhone6以上");
            //详情消失
//            _myscrollview1.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//            //_myscrollview2下拉
//            _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//            //_myscrollview2里的图片
//            float _x = 0;
//            for (int i = 1; i<=5; i++)
//            {
//                _imageView = [[UIImageView alloc]init];
//                _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//                NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
//                _imageView.image = [UIImage imageNamed:imageName];
//                [_myscrollview2 addSubview:_imageView];
//                _x+=320;
//            }
            if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
                NSLog(@"6");
                _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                _myscrollview2.pagingEnabled = YES;
                _myscrollview2.delegate = self;
                _myscrollview2.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*5, [UIScreen mainScreen].bounds.size.height);
                _myscrollview2.showsHorizontalScrollIndicator = NO;
                float _x = 0;
                for (int i = 1; i<=5; i++)
                {
                    _imageView = [[UIImageView alloc]init];
                    _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                    NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
                    _imageView.image = [UIImage imageNamed:imageName];
                    [_myscrollview2 addSubview:_imageView];
                    _x+=255+120;
                }
                _myscrollview1.frame = CGRectMake([UIScreen mainScreen].bounds.size.height, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                
            }else{
                NSLog(@"6puls");
                _myscrollview1.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                _myscrollview2.pagingEnabled = YES;
                _myscrollview2.delegate = self;
                _myscrollview2.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*5, [UIScreen mainScreen].bounds.size.height);
                _myscrollview2.showsHorizontalScrollIndicator = NO;
                float _x = 0;
                for (int i = 1; i<=5; i++)
                {
                    _imageView = [[UIImageView alloc]init];
                    _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                    NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
                    _imageView.image = [UIImage imageNamed:imageName];
                    [_myscrollview2 addSubview:_imageView];
                    _x+=294+120;
                }
            }
            
            
        }else{
            NSLog(@"iPhone6以下");
            _myscrollview1.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            //_myscrollview2
            _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            //_myscrollview2里的图片
            float _x = 0;
            for (int i = 1; i<=5; i++)
            {
                _imageView = [[UIImageView alloc]init];
                _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
                _imageView.image = [UIImage imageNamed:imageName];
                [_myscrollview2 addSubview:_imageView];
                _x+=320;
            }
            
        }
        
        
        
        
    }else if(currentPostion  > 10){
        _pagControl.hidden = YES;
        _navView2.hidden = NO;
        if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
            NSLog(@"iPhone6以上");
            if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
                NSLog(@"6");
                _myscrollview1.frame = CGRectMake(0, 270+120, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 310+120);
                _myscrollview2.pagingEnabled = YES;
                _myscrollview2.delegate = self;
                _myscrollview2.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*5, 310+120);
                _myscrollview2.showsHorizontalScrollIndicator = NO;
                float _x = 0;
                for (int i = 1; i<=5; i++)
                {
                    _imageView = [[UIImageView alloc]init];
                    _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, 310+120);
                    NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
                    _imageView.image = [UIImage imageNamed:imageName];
                    [_myscrollview2 addSubview:_imageView];
                    _x+=255+120;
                }
                
                
                
            }else{
                NSLog(@"6puls");
                _myscrollview1.frame = CGRectMake(0, 270+120, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 310+120);
                _myscrollview2.pagingEnabled = YES;
                _myscrollview2.delegate = self;
                _myscrollview2.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*5, 310+120);
                _myscrollview2.showsHorizontalScrollIndicator = NO;
                float _x = 0;
                for (int i = 1; i<=5; i++)
                {
                    _imageView = [[UIImageView alloc]init];
                    _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, 310+120);
                    NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
                    _imageView.image = [UIImage imageNamed:imageName];
                    [_myscrollview2 addSubview:_imageView];
                    _x+=294+120;
                }
            }
            
        }else{
            NSLog(@"iPhone6以下");
            _myscrollview1.frame = CGRectMake(0, 270, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            
            _myscrollview2.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 310);
            //_myscrollview2里的图片
            float _x = 0;
            for (int i = 1; i<=5; i++)
            {
                _imageView = [[UIImageView alloc]init];
                _imageView.frame = CGRectMake(0+_x, 20, [UIScreen mainScreen].bounds.size.width, 310);
                NSString*imageName = [NSString stringWithFormat:@"60-%d.jpg",i];
                _imageView.image = [UIImage imageNamed:imageName];
                [_myscrollview2 addSubview:_imageView];
                _x+=320;
            }
            
        }
        
    }
}


-(void)downlod:(UIButton * )sender1{
    NSLog(@"下载啦");

    DownViewController * er = [[DownViewController alloc]init];
    DownData *data=[[DownData alloc]initAndDownload];
    [er xiazai:data];
    [self presentViewController:er animated:YES completion:^{
        er.segmengtC.selectedSegmentIndex=0;
        

        
    }];
    
    
}
-(void)btn2:(UIButton * )sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
