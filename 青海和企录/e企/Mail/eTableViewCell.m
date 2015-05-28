//
//  eTableViewCell.m
//  app
//
//  Created by ROYA on 15/4/9.
//  Copyright (c) 2015年 ROYA. All rights reserved.
//

#import "eTableViewCell.h"
#import "DownData.h"
#import "DownViewController.h"
@implementation eTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
  
        _la = [[UILabel alloc]initWithFrame:CGRectMake(69, -9, 100, 50)];
        _la.text=@"城市绵羊";
        _la.font=[UIFont systemFontOfSize:12];
        [_la setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        [self addSubview:_la];
        
        
                _la1 = [[UILabel alloc]initWithFrame:CGRectMake(70, 25, 100, 50)];
                //_la1.text=_str;
                _la1.font=[UIFont systemFontOfSize:12];
        [self addSubview:_la1];
        
        _la2 = [[UILabel alloc]initWithFrame:CGRectMake(175, 25, 100, 50)];
        //_la2.text=_str1;
        _la2.font=[UIFont systemFontOfSize:12];
        [self addSubview:_la2];
        
     
                _ima = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sheepCity.png"]];
                _ima.frame=CGRectMake(10, 10, 50, 50);
                [self addSubview:_ima];
        
                _proView = [[UIProgressView alloc] initWithFrame:CGRectMake(70, 45, 180, 20)];
        
                [_proView setProgressViewStyle:UIProgressViewStyleDefault];
                    [self addSubview:_proView];
       
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if ([UIScreen mainScreen].bounds.size.width >=375||[UIScreen mainScreen].bounds.size.height >=667 ) {
            NSLog(@"iPhone6以上");
            if ([UIScreen mainScreen].bounds.size.width ==375||[UIScreen mainScreen].bounds.size.height ==667 ) {
                 _btn.frame=CGRectMake(260+50, 15, 50, 30);
                _btn.backgroundColor = [UIColor clearColor];
                [_btn.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
                [_btn.layer setBorderWidth:1.0]; //边框宽度
                [_btn setTitle:@"安装" forState:UIControlStateNormal];
                [_btn setTitle:@"取消" forState:UIControlStateSelected];
                [_btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
                _btn.layer.borderColor = [UIColor orangeColor].CGColor;
            }else{
                 _btn.frame=CGRectMake(260+90, 15, 50, 30);
                _btn.backgroundColor = [UIColor clearColor];
                [_btn.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
                [_btn.layer setBorderWidth:1.0]; //边框宽度
                [_btn setTitle:@"安装" forState:UIControlStateNormal];
                [_btn setTitle:@"取消" forState:UIControlStateSelected];
                [_btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
                _btn.layer.borderColor = [UIColor orangeColor].CGColor;
            }
           
        }else{
            NSLog(@"iPhone6以下");
            _btn.frame=CGRectMake(260, 15, 50, 25);
            _btn.backgroundColor = [UIColor clearColor];
            [_btn.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
            [_btn.layer setBorderWidth:1.0]; //边框宽度
            [_btn setTitle:@"安装" forState:UIControlStateNormal];
            [_btn setTitle:@"取消" forState:UIControlStateSelected];
            [_btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            _btn.layer.borderColor = [UIColor orangeColor].CGColor;
        }
//        [_btn setImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
        
        [self addSubview:_btn];
        
        
        _lll = [[UILabel alloc]init];
        _lll.frame = CGRectMake(8,0, 50, 30);
        _lll.text=@"安装";
        _lll.textColor=[UIColor whiteColor];
       // [_btn addSubview:_lll];
       
        
      
        _imageview = [[UIImageView alloc]init];
        _imageview.frame = CGRectMake(270, 5, 50, 50);
        [_imageview setImage:[UIImage imageNamed:@"zanting.png"]];
        
            
        
       

    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
