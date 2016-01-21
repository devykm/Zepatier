//
//  ZepatierTNPage1.m
//  Zepatier
//
//  Created by iOS Developer on 18/01/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierTNPage1.h"
#import "UIView-Extensions.h"
#import "ExtendUIView.h"

@implementation ZepatierTNPage1
{
    CGRect rectImageGray;
    CGPoint point;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsTNPage1;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierTNPage1" owner:self options:nil];
        [self addSubview:self.view];
    }
    self.backImageView.alpha = 0.0;
    self.title.alpha = 0.0;
    self.man.alpha = 0.0;
    self.bars.alpha = 0.0;
    self.tnGraph.alpha = 0.0;
    self.pills.alpha = 0.0;
    
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    self.pills.transform = CGAffineTransformMakeScale(0.5, 0.5);
    //self.bars.transform = CGAffineTransformMakeScale(1.0, 0.0001);
    self.bars.contentMode = UIViewContentModeBottom;
    self.bars.clipsToBounds = YES;
    point = self.bars.position;
    rectImageGray = self.bars.frame;
    [self.bars changeFrameSize: CGSizeMake(rectImageGray.size.width, 0)];
    [self.bars changeFrameOrigin: CGPointMake(rectImageGray.origin.x, rectImageGray.origin.y + (rectImageGray.size.height))];

    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.backImageView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.title.frame = CGRectMake(39, 50, 574, 128);
            self.title.alpha = 1.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.pills.alpha = 1.0;
                self.pills.transform = CGAffineTransformIdentity;
                self.tnGraph.alpha = 1.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    self.man.alpha = 1.0;
                    self.man.frame = CGRectMake(748, 147, 357, 484);
                } completion:^(BOOL finished) {
                        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{

                            [self.bars changeFrameSize: CGSizeMake(rectImageGray.size.width, rectImageGray.size.height + 10)];
                            [self.bars changeFrameOrigin: CGPointMake(point.x, point.y - 10)];
                            //self.bars.frame = rectImageGray;
                            self.bars.alpha = 1.0;

                        } completion:^(BOOL finished) {
                            //self.bars.contentMode = UIViewContentModeScaleAspectFill;

                        }];
                    }];
                }];
            }];
            

        }];
    
}


-(void)pagewillDisapear{
    [super pagewillDisapear];
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

@end


