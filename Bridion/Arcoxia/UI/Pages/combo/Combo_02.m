//
//  Combo_02.m
//  
//
//  Created by iOS Developer on 17/12/2015.
//
//

#import "Combo_02.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
@implementation Combo_02

{
    UIImageView *referenceView;
    UIImageView *graph;
    UIImageView *graphs3;
    UIButton *infoButton;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPageCombo02;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"combination02_tittle.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    graph = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    [graph setImage:[UIImage imageNamed:@"combination02_slide.png"]];
    [graph setContentMode:UIViewContentModeScaleAspectFit];
    [self.container addSubview:graph];
    
    graphs3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"combination02_lines.png"]];
    [graphs3 setContentMode:UIViewContentModeBottomLeft];
    [graphs3 setClipsToBounds:YES];
    CGFloat img1Width = graphs3.width;
    [graphs3 setFrame:CGRectMake(216, 72, graphs3.width, graphs3.height)];
    [graphs3 setWidth:0];
    [self addSubview: graphs3];
    
    
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(45, 400, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
        
    }];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [graphs3 setWidth:img1Width];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            //[graphs3 setWidth:img1Width];
        }];
    }];
    
}





-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"combination02_ref.png"]];
        [referenceView setFrame:CGRectMake(90, 360, 495, 130)];
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
