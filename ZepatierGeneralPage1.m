//
//  ZepatierGeneralPage1.m
//  Zepatier
//
//  Created by iOS Developer on 01/08/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierGeneralPage1.h"
#import <QuartzCore/QuartzCore.h>


@implementation ZepatierGeneralPage1

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsGeneralPage1;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierGeneralPage1" owner:self options:nil];
        [self addSubview:self.view];
    }
    
    _text1.alpha = 0.0;
    _text2.alpha = 0.0;
    _text3.alpha = 0.0;
    _slogan.alpha = 0.0;
    _g1aball.alpha = 0.0;
    _g1bball.alpha = 0.0;
    _text4.alpha = 0.0;

    
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    _slogan.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    [UIView animateWithDuration:1.0 animations:^{
        _slogan.transform = CGAffineTransformIdentity;
        _slogan.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            _text1.alpha = 1.0;
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                _g1bball.alpha = 1.0;
                [UIView transitionWithView:_g1bball duration:1.0
                                   options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                       _g1bball.image = _g1bball.image;
                                       
                                   } completion:nil];
                
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.0 animations:^{
                    _text2.alpha = 1.0;
                    
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.5 animations:^{
                        _g1aball.alpha = 1.0;

                        [UIView transitionWithView:_g1aball duration:1.0
                                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                               _g1aball.image = _g1aball.image;
                                           } completion:nil];

                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:1.0 animations:^{
                            _text3.alpha = 1.0;
                            _text4.alpha = 1.0;
                            
                        } completion:^(BOOL finished) {
                            
                            
                        }];
                        
  
                        
                    }];
 
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
