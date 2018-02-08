//
//  UIImageView+WQImageWordMode.h
//  WQCocoaPodsTest
//
//  Created by 王强 on 2018/2/8.
//  Copyright © 2018年 XiYiChuanMei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  NS_ENUM(NSInteger, XYImageModeType) {
    XYImageModeTypeImage = 0, // 图片模式
    XYImageModeTypeWord,      // 文字模式（只在wifi下显示图片否则加载默认图）
};

/**
 可以处理设置并处理无图有图模式
 */
@interface UIImageView (WQImageWordMode)

/**
 设置app的图片模式「有图无图」

 @param imageModeType 图片模式
 */
+ (void)xy_setImageMode:(XYImageModeType)imageModeType;

/**
 *  请求网络图片，会根据无图模式判断
 *
 *  @param imageURL         url地址
 *  @param placeholder 默认图
 */
- (void)xy_setImageWithImageURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholder;

/**
 *  请求网络图片，总是显示
 *
 *  @param imageURL         url
 *  @param placeholder 默认图
 */
- (void)xy_setImageAlwayDisplayWithURL:(NSURL *)imageURL placeholderImage:(UIImage *)placeholder;

@end
