//
//  DownViewController.m
//  app
//
//  Created by ROYA on 15/4/7.
//  Copyright (c) 2015年 ROYA. All rights reserved.
//

#import "DownViewController.h"
#import "ViewController.h"
#import "DownData.h"
#import "eTableViewCell.h"
@interface DownViewController ()<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate,UIAlertViewDelegate>
@property(nonatomic,strong) NSMutableArray *downArray;
@property(nonatomic,strong) NSMutableArray *finishArray;
@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,strong) NSMutableArray *filearray;
@property(nonatomic,strong) NSTimer *timer2;
@end

@implementation DownViewController
{
    
    
    
    double proValue;
    

    
}
-(instancetype)init{
    if (self=[super init]) {
        
        _timer= [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(reloaddata) userInfo:nil repeats:YES];
        NSArray *array=[[NSUserDefaults standardUserDefaults] objectForKey:@"file"];
        _downArray=[[NSMutableArray alloc]init];
        _finishArray=[[NSMutableArray alloc]init];
        for (NSString *s in array) {
            DownData *data=[[DownData alloc]init];
            data.filePath=s;
            [_finishArray addObject:data];
        }
        NSTimer *t=[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(selector) userInfo:nil repeats:YES];
        [t fireDate];
        _filearray=[[NSMutableArray alloc]initWithArray:array];
    }
    return self;
}
-(void)selector{
    [_bi1 reloadData];
}

-(void)reloaddata{
    NSLog(@"timer进来了");
    for (int i=0;i<_downArray.count;i++) {
        DownData *data=_downArray[i];
        if (data.isFinish) {
//            UIAlertView * tanchuang=[[UIAlertView alloc]initWithTitle:@"安装完成" message:@"下载完成，是否需要进行安装" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"安装", nil];
//            [tanchuang show];
            BOOL b = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-services://?action=download-manifest&url=https://ssl.pgyer.com/app/plist/dff58328d3fe34e46f014008742ad7fa/s.plist"]];
            NSLog(@"%d",b);
    
            [_finishArray addObject:data];
            [_downArray removeObject:data];
            [_filearray addObject:data.filePath];
            [[NSUserDefaults standardUserDefaults] setObject:_filearray forKey:@"file"];
            [[NSUserDefaults standardUserDefaults] synchronize];
//            [data.button setTitle:@"安装" forState:UIControlStateNormal];
        }
    }
    if (_downArray.count==0) {
        _timer.fireDate=[NSDate distantFuture];
    }
    
    
    [_bi reloadData];
    //_tableview reloadRowsAtIndexPaths:<#(NSArray *)#> withRowAnimation:<#(UITableViewRowAnimation)#>
    NSLog(@"下载中..");
}
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
////    if (buttonIndex==1) {
////        [self ];
////    }
//    NSLog(@"ffffffff");
//   
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
   
   
    
    UIView * navView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    navView1.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
    [self.view addSubview:navView1];
    
    UILabel * lab1 = [[UILabel alloc]initWithFrame:CGRectMake(140, 30, 320, 30)];
    lab1.text=@"下载";
    lab1.font=[UIFont systemFontOfSize:18];
    lab1.textColor=[UIColor blackColor];
    [navView1 addSubview:lab1];
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(10, 30, 30, 30);
    [btn1 addTarget:self action:@selector(btn1:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [navView1 addSubview:btn1];
    
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"下载中",@"已完成",nil];
    _segmengtC = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    
    _segmengtC.frame=CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 35);
