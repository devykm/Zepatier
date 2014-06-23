//
//  ZostavaxPage1.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//
#import "AppDelegate.h"
#import "BridionPage0.h"

#import "BridionViewController.h"

@implementation BridionPage0
{
    UIImageView *img;
    QuestionViewController *finalQuestionController;

}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:BridionStatistictPageSelect size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"choose-hospitals.png"]];
    [self.imgBack setContentMode:UIViewContentModeScaleAspectFill];
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
}

-(void) openInvanz:(id)sender
{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app showInvanz:UIViewAnimationOptionTransitionNone];
}

-(void) openNoxafil:(id)sender
{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app showNoxafil:UIViewAnimationOptionTransitionNone];
}
-(void) openCancidas:(id)sender
{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app showCancidas:UIViewAnimationOptionTransitionNone];
}

-(void) openBridion:(id)sender
{
    [self.delegate bridionBaseMoveToPage:1];
}

#pragma mark questionViewController DELEGATE

//-(void) questionViewControllerCloseMe{
//    
//    [EmendVC dismissViewControllerAnimated:YES completion:nil];
//
//	finalQuestionController = nil;
//}

@end
