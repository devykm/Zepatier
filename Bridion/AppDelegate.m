//
//  AppDelegate.m
//  Arcoxia
//
//  Created by ykm dev on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "BridionViewController.h"
#import "ArcViewController.h"
#import "Crittercism.h"


@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([super application:application didFinishLaunchingWithOptions:launchOptions]) {
//        [Crittercism enableWithAppID:@"53f74f360729df4ad2000001"];
    }
    
    return YES;
}

#pragma ------------------
#pragma LoginViewControllerDelegate

-(void)loginSuccess
{
    
    switch ([Test activeUser].team)
    {
        case APPLICATION_ZEPATIER:
            [self showBridion:UIViewAnimationOptionTransitionCrossDissolve];
            break;
        case APPLICATION_ARCOXIA:
            [self showArcoxia:UIViewAnimationOptionTransitionCrossDissolve];
            break;
            default:
            [self showBridion:UIViewAnimationOptionTransitionCrossDissolve];
            break;
    }
    
    
    [super loginSuccess];
}


#pragma -------------------
#pragma Applications

-(void) showArcoxia:(UIViewAnimationOptions)option
{
    ArcViewController *viewController = [[ArcViewController alloc] initWithNibName:@"ArcViewController" bundle:nil];
    [self transitionToViewController:viewController withTransition:UIViewAnimationOptionTransitionCrossDissolve];
}
-(void) showBridion:(UIViewAnimationOptions)option
{
    BridionViewController *viewController = [[BridionViewController alloc] initWithNibName:@"BridionViewController" bundle:nil];
    [self transitionToViewController:viewController withTransition:UIViewAnimationOptionTransitionCrossDissolve];
}

@end
