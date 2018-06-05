//
//  Effiency_10.m
//  
//
//  Created by iOS Developer on 16/12/2015.
//
//

#import "Effiency_10.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
@implementation Effiency_10

{
    UIImageView *referenceView;
    UIImageView *leftGraph;
    UIImageView *rightGraph;
    UIView *tapLeftView;
    UIView *tapRightView;
    UIButton *infoButton;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPageEffiency10;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"efficiency10_tittle.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setOrigin:CGPointMake(0, 0)];
    [imgBack setImage:[UIImage imageNamed:@"efficiency10_slide.png"]];
    [imgBack setContentMode:UIViewContentModeRight];
    [self.container addSubview:imgBack];
    //arc_info_btn
    //self.info.arrowSideMargin = 12;
    
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 435, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];
    
    tapLeftView = [[UIView alloc]initWithFrame:CGRectMake(110, 200, 300, 250)];
    //tapLeftView.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showLeftGraph)];
    [tapLeftView addGestureRecognizer:leftTap];
    tapLeftView.userInteractionEnabled = YES;
    [self addSubview:tapLeftView];
    
    
    tapRightView = [[UIView alloc]initWithFrame:CGRectMake(530, 200, 300, 250)];
    //tapRightView.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showRightGraph)];
    [tapRightView addGestureRecognizer:rightTap];
    tapRightView.userInteractionEnabled = YES;
    [self addSubview:tapRightView];

    
}
-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"efficiency10_ref.png"]];
        [referenceView setFrame:CGRectMake(60, 375, 620, 150)];
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

-(void)showLeftGraph{
    
    if (leftGraph == nil || leftGraph.alpha == 0.0f){
        leftGraph = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"efficiency10_left_graph.png"]];
        [leftGraph setFrame:CGRectMake(-15, -10, self.container.bounds.size.width+30, self.container.bounds.size.height+10)];
        leftGraph.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.container addSubview:leftGraph];
        leftGraph.clipsToBounds = YES;
        [leftGraph setAlpha:0.0f];
        tapLeftView.frame = CGRectMake(-15, -10, self.container.bounds.size.width+30, self.container.bounds.size.height+10);
        [self bringSubviewToFront:infoButton];
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [leftGraph setAlpha:1.0f];
            
        } completion:^(BOOL finished) {
            
            
        }];
    }else{
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [leftGraph setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [leftGraph removeFromSuperview];
            tapLeftView.frame = CGRectMake(110, 200, 300, 250);

        }];
        
    }
    
}

-(void)showRightGraph{
    
    if (rightGraph == nil || rightGraph.alpha == 0.0f){
        rightGraph = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"efficiency10_right_graph.png"]];
        [rightGraph setFrame:CGRectMake(-15, -10, self.container.bounds.size.width +30, self.container.bounds.size.height+10)];
        rightGraph.contentMode = UIViewContentModeScaleAspectFit;
        [self.container addSubview:rightGraph];
        rightGraph.clipsToBounds = YES;

        [rightGraph setAlpha:0.0f];
        tapRightView.frame = CGRectMake(-15, -10, self.container.bounds.size.width+30, self.container.bounds.size.height+10);
        [self bringSubviewToFront:infoButton];

        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [rightGraph setAlpha:1.0f];
            
        } completion:^(BOOL finished) {
            
            
        }];
    }else{
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [rightGraph setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [rightGraph removeFromSuperview];
            tapRightView.frame = CGRectMake(530, 200, 300, 250);

        }];
        
    }
    
}



@end
