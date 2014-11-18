//
//  ZostavaxPage1.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//
#import "BridionPage1.h"
#import "UIView-Extensions.h"
#import "InfoControl.h"
#import "FTAnimation+UIView.h"

@implementation BridionPage1

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:BridionStatistictPage1 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [[NSBundle mainBundle] loadNibNamed:@"BridionPage1" owner:self options:nil];
    [self.view setFrame:self.bounds];
    [self addSubview:self.view];
    
    [self.graph setWidth:0];
    [self.graphOrange setWidth:0];
    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(20, 600, 42, 42) BgImageName:@"bridion_R.png" textImageName:@"bridion_PCR1_reference.png" WithOrientation:InfoControlOrientationRIGHTTOP] ;
    info.arrowSideMargin = 0;
    [self addSubview:info];
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    
    [UIView animateWithDuration:1.2 delay:0.8 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
        [self.graphOrange setWidth:467];
    } completion:^(BOOL finished) {
        [self.lineOrange fadeIn:0.4 delegate:nil];
        [self.circleLineOrange fadeIn:0.4 delegate:nil];
        [self.circleOrange popIn:0.4 delegate:nil];
        
        [UIView animateWithDuration:1.2 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
            [self.graph setWidth:469];
        } completion:^(BOOL finished) {
            [self.lineGray fadeIn:0.4 delegate:nil];
            [self.circleLineGray fadeIn:0.4 delegate:nil];
            [self.circleGray popIn:0.4 delegate:nil];
        }];
    }];
}

@end
