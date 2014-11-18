//
//  ZostavaxPage1.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//
#import "AppDelegate.h"
#import "BridionPage0.h"
#import "NSObject+Extension.h"
#import "FTAnimation+UIView.h"

@implementation BridionPage0
{
    UIImageView *img;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:BridionStatistictPage0 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [[NSBundle mainBundle] loadNibNamed:@"BridionPage0" owner:self options:nil];
    [self.view setFrame:self.bounds];
    [self addSubview:self.view];
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    
    [self performBlock:^{
        [self.text1 popIn:0.5 delegate:nil];
        [self performBlock:^{
            [self.text2 popIn:0.5 delegate:nil];
            [self performBlock:^{
                [self.text3 popIn:0.5 delegate:nil];
            } afterDelay:0.5];
        } afterDelay:0.5];
        
    } afterDelay:1.0];
}

@end
