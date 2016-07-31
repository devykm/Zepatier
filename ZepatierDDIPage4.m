//
//  ZepatierDDIPage4.m
//  Zepatier
//
//  Created by iOS Developer on 31/07/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierDDIPage4.h"

@implementation ZepatierDDIPage4

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsDDIPage4;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierDDIPage4" owner:self options:nil];
        [self addSubview:self.view];
    }
    self.tavla.alpha = 0.0;
    self.title.alpha = 0.0;
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    
    [UIView animateWithDuration:1.0 animations:^{
        self.title.alpha = 1.0;
        self.title.frame = CGRectMake(29, 28, 995, 76);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.tavla.alpha = 1.0;
        } completion:^(BOOL finished) {
            
        }];
    }];
    
    
}


@end
