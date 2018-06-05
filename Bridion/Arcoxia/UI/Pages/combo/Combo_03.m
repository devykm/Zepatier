//
//  Combo_03.m
//  
//
//  Created by iOS Developer on 17/12/2015.
//
//

#import "Combo_03.h"

@implementation Combo_03

{
    UIImageView *referenceView;
    UIImageView *fadeTavla;
    UIImageView *summary;
    UIButton *infoButton;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPageCombo03;
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
    
    fadeTavla = [[UIImageView alloc] initWithFrame:CGRectMake(0, -70, self.container.bounds.size.width, self.container.bounds.size.height + 75)];
    [fadeTavla setImage:[UIImage imageNamed:@"combination03_tavla.png"]];
    //[fadeTavla setContentMode:UIViewContentModeScaleAspectFit];
    [self.container addSubview:fadeTavla];
    
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 450, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
        [fadeTavla setAlpha:1.0];
        
        
        
    }];
    
}
-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"combination03_tavla_ref.png"]];
        [referenceView setFrame:CGRectMake(60, 320, 640, 270)];
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
