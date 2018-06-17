//
//  ZCTabBarController.h
//  ZCTabBarControllerDemo
//
//  Created by zhong chen on 2018/6/10.
//  Copyright © 2018年 zhongchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCTabBarController : UITabBarController

@property (nonatomic, readwrite, copy) NSArray *viewControllers;
@property (nonatomic, readwrite, copy) NSArray *tabBarItemsAttributes;

@end
