//
//  ZepatierG1aPage2.m
//  Zepatier
//
//  Created by iOS Developer on 19/01/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierG1aPage2.h"
#import "UIView-Extensions.h"

@implementation ZepatierG1aPage2

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsG1aPage2;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierG1aPage2" owner:self options:nil];
        [self addSubview:self.view];
    }
    self.backImageView.alpha = 0.0;
    self.tavla.alpha = 0.0;
    self.title.alpha = 0.0;
    self.marker1.alpha = 0.0;
    self.marker2.alpha = 0.0;
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    
    [self.marker1 setContentMode:UIViewContentModeBottomLeft];
    [self.marker2 setContentMode:UIViewContentModeBottomLeft];
    [self.marker1 setClipsToBounds:YES];
    [self.marker2 setClipsToBounds:YES];
    CGFloat img1Width = self.marker1.width;
    [self.marker1 setWidth:0];
    [self.marker2 setWidth:0];

    
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backImageView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.title.frame = CGRectMake(36, 44, 850, 42);
            self.title.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.tavla.alpha = 1.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    self.marker1.alpha = 1.0;

                    [self.marker1 setWidth:img1Width ];
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                        self.marker2.alpha = 1.0;

                        [self.marker2 setWidth:img1Width ];
                    } completion:^(BOOL finished) {
                        
                    }];

                }];
            }];
        }];
    }];
}

- (IBAction)referenceAction:(UIButton *)sender {
    if(self.referenceView.alpha != 1.0){
        [UIView animateWithDuration:1.0 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.referenceView.alpha = 1.0;
            
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [UIView animateWithDuration:1.0 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.referenceView.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
}

-(void)pagewillDisapear{
    [super pagewillDisapear];
}

@end
