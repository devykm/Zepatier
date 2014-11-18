//
//  ZostavaxPage1.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "BridionPage6.h"

@implementation BridionPage6
{
    UIImageView *img;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:BridionStatistictPage6 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"bridion_SSI_bk.png"]];
    [self.imgBack setContentMode:UIViewContentModeScaleAspectFill];
    
    
    UIImageView *imgTitle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bridion_SSI_tittle.png"]];
    [imgTitle setFrame:CGRectMake(20, 20, 670, 31)];
    [self addSubview:imgTitle];
    
    UIImageView *imgText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bridion_SSI_text1.png"]];
    [imgText setFrame:CGRectMake(50, 95, 909, 517)];
    [self addSubview:imgText];
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
