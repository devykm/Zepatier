//
//  EmendPage6.m
//  bridion
//
//  Created by YKM_MACMINI on 11/11/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "EmendPage6.h"

@implementation EmendPage6
{
    UIImageView *img;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:EmendStatistictPage6 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"emend_06.jpg"]];
    
    [self setRInfo:@"emend_screen06_r.png"];
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
