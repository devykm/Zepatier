//
//  Arc_gi_page1.m
//  Arcoxia
//
//  Created by ykm dev on 12/3/12.
//
//

#import "Arc_gi_page1.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
@implementation Arc_gi_page1
{
    UIImageView * referenceView;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage17;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_gi_page1_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setOrigin:CGPointMake(0, 0)];
    [imgBack setImage:[UIImage imageNamed:@"arc_gi_page1_back2@2x.png"]];
    [imgBack setContentMode:UIViewContentModeRight];
    [self.container addSubview:imgBack];
    //arc_info_btn
    //self.info.arrowSideMargin = 12;
    
    UIButton *infoButton = [[UIButton alloc]initWithFrame:CGRectMake(865, 65, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];

    
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];
}

-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arc_gi_page1_info2.png"]];
        [referenceView setFrame:CGRectMake(345, 20, 650, 180)];
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
