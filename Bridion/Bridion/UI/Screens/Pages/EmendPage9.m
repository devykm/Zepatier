//
//  EmendPage9.m
//  bridion
//
//  Created by YKM_MACMINI on 11/11/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "EmendPage9.h"

@implementation EmendPage9
{
    UIImageView *img;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:EmendStatistictPage9 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"emend_09.jpg"]];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(325, 120, 204, 73)];
    [img setImage:[UIImage imageNamed:@"emend_09a.png"]];
    [self addSubview:img];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(517, 140, 24, 23)];
    [img setImage:[UIImage imageNamed:@"emend_09b.png"]];
    [self addSubview:img];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(540, 120, 204, 73)];
    [img setImage:[UIImage imageNamed:@"emend_09c.png"]];
    [self addSubview:img];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(732, 140, 24, 23)];
    [img setImage:[UIImage imageNamed:@"emend_09d.png"]];
    [self addSubview:img];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(755, 120, 204, 73)];
    [img setImage:[UIImage imageNamed:@"emend_09e.png"]];
    [self addSubview:img];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(960, 140, 23, 16)];
    [img setImage:[UIImage imageNamed:@"emend_09f.png"]];
    [self addSubview:img];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(335, 200, 656, 72)];
    [img setImage:[UIImage imageNamed:@"emend_09g.png"]];
    [self addSubview:img];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(435, 340, 546, 129)];
    [img setImage:[UIImage imageNamed:@"emend_09h.png"]];
    [self addSubview:img];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(256, 445, 768, 241)];
    [img setImage:[UIImage imageNamed:@"emend_09i.png"]];
    [self addSubview:img];

    
    
    [self setRInfo:@"emend_screen09_r.png"];
    [self setPlusInfo:@"emend_screen09_plus.png"];
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
