//
//  AppDelegate.m
//  SoccerMatches
//
//  Created by ziwen.xi on 16/3/5.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "AppDelegate.h"

#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

#import "FirstMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setupViewControllers];
    self.window.rootViewController=self.viewController;
    [self.window makeKeyAndVisible];
    return YES;

}

- (void)setupViewControllers {
    
    UIViewController *firstViewController = [[FirstMainViewController alloc] init];
    firstViewController.title = NSLocalizedString(@"足球", nil);
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    UIViewController *secondViewController = [[UIViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    UIViewController *thirdViewController = [[UIViewController alloc] init];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    RDVTabBarController *tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                           thirdNavigationController]];
    
    self.viewController = tabBarController;
    

    
    
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"first", @"second", @"third"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item selectedTitleAttributes];
        
        
        
//        NSDictionary *navTitleArr = [NSDictionary dictionaryWithObjectsAndKeys:
//                                     [UIFont boldSystemFontOfSize:20],UITextAttributeFont,
//                                     [UIColor redColor],UITextAttributeTextColor ,[NSValue valueWithCGSize:CGSizeMake(2.0, 2.0)] , UITextAttributeTextShadowOffset ,
//                                     [UIColor whiteColor] ,UITextAttributeTextShadowColor ,nil];
//        item.unselectedTitleAttributes = navTitleArr;

        index++;
    }
    
    
    
    //- (void)viewWillAppear:(BOOL)animated{
    //    [super viewWillAppear:animated];
    //    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
    //}
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
