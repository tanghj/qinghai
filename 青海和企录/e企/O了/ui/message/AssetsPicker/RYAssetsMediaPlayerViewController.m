//
//  RYAssetsMediaPlayerViewController.m
//  O了
//
//  Created by 卢鹏达 on 14-2-12.
//  Copyright (c) 2014年 roya. All rights reserved.
//

#define TAG_PLAY 200    //play图片的tag

#import <AssetsLibrary/AssetsLibrary.h>
#import <MediaPlayer/MediaPlayer.h>

#import "RYAssetsMediaPlayerViewController.h"
#import "RYAsset.h"

@interface RYAssetsMediaPlayerViewController (){
    MPMoviePlayerController *_moviePlay;
}

@end

@implementation RYAssetsMediaPlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self initialBar];
    [self initialMoviePlayer];
    
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_moviePlay pause];
    _moviePlay=nil;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma mark IOS7 隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark 初始化barItem
- (void)initialBar
{
    //navigation设置 返回
    UIButton *buttonBack=[UIButton buttonWithType:UIButtonTypeCustom];
    buttonBack.titleLabel.font=[UIFont systemFontOfSize:12];
    buttonBack.bounds=CGRectMake(0, 0, 50, 29);
    [buttonBack setImage:[UIImage imageNamed:@"nav-bar_back.png"] forState:UIControlStateNormal];
    [buttonBack setImage:[UIImage imageNamed:@"nav-bar_back.png"] forState:UIControlStateHighlighted];
    [buttonBack addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:buttonBack];
    //toolbar设置 发送
    UIButton *buttonSend=[UIButton buttonWithType:UIButtonTypeCustom];
    buttonSend.titleLabel.font=[UIFont systemFontOfSize:12];
    buttonSend.bounds=CGRectMake(0, 0, 50, 29);
    [buttonSend setBackgroundImage:[UIImage imageNamed:@"RYAssetsPicker.bundle/send.png"] forState:UIControlStateNormal];
    [buttonSend setBackgroundImage:[UIImage imageNamed:@"RYAssetsPicker.bundle/send_highlighted.png"] forState:UIControlStateHighlighted];
    [buttonSend addTarget:self action:@selector(sendVedio:) forControlEvents:UIControlEventTouchUpInside];
    [buttonSend setTitle:self.titleButtonSure forState:UIControlStateNormal];
    UIBarButtonItem * barItemSend=[[UIBarButtonItem alloc]initWithCustomView:buttonSend];
    UIBarButtonItem * space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.toolbarItems=@[space,barItemSend];
}
#pragma mark 初始化MoviePlayer
- (void)initialMoviePlayer
{
    
    _moviePlay= [[MPMoviePlayerController alloc] initWithContentURL:[[self.ryAsset.asset defaultRepresentation]url]];
    _moviePlay.repeatMode=MPMovieRepeatModeOne;
    _moviePlay.controlStyle = MPMovieControlStyleNone;
    _moviePlay.scalingMode=MPMovieScalingModeAspectFit;
    _moviePlay.shouldAutoplay=NO;
    [_moviePlay setFullscreen:YES animated:YES];
    _moviePlay.view.bounds=[UIScreen mainScreen].bounds;
    _moviePlay.view.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2 , [UIScreen mainScreen].bounds.size.height/2);
    
    [_moviePlay prepareToPlay];
    [self.view addSubview:_moviePlay.view];
    //moviePlay 遮罩View
    UIView *maskView=[[UIView alloc]initWithFrame:_moviePlay.view.frame];
    maskView.backgroundColor=[UIColor clearColor];
    //播放图片
    UIImageView *playView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"RYAssetsPicker.bundle/play.png"]];
    playView.tag=TAG_PLAY;
    playView.center=CGPointMake(maskView.bounds.size.width*0.5, maskView.bounds.size.height*0.5);
    [maskView addSubview:playView];
    
    UITapGestureRecognizer *maskTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(barShowState:)];
    [maskView addGestureRecognizer:maskTap];
    [_moviePlay.view addSubview:maskView];
}
#pragma mark - target事件方法
#pragma mark 手势，单击显／隐
- (void)barShowState:(UITapGestureRecognizer *)sender
{
    MPMoviePlaybackState playState=[_moviePlay playbackState];
    UIView *playView=[_moviePlay.view viewWithTag:TAG_PLAY];
    switch (playState) {
        case MPMoviePlaybackStatePlaying:
            playView.hidden=NO;
            [_moviePlay pause];
            break;
        default:
            playView.hidden=YES;
            [_moviePlay play];
            break;
    }
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:YES];
    [self.navigationController setToolbarHidden:!self.navigationController.toolbarHidden animated:YES];
}
#pragma mark 返回选择器
- (void)back:(id)sender
{
    [UIView  beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.375];
    [self.navigationController popViewControllerAnimated:YES];
    [UIView commitAnimations];
}
#pragma mark 发送选择图片
- (void)sendVedio:(id)sender
{
    NSArray *arrayInfo=[NSArray arrayWithObject:self.ryAsset.asset];
    [self.parent selectedAssets:arrayInfo original:NO];
}
@end
