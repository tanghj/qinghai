//
//  ViewController.m
//  app
//
//  Created by ROYA on 15/4/7.
//  Copyright (c) 2015年 ROYA. All rights reserved.
//

#import "ViewController.h"
#import "DownViewController.h"
#import "DownData.h"
#import "DetailViewController.h"
#import "MainViewController.h"
@interface ViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
@property (copy, nonatomic) UIImage *image;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *dec;
@property (copy, nonatomic) NSString *loc;
@property(nonatomic,strong)UITableView * tableView;

@end

@implementation ViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_seachBar resignFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
        NSLog(@"iphone6或plus");
        if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
            NSLog(@"6");
            UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
            navView.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
            [self.view addSubview:navView];
            
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(160, 30, 320, 30)];
            lab.text=@"应用中心";
            lab.font=[UIFont systemFontOfSize:18];
            lab.textColor=[UIColor blackColor];
            [navView addSubview:lab];
            
            UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
            btn1.frame=CGRectMake(10, 20, 50, 50);
            [btn1 addTarget:self action:@selector(btn1:) forControlEvents:UIControlEventTouchUpInside];
            [btn1 setTitle:@"返回" forState:UIControlStateNormal];
            [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [navView addSubview:btn1];
            
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame=CGRectMake(340, 35, 20, 20);
            [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
            [btn setImage:[UIImage imageNamed:@"list.png"] forState:UIControlStateNormal];
            [navView addSubview:btn];

        }else{
            NSLog(@"6puls");
            UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
            navView.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
            [self.view addSubview:navView];
            
            UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(180, 30, 320, 30)];
            lab.text=@"应用中心";
            lab.font=[UIFont systemFontOfSize:18];
            lab.textColor=[UIColor blackColor];
            [navView addSubview:lab];
            
            UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
            btn1.frame=CGRectMake(10, 20, 50, 50);
            [btn1 addTarget:self action:@selector(btn1:) forControlEvents:UIControlEventTouchUpInside];
            [btn1 setTitle:@"返回" forState:UIControlStateNormal];
            [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [navView addSubview:btn1];
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame=CGRectMake(370, 35, 20, 20);
            [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
            [btn setImage:[UIImage imageNamed:@"list.png"] forState:UIControlStateNormal];
            [navView addSubview:btn];
        }
           }else{
        NSLog(@"iphone4、4s、5、5s");
        UIView * navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
        navView.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
        [self.view addSubview:navView];
        
        UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(130, 30, 320, 30)];
        lab.text=@"应用中心";
        lab.font=[UIFont systemFontOfSize:18];
        lab.textColor=[UIColor blackColor];
        [navView addSubview:lab];
        
               UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
               btn1.frame=CGRectMake(10, 20, 50, 50);
               [btn1 addTarget:self action:@selector(btn1:) forControlEvents:UIControlEventTouchUpInside];
               [btn1 setTitle:@"返回" forState:UIControlStateNormal];
               [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
               [navView addSubview:btn1];
        
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(285, 35, 20, 20);
        [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"list.png"] forState:UIControlStateNormal];
        [navView addSubview:btn];
    }
 
    // Do any additional setup after loading the view, typically from a nib.
  
    
    

    _seachBar =[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64
                                                            , [UIScreen mainScreen].bounds.size.width, 44)];
    _seachBar.delegate=self;
    _seachBar.backgroundColor=[UIColor redColor];
    _seachBar.placeholder=@"搜索";
    _seachBar.keyboardType=UIKeyboardTypeDefault;
    [self.view addSubview:_seachBar];
    
    _tabelV = [[UITableView alloc]initWithFrame:CGRectMake(0, 108,  [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tabelV.delegate=self;
    _tabelV.dataSource=self;
    _tabelV.tableFooterView=[[UIView alloc]init];
    [self.view addSubview:_tabelV];
    
}
-(void)btn1:(UIButton*)sender1{
    NSLog(@"返回首页");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)btn:(UIButton * )sender{
    NSLog(@"进入下载页面");
    DownViewController * down = [[DownViewController alloc]init];
    [self presentViewController:down animated:YES completion:^{
        
    }];
    down.segmengtC.selectedSegmentIndex=1;
  
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    UILabel*la1 = [[UILabel alloc]init];
    la1.font = [UIFont systemFontOfSize:18];
   // [la1 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    UILabel*la2 = [[UILabel alloc]init];
    la2.font = [UIFont systemFontOfSize:14];
    la2.textColor = [UIColor lightGrayColor];
    UILabel*la3 = [[UILabel alloc]init];
    la3.font = [UIFont systemFontOfSize:14];
    la3.textColor = [UIColor lightGrayColor];
    [tableView addSubview:la1];
    //[tableView addSubview:la2];
    [tableView addSubview:la3];
    UIImageView*imageview = [[UIImageView alloc]init];
    [imageview setImage:[UIImage imageNamed:@"sstar.png"]];
    [tableView addSubview:imageview];
    UIButton*btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor clearColor];
    
    
    [btn.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    [btn.layer setBorderWidth:1.0]; //边框宽度
    
    [btn setTitle:@"下载" forState:UIControlStateNormal];
    [btn setTitle:@"取消" forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor colorWithRed:77.0/255.0 green:190.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:77.0/255.0 green:190.0/255.0 blue:74.0/255.0 alpha:1.0] forState:UIControlStateSelected];
    btn.layer.borderColor = [UIColor colorWithRed:77.0/255.0 green:190.0/255.0 blue:74.0/255.0 alpha:1.0].CGColor;
    
    [btn addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    [tableView addSubview:btn];
    switch (indexPath.row) {
        case 0:
            //cell.textLabel.text=@"QQ音乐";
            cell.imageView.image=[UIImage imageNamed:@"QQMusic.png"];
            /*-------------------------------------------*/
            la1.frame = CGRectMake(90, 0, 300, 30);
            la2.frame = CGRectMake(90, 19, 300, 30);
            la3.frame = CGRectMake(90, 35, 300, 30);
            imageview.frame = CGRectMake(78, 24, 100, 15);
            la1.text = @"QQ音乐";
            la2.text = @"类型:音乐  丨  评分:3.5";
            la3.text = @"大小:16.62MB  |  版本:5.1.9";
            la1.font = [UIFont systemFontOfSize:15];
            la3.font = [UIFont systemFontOfSize:10];
            if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
                NSLog(@"iphone6或plus");
                if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
                    NSLog(@"6");
                    btn.frame = CGRectMake(300, 15, 50, 25);
                    
                }else{
                    NSLog(@"6puls");
                    btn.frame = CGRectMake(330, 15, 50, 25);
                }
            }else{
                NSLog(@"iphone4、4s、5、5s");
                btn.frame = CGRectMake(250, 15, 50, 25);
            }
            
            /*-------------------------------------------*/
            break;
        case 1:
           // cell.textLabel.text=@"搜狐视频";
            cell.imageView.image=[UIImage imageNamed:@"souhuTV.png"];
            /*-------------------------------------------*/
            la1.frame = CGRectMake(90, 60, 300, 30);
            la2.frame = CGRectMake(90, 79, 300, 30);
            la3.frame = CGRectMake(90, 95, 300, 30);
            la1.font = [UIFont systemFontOfSize:15];
            la3.font = [UIFont systemFontOfSize:10];
            imageview.frame = CGRectMake(78, 87, 100, 15);
            la1.text = @"搜狐视频";
            la2.text = @"类型:娱乐  丨  评分:3.3";
            la3.text = @"大小:7.09MB  |  版本:3.1.6";
            
            if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
                NSLog(@"iphone6或plus");
                if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
                    NSLog(@"6");
                    btn.frame = CGRectMake(300, 75, 50, 25);
                    
                }else{
                    NSLog(@"6puls");
                    btn.frame = CGRectMake(330, 75, 50, 25);
                }
            }else{
                NSLog(@"iphone4、4s、5、5s");
                btn.frame = CGRectMake(250, 75, 50, 25);
            }
            /*-------------------------------------------*/
            
            break;
        case 2:
           // cell.textLabel.text=@"梦想小镇";
            cell.imageView.image=[UIImage imageNamed:@"sheepCity.png.png"];
            /*-------------------------------------------*/
            
            la1.frame = CGRectMake(90, 120, 300, 30);
            la2.frame = CGRectMake(90, 139, 300, 30);
            la3.frame = CGRectMake(90, 155, 300, 30);
            la1.font = [UIFont systemFontOfSize:15];
            la3.font = [UIFont systemFontOfSize:10];
            imageview.frame = CGRectMake(80, 145, 100, 15);
            la1.text = @"梦想小镇";
            la2.text = @"类型:模拟经营  丨  评分:4.3";
            la3.text = @"大小:96.37MB  |  版本:2.0.0";
            
            if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
                NSLog(@"iphone6或plus");
                if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
                    NSLog(@"6");
                    btn.frame = CGRectMake(300, 135, 50, 25);
                    
                }else{
                    NSLog(@"6puls");
                    btn.frame = CGRectMake(330, 135, 50, 25);
                }
            }else{
                NSLog(@"iphone4、4s、5、5s");
                btn.frame = CGRectMake(250, 135, 50, 25);
            }
            /*-------------------------------------------*/
            break;
        case 3:
          //  cell.textLabel.text=@"记事本";
            cell.imageView.image=[UIImage imageNamed:@"Note.png"];
            /*-------------------------------------------*/
            
            la1.frame = CGRectMake(90, 180, 300, 30);
            la2.frame = CGRectMake(90, 199, 300, 30);
            la3.frame = CGRectMake(90, 215, 300, 30);
            la1.font = [UIFont systemFontOfSize:15];
            la3.font = [UIFont systemFontOfSize:10];
            imageview.frame = CGRectMake(78, 208, 100, 15);
            la1.text = @"记事本";
            la2.text = @"类型:效率  丨  评分:5.2";
            la3.text = @"大小:31.28MB  |  版本:3.5.1";
            
            if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
                NSLog(@"iphone6或plus");
                if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
                    NSLog(@"6");
                    btn.frame = CGRectMake(300, 194, 50, 25);
                    
                }else{
                    NSLog(@"6puls");
                    btn.frame = CGRectMake(330, 194, 50, 25);
                }
            }else{
                NSLog(@"iphone4、4s、5、5s");
                btn.frame = CGRectMake(250, 194, 50, 25);
            }
            /*-------------------------------------------*/
            break;
        case 4:
          //  cell.textLabel.text=@"日历";
            cell.imageView.image=[UIImage imageNamed:@"1.png"];
            /*-------------------------------------------*/
            la1.frame = CGRectMake(90, 240, 300, 30);
            la2.frame = CGRectMake(90, 259, 300, 30);
            la3.frame = CGRectMake(90, 275, 300, 30);
            la1.font = [UIFont systemFontOfSize:15];
            la3.font = [UIFont systemFontOfSize:10];
            imageview.frame = CGRectMake(78, 265, 100, 15);
            la1.text = @"日历";
            la2.text = @"类型:生活  丨  评分:4.8";
            la3.text = @"大小:14.96MB  |  版本:1.9.0";
            btn.frame = CGRectMake(300, 255, 50, 25);
            if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
                NSLog(@"iphone6或plus");
                if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
                    NSLog(@"6");
                    btn.frame = CGRectMake(300, 255, 50, 25);
                    
                }else{
                    NSLog(@"6puls");
                    btn.frame = CGRectMake(330, 255, 50, 25);
                }
            }else{
                NSLog(@"iphone4、4s、5、5s");
                btn.frame = CGRectMake(250, 255, 50, 25);
            }
            /*-------------------------------------------*/
            break;
        case 5:
         //   cell.textLabel.text=@"CiYo";
            cell.imageView.image=[UIImage imageNamed:@"2.png"];
            /*-------------------------------------------*/
            la1.frame = CGRectMake(90, 300, 300, 30);
            la2.frame = CGRectMake(90, 319, 300, 30);
            la3.frame = CGRectMake(90, 335, 300, 30);
            la1.font = [UIFont systemFontOfSize:15];
            la3.font = [UIFont systemFontOfSize:10];
            imageview.frame = CGRectMake(75, 323, 100, 15);
            la1.text = @"CiYo";
            la2.text = @"类型:效率  丨  评分:3.8";
            la3.text = @"大小:17.87MB  |  版本:3.1.0";
            
            if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
                NSLog(@"iphone6或plus");
                if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
                    NSLog(@"6");
                    btn.frame = CGRectMake(300, 315, 50, 25);
                    
                }else{
                    NSLog(@"6puls");
                    btn.frame = CGRectMake(330, 315, 50, 25);
                }
            }else{
                NSLog(@"iphone4、4s、5、5s");
                btn.frame = CGRectMake(250, 315, 50, 25);
            }
            /*-------------------------------------------*/
            break;
//        case 6:
//            cell.textLabel.text=@"时间轴";
//            cell.imageView.image=[UIImage imageNamed:@"3.png"];
//            break;
//        case 7:
//            cell.textLabel.text=@"动物世界";
//            cell.imageView.image=[UIImage imageNamed:@"4.png"];
//            break;
//        case 8:
//            cell.textLabel.text=@"恐怖世界";
//            cell.imageView.image=[UIImage imageNamed:@"5.png"];
//            break;
 
        default:
            break;
    }
//    NSArray * ary = [NSArray arrayWithObject:cell.textLabel.text];
//    NSLog(@"-----------------------%@",ary);
    
    return cell;
    
}

-(void)download{
    NSLog(@"下载");
    DownViewController * er = [[DownViewController alloc]init];
    DownData *data=[[DownData alloc]initAndDownload];
    [er xiazai:data];
    [self presentViewController:er animated:YES completion:^{
        
    }];
    er.segmengtC.selectedSegmentIndex=0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tableView点击事件");
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //DetailViewController *d=[[DetailViewController alloc]init];
    DetailViewController * d = [[DetailViewController alloc]init];
    [self presentViewController:d animated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
