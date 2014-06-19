//
//  InfoControl.m
//  lior
//
//  Created by ykm dev on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoxafilInfoControl.h"
#import "AppDelegate.h"
#import "FTAnimation+UIView.h"

@implementation NoxafilInfoControl

- (id)initWithFrame:(CGRect)frame textImageName:(NSString*)textImage imageToPress:(NSString*)imgToPress
{
    if ((self = [super initWithFrame:frame])) {
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self.button setImage:[UIImage imageNamed:imgToPress] forState:UIControlStateNormal];
		[self.button setImage:[UIImage imageNamed:imgToPress] forState:UIControlStateDisabled];
		[self.button addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:self.button];
		
		self.textImageName = textImage;
		isLock = NO;
    }
    return self;
}

-(void)showInfo:(id)sender
{
	if(!isLock) {
        UIImage *infoImg = [UIImage imageFromMainBundleFile:self.textImageName];
		if(self.controller == nil) {
			self.controller = [[NoxafilInfoControlController alloc] init:infoImg];
		}
        CGRect rect = CGRectMake(0, 0, 15, -35);
        [self showView:self.controller.view fromRect:rect inView:self];
	}
}

-(void)showView:(UIView*)view fromRect:(CGRect)rect inView:(UIView*)inView
{
	UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
	[backView setBackgroundColor:[UIColor clearColor]];
	backView.tag = 1111;
    
    if(self.window.rootViewController.presentedViewController != nil) {
        [self.window.rootViewController.presentedViewController.view addSubview:backView];
    }
    else {
        [self.window.rootViewController.view addSubview:backView];
    }
	
	UITapGestureRecognizer *singleFingerDTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popHandleSingleTap:)];
	singleFingerDTap.numberOfTapsRequired = 1;
	[backView addGestureRecognizer:singleFingerDTap];
    
	
	CGRect inViewRect = inView.frame;
	float x = inViewRect.origin.x + rect.size.width;
	float y = inViewRect.origin.y - rect.size.height - view.frame.size.height;
	CGPoint pointView;
    if(self.window.rootViewController.presentedViewController != nil) {
        pointView = [inView.superview convertPoint:CGPointMake(x, y) toView:self.window.rootViewController.presentedViewController.view];
    }
    else {
        pointView = [inView.superview convertPoint:CGPointMake(x, y) toView:self.window.rootViewController.view];
    }
	
	CGRect viewRect = view.frame;
	viewRect.origin.y = pointView.y;
	viewRect.origin.x = pointView.x;
	view.frame = viewRect;
    view.hidden = YES;
	view.tag = 1112;
	[view setUserInteractionEnabled:YES];
	
    if(self.window.rootViewController.presentedViewController != nil) {
        [self.window.rootViewController.presentedViewController.view addSubview:view];
        [self.window.rootViewController.presentedViewController.view bringSubviewToFront:view];
    }
    else {
        [self.window.rootViewController.view addSubview:view];
        [self.window.rootViewController.view bringSubviewToFront:view];
    }
	
	[view fadeIn:0.3 delegate:nil];
}

-(void) popHandleSingleTap:(UIGestureRecognizer*)recognizer
{
    UIView *popView = nil;
    if(self.window.rootViewController.presentedViewController != nil) {
        popView = [self.window.rootViewController.presentedViewController.view viewWithTag:1112];
    }
    else {
        popView = [self.window.rootViewController.view viewWithTag:1112];
    }
	[popView fadeOut:0.3 delegate:self startSelector:nil stopSelector:@selector(popFadeOutFinish)];
}

-(void) popFadeOutFinish
{
    if(self.window.rootViewController.presentedViewController != nil) {
        [[self.window.rootViewController.presentedViewController.view viewWithTag:1112] removeFromSuperview];
        [[self.window.rootViewController.presentedViewController.view viewWithTag:1111] removeFromSuperview];
    }
    else {
        [[self.window.rootViewController.view viewWithTag:1112] removeFromSuperview];
        [[self.window.rootViewController.view viewWithTag:1111] removeFromSuperview];
    }
}

-(void) setIsLock:(BOOL)locked {
	self.button.enabled = !locked;
	isLock = locked;
}



@end
