//
//  ZepatierGeneralPage4.m
//  Zepatier
//
//  Created by iOS Developer on 01/08/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierGeneralPage4.h"

@implementation ZepatierGeneralPage4

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsGeneralPage4;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierGeneralPage4" owner:self options:nil];
        [self addSubview:self.view];
    }
    
    _title.alpha = 0.0;
    _slogan.alpha = 0.0;
    _text.alpha = 0.0;
    
    
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    
    [UIView animateWithDuration:0.7 animations:^{
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            
            _title.alpha = 1.0;
            _title.frame = CGRectMake(29, 47, 667, 61);
            _slogan.alpha = 1.0;
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1.0 animations:^{
                
                _text.alpha = 1.0;
                
            } completion:^(BOOL finished) {
                
                
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
