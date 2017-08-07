//
//  ONENavigationBarTool.h
//  CWOne
//
//  Created by Coulson_Wang on 2017/8/6.
//  Copyright © 2017年 Coulson_Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ONENavigationBarTool : NSObject

+ (instancetype)sharedInstance;


// 用于修改HomeNavigationBar的方法

- (void)updateTitleViewWithOffset:(CGFloat)offset;

/// 确定title的状态
- (void)confirmTitlViewWithOffset:(CGFloat)offset;

/// 修改返回今天按钮的显示性
- (void)updateTitleViewBackToTodayButtonVisible:(BOOL)isHidden;

/// 修改日期
- (void)updateTitleViewDateStringWithDateString:(NSString *)dateString;

/// 隐藏日期
- (void)hideCustomTitleView;

/// 显示日期
- (void)showCustomTitleView;

/// 将背景色图片移到最后层
- (void)moveBackgroundImageToBack;

/// 隐藏整个条，只显示20的高度
- (void)hideNavigationBar;

/// 恢复为原大小
- (void)resumeNavigationBar;

@end