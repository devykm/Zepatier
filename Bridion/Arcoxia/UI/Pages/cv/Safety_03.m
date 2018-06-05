//
//  Safety_03.m
//  
//
//  Created by iOS Developer on 17/12/2015.
//
//

#import "Safety_03.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
#import "ExtendUIView.h"

@implementation Safety_03

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
        self.statisticId = ArcoxiaStatistictPageSafety03;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"safety03_tittle.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    graph = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    [graph setImage:[UIImage imageNamed:@"safety03_slide.png"]];
    [graph setContentMode:UIViewContentModeScaleAspectFit];
    [self.container addSubview:graph];
    
    graphs3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"safety03_graph.png"]];
    //[graphs3 setContentMode:UIViewContentModeTopLeft];
    //[graphs3 setClipsToBounds:YES];
    [graphs3 changeFrameOrigin:CGPointMake(23, 75)];
    //[graphs3 setFrame:CGRectMake(23, 76, 125, 150)];
    //[graphs3 setHeight:0];
    [self addSubview: graphs3];
    graphs3.alpha = 0.0;

    rectImageGray = graphs3.frame;

    
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(45, 430, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
        
    }];
    [graphs3 changeFrameSize: CGSizeMake(rectImageGray.size.width, 0)];
    [graphs3 changeFrameOrigin: CGPointMake(rectImageGray.origin.x, rectImageGray.origin.y + (rectImageGray.size.height))];
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //[graphs3 setHeight:img1Width];
        
        graphs3.frame = rectImageGray;
        graphs3.alpha = 1.0;

    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
        }];
    }];
    
}




-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"safety03_ref.png"]];
        [referenceView setFrame:CGRectMake(90, 380, 500, 130)];
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
