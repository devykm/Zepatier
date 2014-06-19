//
//  EmendPage7.m
//  bridion
//
//  Created by YKM_MACMINI on 11/11/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "EmendPage7.h"

@implementation EmendPage7
{
    UIImageView *img;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:EmendStatistictPage7 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"emend_07.jpg"]];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(750, 220, 199, 199)];
    [img setImage:[UIImage imageNamed:@"emend_07_circle.png"]];
    img.transform = CGAffineTransformMakeScale(2.0, 2.0);
    [self addSubview:img];
    
    [self setRInfo:@"emend_screen07_r.png"];
    [self setPlusInfo:@"emend_screen07_plus.png"];
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    
    [UIView animateWithDuration:0.25 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^(void) {
        img.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
    }];

}

@end
