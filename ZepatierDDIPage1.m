//
//  ZepatierDDIPage1.m
//  Zepatier
//
//  Created by iOS Developer on 28/06/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierDDIPage1.h"

@implementation ZepatierDDIPage1

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsDDIPage1;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierDDIPage1" owner:self options:nil];
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