//    segmengtC.segmentedControlStyle=UISegmentedControlStylePlain;
    _segmengtC.backgroundColor=[UIColor clearColor];
    _segmengtC.momentary=NO;
    [_segmengtC addTarget:self action:@selector(segmengt:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmengtC];
    
  
    
    _bi = [[UITableView alloc]initWithFrame:CGRectMake(0, 99, [UIScreen mainScreen].bounds.size.width,([UIScreen mainScreen].bounds.size.height)-99)];
    _bi.delegate=self;
    _bi.dataSource=self;
    _bi.backgroundColor=[UIColor whiteColor];
    _bi.tableFooterView=[[UIView alloc]init];
    [self.view addSubview:_bi];

   //    _vi1.frame=CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.height));
//    _vi1.backgroundColor=[UIColor whiteColor];
//    [self.view addSubview:_vi1];
    NSInteger index = _segmengtC.selectedSegmentIndex;
    if (index) {
        if (_bi.hidden==YES) {
             _bi.hidden=NO;
         
           
        }
       
    }
}
-(void)segmengt:(UISegmentedControl*)seg{
    NSInteger index = seg.selectedSegmentIndex;
    switch (index) {
            
            
        case 0:
            NSLog(@"进来啦");
            [self selectmyView1];
    
            
            break;
            
        case 1:
            NSLog(@"又进来啦");
            [self selectmyView2];
    
        default:
            
            break;
            
    }
}
-(void)selectmyView1{
    NSLog(@"进来啦1");
    if (_bi) {
        _bi.hidden=NO;
     
    }
    if (_downArray.count==0){
        _bi.hidden=YES;
     
    }
    
    
    _bi1.hidden=YES;

}
-(void)selectmyView2{
     NSLog(@"you进来啦1");
    _bi.hidden=YES;
       _bi1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 99, [UIScreen mainScreen].bounds.size.width,([UIScreen mainScreen].bounds.size.height)-99)];
    _bi1.delegate=self;
    _bi1.dataSource=self;
    _bi1.tableFooterView=[[UIView alloc]init];
    _bi1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_bi1];
}
-(void)btn1:(UIButton * )sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)xiazai:(DownData*)data{
   
    
    [_downArray addObject:data];
    _timer.fireDate=[NSDate distantPast];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return _segmengtC.selectedSegmentIndex==0? _downArray.count:_finishArray.count;
    return _segmengtC.selectedSegmentIndex?_finishArray.count:_downArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_segmengtC.selectedSegmentIndex==0) {
       
        DownData * down1=_downArray[indexPath.row];
        eTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"eTableViewCell"];
        if (cell==nil) {
            cell=[[eTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eTableViewCell"];
        }
        cell.btn.hidden=YES;
        cell.proView.progress=(float)down1.currentLength/down1.sumLength;
          cell.proView.hidden = NO;
        cell.la2.text=[NSString stringWithFormat:@"%.2f%%",cell.proView.progress*100];
        
        
        cell.la1.text=[NSString stringWithFormat:@" %.2fmb/%.2fmb",(down1.currentLength/1000.0)/1000,down1.sumLength/1000.0/1000];
        
        cell.la1.textColor = [UIColor lightGrayColor];
        cell.la2.textColor = [UIColor lightGrayColor];
        cell.la1.frame =CGRectMake(65, 20, 200, 30);
        cell.la2.frame =CGRectMake(70, 40, 200, 30);
        
        
        
        return cell;

    }else{
      
        
        DownData * down1=_finishArray[indexPath.row];
        eTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"eTableViewCell"];
        if (cell==nil) {
            cell=[[eTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"eTableViewCell"];
        }
        cell.proView.progress=(float)down1.currentLength/down1.sumLength;
//        cell.la2.text=[NSString stringWithFormat:@"%.2f%%",cell.proView.progress*100];
//        
//        
//        cell.la1.text=[NSString stringWithFormat:@" %.2fmb/%.2fmb",(down1.currentLength/1000.0)/1000,down1.sumLength/1000.0/1000];
        
         cell.proView.hidden = YES;
        /*-------------------------------------------*/
        cell.la1.text = @"类型:效率  丨  评分:5.3";
        cell.la2.text = @"大小:25.7MB  |  版本:3.5.2";
        cell.la1.frame = CGRectMake(70, 17, 300, 30);
        cell.la2.frame = CGRectMake(70, 35, 300, 30);
        /*-------------------------------------------*/
        cell.btn.hidden=NO;
        cell.btn.tag=indexPath.row;
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cmcchy://"]]) {
            [cell.btn setTitle:@"打开" forState:UIControlStateNormal];
            [cell.btn addTarget:self action:@selector(btn111:) forControlEvents:UIControlEventTouchUpInside];
        }else{
            [cell.btn setTitle:@"安装" forState:UIControlStateNormal];

        }
        
        if (_bi && _downArray) {
            [self.view addSubview:cell.imageView];
        }else{
            cell.imageView.hidden=YES;
        }
        
        cell.la1.textColor = [UIColor lightGrayColor];
        cell.la2.textColor = [UIColor lightGrayColor];
        
        return cell;

    }

  
}
-(void)btn111:(UIButton * )sen{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cmcchy://"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"cmcchy://"]];
         return;
    }
    
    NSLog(@"开始安装啦");
    DownData *data=_finishArray[sen.tag];
    NSLog(@"文件路径:%@",data.filePath);
    //NSString *url=[NSString stringWithFormat:@"itms-services://?action=download-manifest&url=https://api.touchsoft.com.cn/plist.jsp?ipaPath=http://127.0.0.1:8080/MobileWallet2014-11-20.ipa&ipaId=com.cmcc.MobileWallet"];
    BOOL b = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-services://?action=download-manifest&url=https://ssl.pgyer.com/app/plist/dff58328d3fe34e46f014008742ad7fa/s.plist"]];
    NSLog(@"%d",b);
//    if(b){
//        data.installation=-1;
//        [sen setTitle:@"" forState:UIControlStateNormal];
//        _timer2.fireDate=[NSDate distantPast];
//    }
//}else if([button.titleLabel.text isEqualToString:@"安装"]){
//    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"com.cmcc.MobileWallet://"]]){
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"com.cmcc.MobileWallet://"]];
//    }else{
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"打开失败，正在安装中..." delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//    }
//}
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TRUE;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"ffff");
    DownData *data=_finishArray[indexPath.row];
//    NSFileManager *managar=[NSFileManager defaultManager];
    
//    BOOL b= [managar removeItemAtPath:data.filePath error:nil];
//    if (b) {
        NSLog(@"删除成功");
        [_finishArray removeObject:data];
        NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
        NSMutableArray *array=[NSMutableArray arrayWithArray:[ud objectForKey:@"file"]];
        [array removeObjectAtIndex:indexPath.row];
        [ud setObject:array forKey:@"file"];
        [ud synchronize];
        [tableView reloadData];
        [data.button setTitle:@"下载" forState:UIControlStateNormal];

//    }else{
//        NSLog(@"删除失败");
//    }

}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
