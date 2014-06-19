//
//  InvanzEcologyPage1.m
//  Oncology
//
//  Created by YKM_MACMINI on 5/13/14.
//  Copyright (c) 2014 YKM. All rights reserved.
//

#import "NoxafilEcologyPage1.h"

@implementation NoxafilEcologyPage1

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:InvanzStatistictEcologyPage1 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"INVANZ_ECOLOGY01.png"]];
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    
    
}
@end
