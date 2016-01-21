//
//  StartMeetingMenu.m
//  Victrelis
//
//  Created by ykm dev on 5/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BridionStartMeetingMenu.h"
#import "UIView-Extensions.h"
#import "Test.h"

@implementation BridionStartMeetingMenu

@synthesize delegate = _delegate,isToggleDisable;

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initControl];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initControl];
    }
    return self;
}

-(void) initControl
{
    [self setClipsToBounds:YES];
    
    UIImageView *backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"contrac_play_back.png"]];
    [backView setFrame:self.bounds];
    [backView setContentMode:UIViewContentModeCenter];
    [self addSubview:backView];
    
    UIButton *btnEnd = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnEnd setFrame:CGRectMake(1, 0, 87, 85)];
    [btnEnd setImage:[UIImage imageNamed:@"contrac_play_stop_btn.png"] forState:UIControlStateNormal];
    [btnEnd setImage:[UIImage imageNamed:@"contrac_play_stop_btn_s.png"] forState:UIControlStateHighlighted];
    [btnEnd addTarget:self action:@selector(btnEndClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnEnd];
    
    UIButton *btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnStart setFrame:CGRectMake(87, 0, 85, 85)];
    [btnStart setImage:[UIImage imageNamed:@"contrac_play_play_btn.png"] forState:UIControlStateNormal];
    [btnStart setImage:[UIImage imageNamed:@"contrac_play_play_btn_s.png"] forState:UIControlStateHighlighted];
    [btnStart addTarget:self action:@selector(btnStartClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnStart];
    
    UIButton *btnToggle = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnToggle setClipsToBounds:YES];
    [btnToggle setFrame:CGRectMake(self.width-35.0, 0, 35, self.height)];
    [btnToggle setBackgroundColor:[UIColor clearColor]];
    [btnToggle addTarget:self action:@selector(btnToggleClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnToggle];
    
    
    [self showCloseMode:NO];
}

-(void) btnToggleClick:(id)sender
{
    if(isToggleDisable) return;
    
    if(isOpen) {
        [self showCloseMode:YES];
    }
    else {
        [self showOpenMode:YES];
    }
}

-(void) btnStartClick:(id)sender
{
    [Test activeTestReset];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TestStartNotification" object:self];
    [_delegate startMeetingMenuStart];
    
    if(isToggleDisable) {
        [self showFullCloseMode:YES];
    }
    else {
        [self showCloseMode:YES];
    }
}

-(void) btnEndClick:(id)sender
{
    [_delegate startMeetingMenuEnd];
}


-(void) showStartMode:(BOOL)animate
{
    isOpen = YES;
    if(animate) {
        [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationCurveEaseInOut animations:^(void){
            [self setX:-90];
        } completion:^(BOOL finished){
        }];
    }
    else {
        [self setX:-90];
    }
}

-(void) showCloseMode:(BOOL)animate
{
    isOpen = NO;
    if(animate) {
        [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationCurveEaseInOut animations:^(void){
            [self setX:-170];
        } completion:^(BOOL finished){
        }];
    }
    else {
        [self setX:-170];
    }
}

-(void) showFullCloseMode:(BOOL)animate
{
    isOpen = NO;
    if(animate) {
        [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationCurveEaseInOut animations:^(void){
            [self setX:-self.bounds.size.width];
        } completion:^(BOOL finished){
        }];
    }
    else {
        [self setX:-self.bounds.size.width];
    }
}

-(void) showOpenMode:(BOOL)animate
{
    isOpen = YES;
    if(animate) {
        [UIView animateWithDuration:0.3 delay:0.1 options:UIViewAnimationCurveEaseInOut animations:^(void){
            [self setX:-2];
        } completion:^(BOOL finished){
        }];
    }
    else {
        [self setX:-2];
    }
}

@end
