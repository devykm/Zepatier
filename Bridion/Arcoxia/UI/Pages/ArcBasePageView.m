//
//  PresBasePage.m
//  Victrelis
//
//  Created by ykm dev on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArcBasePageView.h"

@implementation ArcBasePageView

- (id)initWithPageNumber:(int)page size:(CGSize)size 
{
	if (self = [super init]) {
        [self setFrame:CGRectMake(0, 0, size.width, size.height)];
        [self setBackgroundColor:[UIColor clearColor]];
        
        UIImageView *back = [[UIImageView alloc] initWithFrame:self.bounds];
        [back setImage:[UIImage imageNamed:@"arc_basepage_back.png"]];
        [self addSubview:back];

        
        self.imgTitle = [[UIImageView alloc] initWithFrame:CGRectMake(45, 18, 860, 44)];
        [self.imgTitle setBackgroundColor:[UIColor clearColor]];
        [self.imgTitle setContentMode:UIViewContentModeRight];
        [self addSubview:self.imgTitle];

        self.container = [[UIView alloc] initWithFrame:CGRectMake(25, 76, 900, 420)];
        [self.container setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.container];
	}	
    return self;
}

@end
