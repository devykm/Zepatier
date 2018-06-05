//
//  Arc_efficiency_page14.m
//  Arcoxia
//
//  Created by ykm dev on 12/20/12.
//
//

#import "Arc_efficiency_page14.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"

@implementation Arc_efficiency_page14

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage23;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_efficiency_page14_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"efficiency06_slide.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    //POP
    pop = [[UIView alloc] initWithFrame:CGRectMake(700, 131, 156, 95)];
    [pop setBackgroundColor:[UIColor clearColor]];
    [pop setClipsToBounds:NO];
    [pop setAutoresizesSubviews:YES];
    [self.container addSubview:pop];

    UIImageView *imgPop = [[UIImageView alloc] initWithFrame:pop.bounds];
    [imgPop setImage:[UIImage imageNamed:@"arc_efficiency_page14_pop.png"]];
    [imgPop setContentMode:UIViewContentModeScaleToFill];
    [imgPop setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [pop addSubview:imgPop];

    
    btnPlus = [[UIButton alloc] initWithFrame:CGRectMake(127, 0, 40, 40)];
    [btnPlus addTarget:self action:@selector(tapClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnPlus setImage:[UIImage imageNamed:@"arc_efficiency_page14_pop_plus_s.png"] forState:UIControlStateNormal];
    [btnPlus setImage:[UIImage imageNamed:@"arc_efficiency_page14_pop_plus.png"] forState:UIControlStateSelected];
    [btnPlus setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
    [pop addSubview:btnPlus];
    
    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(840, 40, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_efficiency_page14_info.png" WithOrientation:InfoControlOrientationLEFT] ;
    info.arrowSideMargin = 0;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    } completion:^(BOOL finished) {
       
    }];
}

-(void) tapClick:(id)sender
{
    [btnPlus setSelected:!btnPlus.isSelected];
    if(btnPlus.isSelected) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
            CGRect rect1 = pop.frame;
            rect1.size.height = 237;
            rect1.size.width = 417;
            rect1.origin.y = 110;
            rect1.origin.x = 400;
            pop.frame = rect1;
        } completion:^(BOOL finished) {
            
        }];
    }
    else {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
            CGRect rect1 = pop.frame;
            rect1.size.height = 95;
            rect1.size.width = 156;
            rect1.origin.y = 131;
            rect1.origin.x = 700;
            pop.frame = rect1;
        } completion:^(BOOL finished) {
            
        }];
    }
}



@end