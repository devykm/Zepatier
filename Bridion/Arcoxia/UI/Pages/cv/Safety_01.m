//
//  Safety_01.m
//  
//
//  Created by iOS Developer on 16/12/2015.
//
//

#import "Safety_01.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
@implementation Safety_01

{
    UIImageView *referenceView;
    UIImageView *graph;
    UIImageView *nsaid;
    UIButton *infoButton;
    UIImageView *coxib;
    int counter ;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPageSafety01;
    }
    return self;
}

-(void) pageDidAppear
{
    counter = 0;
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"safety01_tittle.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    graph = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    [graph setImage:[UIImage imageNamed:@"safety01_slide.png"]];
    [graph setContentMode:UIViewContentModeScaleAspectFit];
    [self.container addSubview:graph];
    
    nsaid = [[UIImageView alloc]initWithFrame:CGRectMake(260, 60, 420, 150)];
    nsaid.image = [UIImage imageNamed:@"safety01_nsaid.png"];
    [nsaid setAlpha:0.0];
    [self.container addSubview:nsaid];
    
    coxib = [[UIImageView alloc]initWithFrame:CGRectMake(250, 60, 440, 150)];
    coxib.image = [UIImage imageNamed:@"safety01_coxib.png"];
    [coxib setAlpha:0.0];

    [self.container addSubview:coxib];
    
//    summary = [[UIImageView alloc] initWithFrame:CGRectMake(30, - 179, 880, 750)];
//    [summary setImage:[UIImage imageNamed:@"efficiency12_text.png"]];
//    [summary setContentMode:UIViewContentModeScaleAspectFit];
//    summary.alpha = 0.0;
//    [self.container addSubview:summary];
    
    //safety01_nsaid
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showGraph)];
    [self.container addGestureRecognizer:tap];
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(45, 413, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
        
    }];
    
    
}

-(void)showGraph{
    counter ++;
    
    
    if(counter == 1)
    {
      [UIView animateWithDuration:1.0 animations:^{
          [nsaid setAlpha:1.0];
      }];
        
        
    }
    else if(counter == 2)
    {
        [UIView animateWithDuration:0.4 animations:^{
            [nsaid setAlpha:0.0];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 animations:^{
                [coxib setAlpha:1.0];
            }];

        }];
        
    }
    else if(counter == 3)
    {
        [UIView animateWithDuration:0.4 animations:^{
            [coxib setAlpha:0.0];

        }];
        counter = 0;
        
    }
    
    
    
    
    
    
    
    
}
-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"safety01_ref.png"]];
        [referenceView setFrame:CGRectMake(90, 360, 490, 140)];
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
