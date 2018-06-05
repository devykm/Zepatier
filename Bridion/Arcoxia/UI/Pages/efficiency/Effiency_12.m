//
//  Effiency_12.m
//  
//
//  Created by iOS Developer on 16/12/2015.
//
//

#import "Effiency_12.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
@implementation Effiency_12

{
    UIImageView *referenceView;
    UIImageView *pie;
    UIImageView *summary;
    UIButton *infoButton;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPageEffiency12;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"efficiency12_tittle.png"]];
    [self.imgTitle setContentMode:UIViewContentModeLeft];
    
    pie = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 400, 370)];
    [pie setImage:[UIImage imageNamed:@"efficiency12_pie.png"]];
    [pie setContentMode:UIViewContentModeScaleAspectFit];
    pie.alpha = 0.0;
    [self.container addSubview:pie];
    
    summary = [[UIImageView alloc] initWithFrame:CGRectMake(30, - 179, 880, 750)];
    [summary setImage:[UIImage imageNamed:@"efficiency12_text.png"]];
    [summary setContentMode:UIViewContentModeScaleAspectFit];
    summary.alpha = 0.0;
    [self.container addSubview:summary];
    

    
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 423, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
        [summary setAlpha:1.0];
        [pie setAlpha:1.0];
        

        
    
    }];

//    leftPercent = [[UIImageView alloc]initWithFrame:CGRectMake(80, 400, 230, 70)];
//    leftPercent.image = [UIImage imageNamed:@"efficiency11_66percent.png"];
//    leftPercent.alpha = 0.0;
//    //[leftPercent setContentMode:UIViewContentModeScaleAspectFit];
//    
//    [self.container addSubview:leftPercent];
//    
//    rightPercent = [[UIImageView alloc]initWithFrame:CGRectMake(530, 400, 230, 70)];
//    rightPercent.image = [UIImage imageNamed:@"efficiency11_52percent.png"];
//    rightPercent.alpha = 0.0;
//    //[rightPercent setContentMode:UIViewContentModeScaleAspectFit];
//    
//    [self.container addSubview:rightPercent];
//    
//    
//    [UIView animateWithDuration:1.0 animations:^{
//        leftPercent.frame = CGRectMake(80, 280, 350, 70);
//        leftPercent.alpha = 1.0;
//        
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1.0 animations:^{
//            rightPercent.frame = CGRectMake(530, 280, 350, 70);
//            rightPercent.alpha = 1.0;
//        }];
//    }];
//    
//    
//    womanTouch = [[UIView alloc]initWithFrame:CGRectMake(85, 125, 100, 90)];
//    womanTouch.userInteractionEnabled = YES;
//    
//    UITapGestureRecognizer *womanTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(womanTouch)];
//    [womanTouch addGestureRecognizer:womanTap];
//    
//    [self addSubview:womanTouch];
//    
//    
    
    
}
-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"efficiency12_ref.png"]];
        [referenceView setFrame:CGRectMake(100, 350, 520, 150)];
        //referenceView.contentMode = UIViewContentModeScaleAspectFit;
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
