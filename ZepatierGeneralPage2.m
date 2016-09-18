//
//  ZepatierGeneralPage2.m
//  Zepatier
//
//  Created by iOS Developer on 01/08/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierGeneralPage2.h"

@implementation ZepatierGeneralPage2

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsGeneralPage2;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierGeneralPage2" owner:self options:nil];
        [self addSubview:self.view];
    }
    
    _title.alpha = 0.0;
    _slogan.alpha = 0.0;
    _chart.alpha = 0.0;
    _blueText.alpha = 0.0;
    
    
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    _blueText.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    [UIView animateWithDuration:0.8 animations:^{
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            _title.frame = CGRectMake(26, 41, 384, 56);
            _title.alpha = 1.0;
            _slogan.alpha = 1.0;
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1.0 animations:^{
                _chart.alpha = 1.0;
                
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:1.0 animations:^{
                    _blueText.alpha = 1.0;
                    _blueText.transform = CGAffineTransformIdentity;
                    
                } completion:^(BOOL finished) {
                    
                    
                    
                }];
                
            }];
            
            
        }];
   
    }];
    
    
}
- (IBAction)openReference:(id)sender {
    
    if(_referenceView.alpha != 1.0){
        [UIView animateWithDuration:1.0 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            _referenceView.alpha = 1.0;
            
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [UIView animateWithDuration:1.0 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
            _referenceView.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
    
    
}


@end
