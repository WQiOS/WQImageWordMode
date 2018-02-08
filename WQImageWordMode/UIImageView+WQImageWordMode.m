//
//  UIImageView+WQImageWordMode.m
//  WQCocoaPodsTest
//
//  Created by 王强 on 2018/2/8.
//  Copyright © 2018年 XiYiChuanMei. All rights reserved.
//

#import "UIImageView+WQImageWordMode.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "AFNetworking.h"

static NSString *XYIMAGEMODE = @"XYImageModeType";
static NSString *XYWORD = @"XYImageModeTypeWord";
static NSString *XYIMAGE = @"XYImageModeTypeImage";

@implementation UIImageView (WQImageWordMode)

/**
 设置app的图片模式「有图无图」

 @param imageModeType 图片模式
 */
+ (void)xy_setImageMode:(XYImageModeType)imageModeType {
    if (imageModeType == XYImageModeTypeWord) {
        [[NSUserDefaults standardUserDefaults] setObject:XYWORD forKey:XYIMAGEMODE];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:XYIMAGE forKey:XYIMAGEMODE];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

/**请求网络图片，会根据无图模式判断*/
- (void)xy_setImageWithImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholder {

    BOOL isWifi = [AFNetworkReachabilityManager sharedManager].isReachableViaWWAN;
    NSString *imageModeString = [[NSUserDefaults standardUserDefaults] objectForKey:XYIMAGEMODE];
    if ([imageModeString isEqualToString:XYWORD] && !isWifi) {
        [self setImage:placeholder];
    }else{
        [self sd_setImageWithURL:imageURL placeholderImage:placeholder];
    }
}

/** 请求网络图片，总是显示*/
- (void)xy_setImageAlwayDisplayWithURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholder {
    [self sd_setImageWithURL:imageURL placeholderImage:placeholder];
}
@end
