//
//  AppNotificationCenter.m
//  AmericanBaby
//
//  Created by 陆广庆 on 14-8-11.
//  Copyright (c) 2014年 陆广庆. All rights reserved.
//

#import "AppNotificationCenter.h"

static NSString * const kNCNewLocationKey = @"NCNewLocation";
static NSString * const kNCAppWillEnterForegroundKey = @"NCAppWillEnterForeground";
static NSString * const kNCAppDidEnterBackground = @"NCAppDidEnterBackground";
//static NSString * const kNCTabBarRootViewDidAppearKey = @"NCTabBarRootViewDidAppear";
//static NSString * const kNCTabBarRootViewWillDisappearKey = @"NCTabBarRootViewWillDisappear";
static NSString * const kNCOnRecvMiChatMessageKey = @"NCOnRecvMiChatMessage";
static NSString * const kNCAfterRecvMiChatMessageKey = @"NCAfterRecvMiChatMessage";
static NSString * const kNCOnSendMiChatMessageResponseKey = @"NCOnSendMiChatMessageResponse";
static NSString * const kNCPhotoAlbumSelectCompletedKey = @"NCPhotoAlbumSelectCompleted";
static NSString * const kNCMessageBadgeChanged = @"NCMessageBadgeChanged";

@implementation AppNotificationCenter

+ (void)postNotification:(AppNotificationType)type
{
    [[NSNotificationCenter defaultCenter] postNotificationName:[self nameForType:type]
                                                        object:nil
                                                      userInfo:nil];
}

+ (void)postNotification:(AppNotificationType)type withUserInfo:(NSDictionary *)userInfo
{
    [[NSNotificationCenter defaultCenter] postNotificationName:[self nameForType:type]
                                                        object:nil
                                                      userInfo:userInfo];
}

+ (void)registerNotification:(AppNotificationType)type receiver:(id)receiver action:(SEL)action
{
    [[NSNotificationCenter defaultCenter] addObserver:receiver selector:action name:[self nameForType:type] object:nil];
}

+ (void)removeNotification:(AppNotificationType)type receiver:(id)receiver
{
    [[NSNotificationCenter defaultCenter] removeObserver:receiver name:[self nameForType:type] object:self];
}


+ (NSString *)nameForType:(AppNotificationType)type
{
    switch (type) {
        case AppNotificationTypeLocationChanged:
            return kNCNewLocationKey;
        case AppNotificationTypeApplicationWillEnterForeground:
            return kNCAppWillEnterForegroundKey;
//        case AppNotificationTypeTabBarRootViewDidAppear:
//            return kNCTabBarRootViewDidAppearKey;
//        case AppNotificationTypeTabBarRootViewWillDisappear:
//            return kNCTabBarRootViewWillDisappearKey;
        case AppNotificationTypeOnRecvMiChatMessage:
            return kNCOnRecvMiChatMessageKey;
        case AppNotificationTypeMessageBadgeChanged:
            return kNCMessageBadgeChanged;
        case AppNotificationTypeAfterRecvMiChatMessage:
            return kNCAfterRecvMiChatMessageKey;
        case AppNotificationTypeOnSendMiChatMessageResponse:
            return kNCOnSendMiChatMessageResponseKey;
        case AppNotificationTypePhotoAlbumSelectCompleted:
            return kNCPhotoAlbumSelectCompletedKey;
        case AppNotificationTypeApplicationDidEnterBackground:
            return kNCAppDidEnterBackground;
        default:
            return nil;
    }
}



@end
