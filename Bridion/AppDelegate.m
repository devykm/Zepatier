//
//  AppDelegate.m
//  Arcoxia
//
//  Created by ykm dev on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


/*
 self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
 // Override point for customization after application launch.
 self.viewController = [[LoginController alloc] initWithNibName:@"LoginController" bundle:nil];
 self.window.rootViewController = self.viewController;
 [self.window makeKeyAndVisible];
 return YES;
 */

#import "AppDelegate.h"
//#import "InvanzViewController.h"
#import "BridionViewController.h"
//#import "NoxafilViewController.h"
//#import "CancidasViewController.h"


#import "Crittercism.h"


@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([super application:application didFinishLaunchingWithOptions:launchOptions]) {
        [Crittercism enableWithAppID:@"53f74f360729df4ad2000001"];
    }
    
    return YES;
}

#pragma ------------------
#pragma LoginViewControllerDelegate

-(void)loginSuccess
{
    [self showBridion:UIViewAnimationOptionTransitionCrossDissolve];
    /*
    switch ([Test activeUser].team)
    {
        case APPLICATION_JANUVIA:
            [self showJanuvia:UIViewAnimationOptionTransitionCrossDissolve];
            break;
        case APPLICATION_ARCOXIA:
            [self showArcoxia:UIViewAnimationOptionTransitionCrossDissolve];
            break;
        case APPLICATION_FOSAVAN:
            [self showFosavance:UIViewAnimationOptionTransitionCrossDissolve];
            break;
        default:
            [self showFosavance:UIViewAnimationOptionTransitionCrossDissolve];
            break;
    }
     */
    
    [super loginSuccess];
}


#pragma -------------------
#pragma Applications


//-(void) showInvanz:(UIViewAnimationOptions)option
//{
//    InvanzViewController *viewController = [[InvanzViewController alloc] initWithNibName:@"InvanzViewController" bundle:nil];
//    [self transitionToViewController:viewController withTransition:UIViewAnimationOptionTransitionCrossDissolve];
//}
//
//-(void) showNoxafil:(UIViewAnimationOptions)option
//{
//    NoxafilViewController *viewController = [[NoxafilViewController alloc] initWithNibName:@"NoxafilViewController" bundle:nil];
//    [self transitionToViewController:viewController withTransition:UIViewAnimationOptionTransitionCrossDissolve];
//}
//
//
//-(void) showCancidas:(UIViewAnimationOptions)option
//{
//    CancidasViewController *viewController = [[CancidasViewController alloc] initWithNibName:@"CancidasViewController" bundle:nil];
//    [self transitionToViewController:viewController withTransition:UIViewAnimationOptionTransitionCrossDissolve];
//}


-(void) showBridion:(UIViewAnimationOptions)option
{
    BridionViewController *viewController = [[BridionViewController alloc] initWithNibName:@"BridionViewController" bundle:nil];
    [self transitionToViewController:viewController withTransition:UIViewAnimationOptionTransitionCrossDissolve];
}

@end
