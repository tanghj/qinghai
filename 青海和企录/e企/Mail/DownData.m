//
//  DownData.m
//  应用中心
//
//  Created by a on 15/3/31.
//  Copyright (c) 2015年 a. All rights reserved.
//

#import "DownData.h"

@implementation DownData

-(id)initAndDownload
{
    if (self=[super init]) {
        [self xiazai];
    }
    return self;
}

-(void)xiazai{
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.touchsoft.com.cn/MobileWallet2014-11-20.ipa"]];
    
    _connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //累加接收到的数据
    self.currentLength+=data.length;
    
    //计算当前进度(转换为double型的)
    double progress=(double)self.currentLength/self.sumLength;
    NSLog(@"当前下载进度%f%%",progress*100);
    
    
    //一点一点接收数据。
    // NSLog(@"接收到服务器的数据！---%lu",data.length);
    //把data写入到创建的空文件中，但是不能使用writeTofile(会覆盖)
    //移动到文件的尾部
    [self.writeHandle seekToEndOfFile];
    //从当前移动的位置，写入数据
    [self.writeHandle writeData:data];
    
    
    double f= [[NSDate date] timeIntervalSinceDate:_starDownloadDate];
    NSLog(@"下载总时间%f",f);
    self.speed=self.sumLength/1000.0/f;
    NSLog(@"速度%fk/s",_speed);
    
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@",response);
    self.fileName=[NSString stringWithFormat:@"%@.ipa",[NSDate date]];
    self.filePath=[NSHomeDirectory() stringByAppendingPathComponent:_fileName];
    NSLog(@"%@",_filePath);
    //创建一个空的文件,到沙盒中
    NSFileManager *mgr=[NSFileManager defaultManager];
    //刚创建完毕的大小是o字节
    [mgr createFileAtPath:_filePath contents:nil attributes:nil];
    self.writeHandle=[NSFileHandle fileHandleForWritingAtPath:_filePath];
    self.sumLength=response.expectedContentLength;
    self.starDownloadDate=[NSDate date];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    //关闭连接，不再输入数据在文件中
    [self.writeHandle closeFile];
    //销毁
    self.writeHandle=nil;
    NSLog(@"下载完毕,文件大小：%fM",[[NSFileManager defaultManager] attributesOfItemAtPath:_filePath error:nil].fileSize/1000.0/1000.0);
    _isFinish=YES;
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"失败%@",error);
}


@end
