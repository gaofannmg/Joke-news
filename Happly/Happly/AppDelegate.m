//
//  AppDelegate.m
//  Happly
//
//  Created by yemalive on 16/10/24.
//  Copyright © 2016年 yemalive. All rights reserved.
//

#import "AppDelegate.h"
#import "WeatherViewController.h"
#import "NewsViewController.h"
#import "JokeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    UITabBarController *tbC = [[UITabBarController alloc] init];
    self.window.rootViewController = tbC;
    
    UIImage *navBackgroundImage = [UIImage imageWithColor:RGB(255, 45, 75) andSize:CGSizeMake(self.window.bounds.size.width, 64)];
    
    NSDictionary * navTitleColorDict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    NewsViewController *newsVC = [[NewsViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:newsVC];
    [nav1.navigationBar setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    nav1.navigationBar.titleTextAttributes = navTitleColorDict;
    UIImage *newImage = [UIImage imageNamed:@"tabbar_item_joke"];
    nav1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:newImage selectedImage:nil];
    
    JokeViewController *joke = [[JokeViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:joke];
    [nav2.navigationBar setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    nav2.navigationBar.titleTextAttributes = navTitleColorDict;
    UIImage *jokeImage = [UIImage imageNamed:@"tabbar_item_weather"];
    nav2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"笑话" image:jokeImage selectedImage:nil];
    
    WeatherViewController *weather = [[WeatherViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:weather];
    [nav3.navigationBar setBackgroundImage:navBackgroundImage forBarMetrics:UIBarMetricsDefault];
    nav3.navigationBar.titleTextAttributes = navTitleColorDict;
    UIImage *weatherImage = [UIImage imageNamed:@"tabbar_item_new"];
    nav3.tabBarItem =  [[UITabBarItem alloc] initWithTitle:@"天气" image:weatherImage selectedImage:nil];
    
    
    UIEdgeInsets standardEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    UIImage * backgroundForSelectedTabBarItem = [[UIImage imageNamed:@"tabbar_selected_back"] resizableImageWithCapInsets:standardEdgeInsets resizingMode:UIImageResizingModeStretch];
    tbC.tabBar.selectionIndicatorImage = backgroundForSelectedTabBarItem;
    tbC.tabBar.tintColor = [UIColor whiteColor];
    
    tbC.viewControllers = @[nav1,nav2,nav3];
    
    tbC.tabBar.backgroundColor = [UIColor whiteColor];
    
    //改变状态栏的颜色 需要在plist里设置View controller-based status bar ： NO
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
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
