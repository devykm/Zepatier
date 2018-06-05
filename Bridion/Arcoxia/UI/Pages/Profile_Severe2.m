//
//  Profile_Severe2.m
//  
//
//  Created by iOS Developer on 13/12/2015.
//
//

#import "Profile_Severe2.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
@implementation Profile_Severe2

{
    UIImageView *imgTreat;
    UIImageView *treatArrow;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictProfile04;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    //    [self.container setAlpha:0];
    //    [self.imgTitle setImage:[UIImage imageNamed:@"arc_dosage1_title.png"]];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setOrigin:CGPointMake(0, 0)];
    [imgBack setImage:[UIImage imageNamed:@"prof_Severe_and_limiting2@2x..png"]];
    [imgBack setContentMode:UIViewContentModeRight];
    [self.container addSubview:imgBack];
    
    self.imgProf = [[UIImageView alloc] initWithFrame:CGRectMake(0, -60, 70, 120)];
    self.imgProf.contentMode = UIViewContentModeScaleAspectFit;
    [self.imgProf setImage:[UIImage imageNamed:@"prof_10_years.png"]];
    [self.container addSubview:self.imgProf];
    
    UIView * gestureFrame = [[UIView alloc]initWithFrame:CGRectMake(690, 325, 75, 30)];
    gestureFrame.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer *openTreat = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openTreat:)];
    
    [gestureFrame addGestureRecognizer:openTreat];
    [self.container addSubview:gestureFrame];
    
    
    //    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(830, 30, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_dosage1_info.png" WithOrientation:InfoControlOrientationLEFT] ;
    //    [self.container addSubview:info];
    //
    //    [UIView animateWithDuration:0.4 animations:^(void) {
    //        [self.container setAlpha:1.0];
    //    }];
}

-(void)openTreat:(UITapGestureRecognizer *)sender{
    
    if(imgTreat == nil || imgTreat.alpha == 0.0){
        imgTreat = [[UIImageView alloc] initWithFrame:CGRectMake(20, -60, 530, 530)];
        [imgTreat setImage:[UIImage imageNamed:@"prof_Severe_and_limiting2_treat@2x..png"]];
        imgTreat.contentMode = UIViewContentModeScaleAspectFit;
        [self.container addSubview:imgTreat];
        [imgTreat setAlpha:0.0];
        [self.container bringSubviewToFront:self.imgProf];
        treatArrow = [[UIImageView alloc]initWithFrame:CGRectMake(552, 333, 20, 20)];
        [treatArrow setImage:[UIImage imageNamed:@"red_arrow_treat"]];
        treatArrow.contentMode = UIViewContentModeScaleAspectFit;
        [treatArrow setAlpha:0.0];
        
        [self.container addSubview:treatArrow];
        
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [imgTreat setAlpha:1.0];
            [treatArrow setAlpha:1.0];
            
        } completion:^(BOOL finished) {
            
            
        }];
        
    }else{
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [imgTreat setAlpha:0.0];
            [treatArrow setAlpha:0.0];
        } completion:^(BOOL finished) {
            [imgTreat removeFromSuperview];
            [treatArrow removeFromSuperview];
        }];
        
        
    }
    
    
    
}


@end
