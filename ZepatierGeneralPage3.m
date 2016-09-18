//
//  ZepatierGeneralPage3.m
//  Zepatier
//
//  Created by iOS Developer on 01/08/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierGeneralPage3.h"
#import "UIView-Extensions.h"
#import "ExtendUIView.h"
@implementation ZepatierGeneralPage3
{
    CGRect rectImageGray;
    CGPoint point;
    
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsGeneralPage3;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierGeneralPage3" owner:self options:nil];
        [self addSubview:self.view];
    }
    
    _title.alpha = 0.0;
    _backBar.alpha = 0.0;
    _bars.alpha = 0.0;
    _man.alpha = 0.0;
    _textDown.alpha = 0.0;
    _slogan.alpha = 0.0;
    
    
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    
    rectImageGray = self.bars.frame;
    self.bars.contentMode = UIViewContentModeBottom;
    self.bars.clipsToBounds = YES;
    point = self.bars.position;
    [_bars changeFrameSize: CGSizeMake(rectImageGray.size.width, 0.0)];
    [_bars changeFrameOrigin: CGPointMake(rectImageGray.origin.x, rectImageGray.origin.y + (rectImageGray.size.height))];
    
    [UIView animateWithDuration:0.7 animations:^{
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            _title.frame = CGRectMake(29, 50, 448, 54);
            _title.alpha = 1.0;
            _slogan.alpha = 1.0;
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1.0 animations:^{
                _backBar.alpha = 1.0;
                _man.alpha = 1.0;
                _man.frame = CGRectMake(700, 126, 324, 525);
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:1.0 animations:^{
                    _bars.alpha = 1.0;
                    [_bars changeFrameSize: CGSizeMake(rectImageGray.size.width, rectImageGray.size.height)];
                    [_bars changeFrameOrigin: CGPointMake(point.x, point.y)];
                    
                    
                    
                } completion:^(BOOL finished) {
                    
                    [UIView animateWithDuration:1.0 animations:^{
                        _textDown.alpha = 1.0;
                        
                        
                        
                    } completion:^(BOOL finished) {
                        
                        
                        
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
