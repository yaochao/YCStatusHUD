//
//  YCStatusHUD.h
//  YCStatusHUD
//
//  Created by PP on 15/1/26.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCStatusHUD : NSObject

/**
 *  成功时
 */
+ (void)showSuccessWith:(NSString *)string;

/**
 *  失败时
 */
+ (void)showFailWith:(NSString *)string;

/**
 *  加载时
 */
+ (void)showLoadingWith:(NSString *)string;

/**
 *  取消加载
 */
+ (void)cancelLoading;
@end
