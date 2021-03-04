//
//  AppDelegate.m
//  SampleApp
//
//  Created by QQ on 2021/2/3.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    UITabBarController * tabbarController = [UITabBarController new];
    
    GTNewsViewController * VC = [GTNewsViewController new];
    VC.tabBarItem.title = @"新闻";
    VC.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    VC.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
    GTVideoViewController * controller2 = [GTVideoViewController new];
    
    
    GTRecommendViewController * recommendController = [GTRecommendViewController new];
    
    
    UIViewController * controller4 = [UIViewController new];
    controller4.view.backgroundColor = [UIColor blueColor];
    controller4.tabBarItem.title = @"我的";
    controller4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    [tabbarController setViewControllers:@[VC,controller2,recommendController,controller4]];
 
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyWindow];
    return YES;
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options{
    NSLog(@"");
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"");
}
- (void)applicationWillResignActive:(UIApplication *)application{
    NSLog(@"");
}

-(void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"");
}

-(void)applicationWillEnterForeground:(UIApplication *)application{
    NSLog(@"");
}

-(void)applicationWillTerminate:(UIApplication *)application{
    
}


//-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    NSLog(@"点击了");
//}



@end
