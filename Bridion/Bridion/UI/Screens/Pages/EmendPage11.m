//
//  EmendPage11.m
//  bridion
//
//  Created by YKM_MACMINI on 11/11/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "EmendPage11.h"

@implementation EmendPage11
{
    UIImageView *img;
    UIView *view;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:EmendStatistictPage11 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"emend_11.jpg"]];
    
    // adding tapping view for url connection
    view = [[UIView alloc]initWithFrame:CGRectMake(337, 176, 596, 476)];
    [self addSubview:view];
    
    // adding gesture for the view
    UIGestureRecognizer *tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                                      :self action:@selector(viewTap:)];
    [view addGestureRecognizer:tapParent];
    
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
}

-(void) viewTap:(UIGestureRecognizer*)gesture
{
    // open url
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.anti-emetic.co.il"]];
}

@end
