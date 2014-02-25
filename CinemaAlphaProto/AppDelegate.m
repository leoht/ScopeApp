//
//  AppDelegate.m
//  CinemaAlphaProto
//
//  Created by HETSCH Leonard on 30/01/14.
//  Copyright (c) 2014 Gobelins. All rights reserved.
//


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self adaptStoryboardForScreen];
    [self initializeSlideMenu];
    
    [ApiDelegate connect];
    
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [FBSession.activeSession setStateChangeHandler:
     ^(FBSession *session, FBSessionState state, NSError *error) {
         [FacebookConnectionManager sessionStateChanged:session state:state error:error];
     }];
    
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication withSession:FBSession.activeSession];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBAppCall handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [FBSession.activeSession close];
}

- (void)adaptStoryboardForScreen {
    // adapt storyboard if it is a 4-inch iPhone
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    UIViewController * vc;
    UINavigationController *nav;
    UIStoryboard *sb;
    
    NSLog(@"%f", screenBounds.size.height);
    
    // 4-inch iphone
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone
        && screenBounds.size.height > 480) {
        
        sb = [UIStoryboard storyboardWithName:@"Main_iPhone_Large" bundle:nil];
        vc = [sb instantiateViewControllerWithIdentifier:@"EntryPointViewLarge"];
    }
    
    // classic iphone
    else if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone
          && screenBounds.size.height <= 480) {
        
        sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        vc = [sb instantiateViewControllerWithIdentifier:@"EntryPointView"];
    }
    
    // ipad
    else {
        sb = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        vc = [sb instantiateViewControllerWithIdentifier:@"EntryPointView"];
    }
    
    
    nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.tabController = [[UITabBarController alloc] init];
    [self.tabController addChildViewController:nav];
    
    nav.tabBarItem.image = [UIImage imageNamed:@"play.png"];
    
    [self.window setRootViewController:self.tabController];
    
}



- (void) initializeSlideMenu {

	
}

@end
