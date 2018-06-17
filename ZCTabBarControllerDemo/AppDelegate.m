//
//  AppDelegate.m
//  ZCTabBarControllerDemo
//
//  Created by zhong chen on 2018/6/9.
//  Copyright © 2018年 zhongchen. All rights reserved.
//

#import "AppDelegate.h"
#import "ZCTabBarController.h"
#import "ZCHomeViewController.h"
#import "ZCMoodViewController.h"
#import "ZCMessageViewController.h"
#import "ZCMineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ZCTabBarController *tab = [[ZCTabBarController alloc] init];
    self.window.rootViewController = tab;
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[ZCHomeViewController new]];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:[ZCMoodViewController new]];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:[ZCMessageViewController new]];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:[ZCMineViewController new]];
    NSDictionary *attrs1 = @{@"title" : @"电台", @"image" : @"btn_zhibo_off", @"selectedImage" : @"btn_zhibo_on"};
    NSDictionary *attrs2 = @{@"title" : @"互动", @"image" : @"btn_hudong_off", @"selectedImage" : @"btn_hudong_on"};
    NSDictionary *attrs3 = @{@"title" : @"消息", @"image" : @"btn_news_off", @"selectedImage" : @"btn_news_on"};
    NSDictionary *attrs4 = @{@"title" : @"我的", @"image" : @"btn_my_off", @"selectedImage" : @"btn_my_on"};
    tab.tabBarItemsAttributes = @[attrs1, attrs2, attrs3, attrs4];
    tab.viewControllers = @[nav1, nav2, nav3, nav4];
    [self.window makeKeyAndVisible];
    //[self setUpTabBarItemTextAttributes];
    return YES;
}

- (void)setUpTabBarItemTextAttributes {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:246/256.0 green:143/256.0 blue:92/256.0 alpha:1];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
