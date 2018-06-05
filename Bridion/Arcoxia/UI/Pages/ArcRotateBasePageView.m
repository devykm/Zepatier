//
//  ArcRotateBasePageView.m
//  Arcoxia
//
//  Created by ykm dev on 12/2/12.
//
//

#import "ArcRotateBasePageView.h"
#import "AppDelegate.h"
#import "ArcViewController.h"

@implementation ArcRotateBasePageView

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        openRotate = YES;
	}
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    BaseMainAppViewController *mainApp = (BaseMainAppViewController*)self.window.rootViewController;
    int appId = mainApp.applicationId;

    switch (appId) {
        case 1:{
            }
            break;
        case 5:{
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            
            ArcViewController *controller = (ArcViewController*)app.window.rootViewController;
            controller.lockQuestionScreen = YES;
        }
        case 6:{
            
        }
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void) pagewillDisapear
{
    [super pagewillDisapear];
    
    BaseMainAppViewController *mainApp = (BaseMainAppViewController*)self.window.rootViewController;
    int appId = mainApp.applicationId;
    
    switch (appId) {
        case 1:{
        }
            break;
        case 5:{
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            ArcViewController *controller = (ArcViewController*)app.window.rootViewController;
            controller.lockQuestionScreen = NO;
        }
        case 6:{
            
        }
    }
    

   
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) didRotate:(NSNotification*)notity
{
	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
	if(orientation == UIDeviceOrientationLandscapeLeft) {
		openRotate = YES;
        [self closeRotateView];
	}
	else if(orientation == UIDeviceOrientationLandscapeRight) {
		openRotate = YES;
        [self closeRotateView];
	}
	else if(orientation == UIDeviceOrientationPortrait) {
        [self openRotateView];
	}
	else if(orientation == UIDeviceOrientationPortraitUpsideDown) {
        [self openRotateView];
	}
}

-(void) closeRotateView
{
    if(rotateView != nil) {
        [self arcRotatePageViewClose];
    }
}

-(void) openRotateView
{
    if(rotateView != nil) return;
    
    UIImage *rImg = [self getRotateImage];
    if(rImg != nil) {
        rotateView = [[ArcRotatePageView alloc] init:rImg info:[self getRotateInfo]];
        rotateView.view.backgroundColor = [UIColor clearColor];
        rotateView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        rotateView.info.arrowSideMargin = self.arrowSideMargin;
        rotateView.delegate = self;
        rotateView.statisticId = self.statisticId;
        
        AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
        app.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
        [app.window.rootViewController presentViewController:rotateView animated:YES completion:nil];
        
        if([self respondsToSelector:@selector(rotateViewDidShow)]) {
            [self rotateViewDidShow];
        }
    }
}

//need to overide
-(UIImage*) getRotateImage
{
    return nil;
}
-(NSString*) getRotateInfo
{
    return nil;
}


#pragma --------------------
#pragma ArcRotatePageViewDelegate

-(void) arcRotatePageViewClose
{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app.window.rootViewController dismissViewControllerAnimated:YES completion:nil];

    rotateView = nil;
}


-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
