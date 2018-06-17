//
//  ZCTabBarController.m
//  ZCTabBarControllerDemo
//
//  Created by zhong chen on 2018/6/10.
//  Copyright © 2018年 zhongchen. All rights reserved.
//

#import "ZCTabBarController.h"

@interface ZCTabBarController ()

@end

@implementation ZCTabBarController
@synthesize viewControllers = _viewControllers;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 去除tabBar自带的顶部阴影，backgroundImage 和 shadowImage 同时设置才有效果
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    
    // 处理tabBar，使用自定义 tabBar 添加 发布按钮
    [self setUpTabBar];
    // 设置tabBarItem 的文字自定义属性
    [self setUpTabBarItemTextAttributes];
}

#pragma mark - Setters
- (void)setViewControllers:(NSArray *)viewControllers {
    if (viewControllers && [viewControllers isKindOfClass:[NSArray class]]) {
        _viewControllers = [viewControllers copy];
        NSInteger index = 0;
        for (UIViewController *viewController in viewControllers) {
            [self addChildViewController:viewController
                                   title:_tabBarItemsAttributes[index][@"title"]
                                   image:_tabBarItemsAttributes[index][@"image"]
                           selectedImage:_tabBarItemsAttributes[index][@"selectedImage"]];
            index++;
        }
    }else {
        
    }
}

#pragma mark - Private Method
- (void)addChildViewController:(UIViewController *)controller
                         title:(NSString *)title
                         image:(NSString *)image
                 selectedImage:(NSString *)selectedImage {
    UITabBarItem *tabBatItem = [[UITabBarItem alloc] init];
    tabBatItem.title = title;
    tabBatItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBatItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBatItem.titlePositionAdjustment = UIOffsetMake(0.0, -3.0);
    tabBatItem.imageInsets = UIEdgeInsetsMake(1, 0, -1, 0);
    controller.tabBarItem = tabBatItem;
    controller.title = title;
    [self addChildViewController:controller];
}

- (void)setUpTabBar {
    
}

// tabBarItem 选中和不选中文字的颜色
- (void)setUpTabBarItemTextAttributes {
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:246/256.0 green:143/256.0 blue:92/256.0 alpha:1];
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
