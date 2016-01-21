//
//  ZepatierG1aPage3.m
//  Zepatier
//
//  Created by iOS Developer on 20/01/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierG1aPage3.h"

@implementation ZepatierG1aPage3

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsG1aPage3;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierG1aPage3" owner:self options:nil];
        [self addSubview:self.view];
    }
    self.backImageView.alpha = 0.0;
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
    
    
    
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backImageView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.title.frame = CGRectMake(44, 51, 805, 39);
            self.title.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.tavla.alpha = 1.0;
            } completion:^(BOOL finished) {
                
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
