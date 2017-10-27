//
//  AppDelegate.m
//  3DtouchDemo
//
//  Created by 郭海祥 on 2017/10/18.
//  Copyright © 2017年 ghx. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//首次启动APP调用的方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    /*
     code init ViewController
     */
    ViewController * viewC = [[ ViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:viewC];
    
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];

    
    //在动态添加快捷可选项前,需要用判断是否支持3D Touch功能,以免在不支持的设备上运行程序导致闪退
    if ([self respondsToSelector:@selector(traitCollection)])
    {
          if ([self.window.traitCollection respondsToSelector:@selector(forceTouchCapability)])
              {
                    if (self.window.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
                        {
                              // 支持3D Touch
                            [self creatShortcutItem];  //动态创建应用图标上的3D touch快捷选项
                            
                            
                            UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
                            //如果是从快捷选项标签启动app，则根据不同标识执行不同操作，然后返回NO，防止调用- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
                            if (shortcutItem) {
                                //判断设置的快捷选项标签唯一标识，根据不同标识执行不同操作
                                if ([shortcutItem.type isEqualToString:@"com.yang.share"]) {
                                    //进入分享页面
                                    NSLog(@"新启动APP-- 分享");
                                }
                                
                                return NO;
                            }
                            }
                    else
                        {
                              // 不支持3D Touch
                            }
                  }
    }
    

    return YES;
}

//如果APP没被杀死，还存在后台，点开Touch会调用该代理方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    if (shortcutItem) {
        //判断设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if ([shortcutItem.type isEqualToString:@"com.yang.share"]) {
            //进入分享页面
            NSLog(@"APP没被杀死-- 分享");
        }
    }
    
    if (completionHandler) {
        completionHandler(YES);
    }
}

- (void)creatShortcutItem {
    //创建系统风格的icon
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    //创建快捷选项
    UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"com.yang.share" localizedTitle:@"分享11" localizedSubtitle:@"分享副标题" icon:icon userInfo:nil];
    
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[item,item,item,item];
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
