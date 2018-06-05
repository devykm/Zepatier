//
//  Safety_07.m
//  
//
//  Created by iOS Developer on 17/12/2015.
//
//

#import "Safety_07.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
#import "ExtendUIView.h"
@implementation Safety_07

{
    UIImageView *referenceView;
    UIImageView *graph;
    UIImageView *graphs3;
    UIButton *infoButton;
    CGRect rectImageGray;
    
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPageSafety07;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"safety10_tittle.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    graph = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    [graph setImage:[UIImage imageNamed:@"safety10_slide.png"]];
    [graph setContentMode:UIViewContentModeScaleAspectFit];
    [self.container addSubview:graph];
    
   
    
    
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 430, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
        
    }];
    
}




-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"safety10_ref.png"]];
        [referenceView setFrame:CGRectMake(90, 340, 600, 190)];
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
