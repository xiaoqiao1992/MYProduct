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
#import "GTMineViewController.h"
#import "GTSlashView.h"
#import "GTStatic.h"
#import <GTFramework/GTFramework.h>

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
    
    
    GTMineViewController * mineController = [GTMineViewController new];
    
    
    [tabbarController setViewControllers:@[VC,controller2,recommendController,mineController]];
 
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyWindow];
    
    
    [self.window.rootViewController.view addSubview:({
        GTSlashView * slashView = [[GTSlashView alloc] initWithFrame:CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height)];
        slashView;
    })];
    
    //static
    //[[GTStatic alloc] init]
    
    return YES;
}


#pragma mark -url

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
