//
//  EmendPage10.m
//  bridion
//
//  Created by YKM_MACMINI on 11/11/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "EmendPage10.h"

@implementation EmendPage10
{
    UIImageView *img;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:EmendStatistictPage10 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"emend_10.jpg"]];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(325, 170, 565, 186)];
    [img setImage:[UIImage imageNamed:@"emend_10a.png"]];
    [self addSubview:img];
    
    [self setPlusInfo:@"emend_screen10_plus.png"];
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
}

@end
