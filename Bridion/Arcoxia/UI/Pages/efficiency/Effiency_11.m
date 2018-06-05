//
//  Effiency_11.m
//  
//
//  Created by iOS Developer on 16/12/2015.
//
//

#import "Effiency_11.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"
@implementation Effiency_11
{
    UIImageView *referenceView;
    UIImageView *leftPercent;
    UIImageView *rightPercent;
    UIView *womanTouch;
    UIButton *infoButton;
    UIImageView *womanBubble;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPageEffiency11;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"efficiency11_tittle.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setOrigin:CGPointMake(0, 0)];
    [imgBack setImage:[UIImage imageNamed:@"efficiency11_slide.png"]];
    [imgBack setContentMode:UIViewContentModeRight];
    [self.container addSubview:imgBack];
    
    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 435, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];
    
    leftPercent = [[UIImageView alloc]initWithFrame:CGRectMake(80, 400, 250, 80)];
    leftPercent.image = [UIImage imageNamed:@"efficiency11_66percent.png"];
    leftPercent.alpha = 0.0;

    [self.container addSubview:leftPercent];
    
    rightPercent = [[UIImageView alloc]initWithFrame:CGRectMake(500, 400, 250, 80)];
    rightPercent.image = [UIImage imageNamed:@"efficiency11_52percent.png"];
    rightPercent.alpha = 0.0;

    [self.container addSubview:rightPercent];

    
    [UIView animateWithDuration:1.0 animations:^{
        leftPercent.frame = CGRectMake(80, 280, 400, 80);
        leftPercent.alpha = 1.0;
        
    } completion:^(BOOL finished) {
       [UIView animateWithDuration:1.0 animations:^{
           rightPercent.frame = CGRectMake(500, 280, 400, 80);
           rightPercent.alpha = 1.0;
       }];
    }];
    
    
    womanTouch = [[UIView alloc]initWithFrame:CGRectMake(85, 125, 100, 90)];
    womanTouch.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *womanTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(womanTouch)];
    [womanTouch addGestureRecognizer:womanTap];
    
    [self addSubview:womanTouch];
    
    
    
    
}
-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"efficiency11_ref.png"]];
        [referenceView setFrame:CGRectMake(60, 265, 720, 250)];
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

-(void)womanTouch{
    
    if (womanBubble == nil || womanBubble.alpha == 0.0f){
        womanBubble = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"efficiency11_woman_touch.png"]];
        [womanBubble setFrame:CGRectMake(180, -50, 700 , 350)];
        womanBubble.contentMode = UIViewContentModeScaleAspectFit;
        [self.container addSubview:womanBubble];
        [womanBubble setAlpha:0.0f];
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [womanBubble setAlpha:1.0f];
            
        } completion:^(BOOL finished) {
            
            
        }];
    }else{
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [womanBubble setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [womanBubble removeFromSuperview];
            
        }];
        
    }
    
}



@end
