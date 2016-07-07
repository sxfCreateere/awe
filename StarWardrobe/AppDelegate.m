//
//  AppDelegate.m
//  StarWardrobe
//
//  Created by Mac on 16/7/4.
//  Copyright © 2016年 Xyc. All rights reserved.
//

#import "AppDelegate.h"
#import "IntroductionVC.h"
#import "ITTabBarVC.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSFileManager * manager =[[NSFileManager  alloc]init];
    if (![manager fileExistsAtPath:SQLitePath]) {
         [manager createFileAtPath:SQLitePath contents:nil attributes:nil];
        KSLog(@"%@",SQLitePath);
    }
    
    self.window = [[UIWindow alloc]initWithFrame:kMainBounds];
    self.window.backgroundColor = [UIColor whiteColor];
    ITTabBarVC * rootVC =[ITTabBarVC new];
    
   NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults valueForKey:@"DemoState"]) {
        [userDefaults setValue:@0 forKey:@"DemoState"];
    }
    
    if ([[userDefaults valueForKey:@"DemoState"] integerValue] == 1) {
        
        self.window.rootViewController = rootVC;
        [self.window makeKeyAndVisible];
        return YES;
    }
    
    IntroductionVC * introVC =[IntroductionVC new];
    [self.window addSubview:introVC.view];
    
    __block IntroductionVC * weakIntroVC = introVC;
    
    [introVC enterRootVC:^{
        [userDefaults setValue:@1 forKey:@"DemoState"];
        [weakIntroVC.view removeFromSuperview ];
        self.window.rootViewController = rootVC;
    }];
    
    self.window.rootViewController = introVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
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
