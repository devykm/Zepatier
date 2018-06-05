//
//  Safety_05.m
//  
//
//  Created by iOS Developer on 17/12/2015.
//
//

#import "Safety_05.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
#import "ExtendUIView.h"
@implementation Safety_05

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
        self.statisticId = ArcoxiaStatistictPageSafety05;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    //[self.imgTitle setImage:[UIImage imageNamed:@"safety07_tittle.png"]];
    //[self.imgTitle setContentMode:UIViewContentModeLeft];
    
    graph = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.container.bounds.size.width +30, self.container.bounds.size.height + 70)];
    [graph setImage:[UIImage imageNamed:@"safety08_slide.png"]];
    [graph setContentMode:UIViewContentModeScaleAspectFit];
    graph.userInteractionEnabled = YES;
    [self addSubview:graph];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showInfo)];
    [graph addGestureRecognizer:tap];
    
    
//    graphs3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"safety07_lines.png"]];
//    [graphs3 setContentMode:UIViewContentModeBottomLeft];
//    [graphs3 setClipsToBounds:YES];
//    CGFloat img1Width = graphs3.width;
//    [graphs3 setFrame:CGRectMake(170, 72, graphs3.width, graphs3.height)];
//    [graphs3 setWidth:0];
//    [self addSubview: graphs3];

    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
        
    }];
    
}



-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"safety08_highlight.png"]];
        [referenceView setFrame:CGRectMake(20, 410, 700, 300)];
        referenceView.center = graph.center;
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
