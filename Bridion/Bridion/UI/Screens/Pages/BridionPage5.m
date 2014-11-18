//
//  ZostavaxPage1.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "BridionPage5.h"

@implementation BridionPage5
{
    UIImageView *img;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:BridionStatistictPage5 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{

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
