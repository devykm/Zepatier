//
//  Time_04.m
//  
//
//  Created by iOS Developer on 17/12/2015.
//
//

#import "Time_04.h"

@implementation Time_04

{
    UIImageView *referenceView;
    UIImageView *fadeTavla;
    UIImageView *summary;
    UIButton *infoButton;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPagetime04;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setContentMode:UIViewContentModeLeft];
    
    //fadeTavla = [[UIImageView alloc] initWithFrame:CGRectMake(0, -65, self.container.bounds.size.width, self.container.bounds.size.height + 70)];
    //[fadeTavla setImage:[UIImage imageNamed:@"Arcoxia_tavla_fade.png"]];
    //[fadeTavla setContentMode:UIViewContentModeScaleAspectFit];
    //[self.container addSubview:fadeTavla];
    //fadeTavla.alpha = 0.1;
    summary = [[UIImageView alloc] initWithFrame:CGRectMake(0, -65, self.container.bounds.size.width, self.container.bounds.size.height +70 )];
    [summary setImage:[UIImage imageNamed:@"time04_tavla.png"]];
    //[summary setContentMode:UIViewContentModeScaleAspectFit];
    summary.alpha = 0.0;
    [self.container addSubview:summary];
    
    
    
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 450, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
        [summary setAlpha:1.0];
        //[fadeTavla setAlpha:1.0];
        
        
        
    }];
    
}
-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"time04_tavla_ref.png"]];
        [referenceView setFrame:CGRectMake(60, 250, 640, 270)];
        referenceView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:referenceView];
        [referenceView setAlpha:0.0f];
        
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:1.0f];
            
        } completion:^(BOOL finished) {
            
            
        }];
    }else{
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [referenceView removeFromSuperview];
        }];
        
    }
}



@end
