//
//  ZepatierG1bPage2.m
//  Zepatier
//
//  Created by iOS Developer on 01/08/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierG1bPage2.h"
#import "UIView-Extensions.h"
#import "ExtendUIView.h"
@implementation ZepatierG1bPage2

{
    CGRect rectImageGray;
    CGPoint point;
    
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsG1bPage2;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierG1bPage2" owner:self options:nil];
        [self addSubview:self.view];
    }
    _title.alpha = 0.0;
    _slogan.alpha = 0.0;
    _backGraph.alpha = 0.0;
    _graph.alpha = 0.0;
    _textDown.alpha = 0.0;
    
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
    rectImageGray = _graph.frame;
    _graph.contentMode = UIViewContentModeBottom;
    _graph.clipsToBounds = YES;
    point = _graph.position;
    [_graph changeFrameSize: CGSizeMake(rectImageGray.size.width, 0)];
    [_graph changeFrameOrigin: CGPointMake(rectImageGray.origin.x, rectImageGray.origin.y + (rectImageGray.size.height))];
    
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            _title.frame = CGRectMake(31, 39, 648, 112);
            _title.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                _slogan.alpha = 1.0;
                _slogan.transform = CGAffineTransformIdentity;
                _backGraph.alpha = 1.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    [_graph changeFrameSize: CGSizeMake(rectImageGray.size.width, rectImageGray.size.height + 10)];
                    [_graph changeFrameOrigin: CGPointMake(point.x, point.y - 10)];
                    _graph.alpha = 1.0;
                
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                        
                        _textDown.alpha = 1.0;
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
