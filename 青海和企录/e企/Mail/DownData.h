//
//  DownData.h
//  应用中心
//
//  Created by a on 15/3/31.
//  Copyright (c) 2015年 a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DownData : NSObject
@property(nonatomic,strong) NSURLConnection *connection;
@property(nonatomic,assign) NSInteger sumLength;
@property(nonatomic,assign) NSInteger currentLength;
@property(nonatomic,strong) NSFileHandle *writeHandle;
@property(nonatomic,copy) NSString *filePath;
@property(nonatomic,strong) NSDate *starDownloadDate;
@property(nonatomic,assign) BOOL isFinish;
@property(nonatomic,assign) float speed;
@property(nonatomic,copy) NSString *fileName;
@property(nonatomic,assign) NSInteger installation;
@property(nonatomic,strong) UIButton *button;
-(id)initAndDownload;
-(void)xiazai;
@end
