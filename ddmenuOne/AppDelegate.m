//
//  AppDelegate.m
//  ddmenuOne
//
//  Created by 密码123 on 16/10/26.
//  Copyright © 2016年 密码123. All rights reserved.
//
#import "RXLSideSlipViewController.h"
#import "WWSideslipViewController.h"
#import "SideslipRightViewController.h"
#import "SideslipViewController.h"
#import "DDMenuController.h"
#import "MineViewController.h"
#import "InformationViewController.h"
#import "MedicalCircleViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self mainTabBar];
    return YES;
}
- (void)mainTabBar
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    HomeViewController *mainVC = [[HomeViewController alloc] init];
    mainVC.tabBarItem.title = @"MAIN_PAGE";
    mainVC.tabBarItem.image = [UIImage imageNamed:@"main_page_high"];
    mainVC.tabBarItem.selectedImage = [UIImage imageNamed:@"main_page"];
    
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    MedicalCircleViewController *medicalVC = [[MedicalCircleViewController alloc] init];
    medicalVC.tabBarItem.title = @"MAIN_STUDY";
    medicalVC.tabBarItem.image = [UIImage imageNamed:@"study"];
    medicalVC.tabBarItem.selectedImage = [UIImage imageNamed:@"study_high"];
    UINavigationController *medicalNav = [[UINavigationController alloc] initWithRootViewController:medicalVC];
    
    InformationViewController *infoVC = [[InformationViewController alloc] init];
    infoVC.tabBarItem.title = @"MAIN_MEDICAL";
    infoVC.tabBarItem.image = [UIImage imageNamed:@"medical_exam"];
    infoVC.tabBarItem.selectedImage = [UIImage imageNamed:@"medical_exam_high"];
    UINavigationController *infoNav = [[UINavigationController alloc] initWithRootViewController:infoVC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    mineVC.tabBarItem.title = @"MAIN_MINE";
    mineVC.tabBarItem.image = [UIImage imageNamed:@"mine"];
    mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"mine_high"];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    
    UITabBarController *tabBarControl = [[UITabBarController alloc] init];
    tabBarControl.viewControllers = @[mainNav,medicalNav,infoNav,mineNav];
    tabBarControl.tabBar.barStyle = UIBarStyleDefault;
    tabBarControl.view.backgroundColor = [UIColor whiteColor];
    tabBarControl.tabBar.tintColor = [UIColor redColor]; // 设置高亮颜色
    tabBarControl.selectedIndex = 0;
    
    //app.window.rootViewController = tabBarControl;
    
    /**
     *
     * @ 侧滑菜单
     
     * @ 效果一
     
     * @ 传统效果
     *
     */
    SideslipViewController *left = [[SideslipViewController alloc] init];
    
    SideslipRightViewController *right = [[SideslipRightViewController alloc] init];
    /*
    DDMenuController*ddMenu = [[DDMenuController alloc] initWithRootViewController:tabBarControl];
     ddMenu.leftViewController = left;
    
    ddMenu.rightViewController = right;
    
    app.window.rootViewController = ddMenu;
    */
    /*
    WWSideslipViewController * slide = [[WWSideslipViewController alloc]initWithLeftView:left andMainView:tabBarControl andRightView:right andBackgroundImage:[UIImage imageNamed:@"SlidslipGround"]];
    
    //滑动速度系数
    [slide setSpeedf:0.7];
    
    //点击视图是是否恢复位置
    slide.sideslipTapGes.enabled = YES;
    
    app.window.rootViewController = slide;
    */
    
    RXLSideSlipViewController *RXL = [[RXLSideSlipViewController alloc] initWithContentViewController:tabBarControl leftMenuViewController:left rightMenuViewController:right];
    
    
    //RXL.backgroundImage = [UIImage imageNamed:@"aaa.png"];
    //RXL.delegate = self;
    
    RXL.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    RXL.contentViewShadowColor = [UIColor blackColor];
    RXL.contentViewShadowOffset = CGSizeMake(0, 0);
    RXL.contentViewShadowOpacity = 0.6;
    RXL.contentViewShadowRadius = 12;
    RXL.contentViewShadowEnabled = NO; // 是否显示阴影
    RXL.contentPrefersStatusBarHidden = NO;//是否隐藏主视图的状态条
    
    app.window.rootViewController = RXL;

}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
