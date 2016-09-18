//
//  ZepatierGeneralPage5.m
//  Zepatier
//
//  Created by iOS Developer on 01/08/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierGeneralPage5.h"
#import <QuartzCore/QuartzCore.h>
@implementation ZepatierGeneralPage5

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsGeneralPage5;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierGeneralPage5" owner:self options:nil];
        [self addSubview:self.view];
    }
    
    _title.alpha = 0.0;
    _slogan.alpha = 0.0;
    _ball1.alpha = 0.0;
    _ball2.alpha = 0.0;
    _ball3.alpha = 0.0;
    _ball4.alpha = 0.0;
    _ball5.alpha = 0.0;
    _ball6.alpha = 0.0;
    _ball7.alpha = 0.0;
    _ball8.alpha = 0.0;
    _ballText1.alpha = 0.0;
    _ballText2.alpha = 0.0;
    _ballText3.alpha = 0.0;
    _ballText4.alpha = 0.0;
    _ballText5.alpha = 0.0;
    _ballText6.alpha = 0.0;
    _ballText7.alpha = 0.0;
    _ballText8.alpha = 0.0;
    _downText.alpha = 0.0;
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
            _title.frame = CGRectMake(31, 42, 623, 82);
            _slogan.alpha = 1.0;
        } completion:^(BOOL finished) {
            
            [UIView transitionWithView:_ball1 duration:0.5
                               options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                   _ball1.image = _ball1.image;
                                   _ball1.alpha = 1.0;
                               } completion:^(BOOL finished) {
                                   
                                   [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                                       _ballText1.alpha = 1.0;
                                   } completion:^(BOOL finished) {
                                       [UIView transitionWithView:_ball2 duration:0.5
                                                          options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                                              _ball2.image = _ball2.image;
                                                              _ball2.alpha = 1.0;
                                                              
                                                          } completion:^(BOOL finished) {
                                                              
                                                              [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                                                                  _ballText2.alpha = 1.0;
                                                              } completion:^(BOOL finished) {
                                                                  [UIView transitionWithView:_ball3 duration:0.5
                                                                                     options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                                                                         _ball3.image = _ball3.image;
                                                                                         _ball3.alpha = 1.0;
                                                                                         
                                                                                     } completion:^(BOOL finished) {
                                                                                         
                                                                                         [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                                                                                             _ballText3.alpha = 1.0;
                                                                                         } completion:^(BOOL finished) {
                                                                                             [UIView transitionWithView:_ball4 duration:0.5
                                                                                                                options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                                                                                                    _ball4.image = _ball4.image;
                                                                                                                    _ball4.alpha = 1.0;
                                                                                                                    
                                                                                                                } completion:^(BOOL finished) {
                                                                                                                    
                                                                                                                    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                                                                                                                        _ballText4.alpha = 1.0;
                                                                                                                    } completion:^(BOOL finished) {
                                                                                                                        [UIView transitionWithView:_ball5 duration:0.5
                                                                                                                                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                                                                                                                               _ball5.image = _ball5.image;
                                                                                                                                               _ball5.alpha = 1.0;
                                                                                                                                               
                                                                                                                                           } completion:^(BOOL finished) {
                                                                                                                                               
                                                                                                                                               [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                                                                                                                                                   _ballText5.alpha = 1.0;
                                                                                                                                               } completion:^(BOOL finished) {
                                                                                                                                                   [UIView transitionWithView:_ball6 duration:0.5
                                                                                                                                                                      options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                                                                                                                                                          _ball6.image = _ball6.image;
                                                                                                                                                                          _ball6.alpha = 1.0;
                                                                                                                                                                          
                                                                                                                                                                      } completion:^(BOOL finished) {
                                                                                                                                                                          
                                                                                                                                                                          [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                                                                                                                                                                              _ballText6.alpha = 1.0;
                                                                                                                                                                          } completion:^(BOOL finished) {
                                                                                                                                                                              
                                                                                                                                                                              [UIView transitionWithView:_ball7 duration:0.5
                                                                                                                                                                                                 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                                                                                                                                                                                     _ball7.image = _ball7.image;
                                                                                                                                                                                                     _ball7.alpha = 1.0;
                                                                                                                                                                                                     
                                                                                                                                                                                                 } completion:^(BOOL finished) {
                                                                                                                                                                                                     
                                                                                                                                                                                                     [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                                                                                                                                                                                                         _ballText7.alpha = 1.0;
                                                                                                                                                                                                     } completion:^(BOOL finished) {
                                                                                                                                                                                                         
                                                                                                                                                                                                         [UIView transitionWithView:_ball8 duration:0.5
                                                                                                                                                                                                                            options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                                                                                                                                                                                                                                _ball8.image = _ball8.image;
                                                                                                                                                                                                                                _ball8.alpha = 1.0;
                                                                                                                                                                                                                                
                                                                                                                                                                                                                            } completion:^(BOOL finished) {
                                                                                                                                                                                                                                
                                                                                                                                                                                                                                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                                                                                                                                                                                                                                    _ballText8.alpha = 1.0;
                                                                                                                                                                                                                                } completion:^(BOOL finished) {
                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                    [UIView animateWithDuration:0.3 animations:^{
                                                                                                                                                                                                                                        _downText.alpha = 1.0;
                                                                                                                                                                                                                                    }]  ;                                                                                                                   }];
                                                                                                                                                                                                                            }];
                                                                                                                                                                                                     }];
                                                                                                                                                                                                 }];
                                                                                                                                                                          }];
                                                                                                                                                                      }];
                                                                                                                                                   
                                                                                                                                               }];
                                                                                                                                           }];
                                                                                                                        
                                                                                                                    }];
                                                                                                                }];
                                                                                             
                                                                                         }];
                                                                                     }];
                                                                  
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
