//
//  Arc_cv_page3.m
//  Arcoxia
//
//  Created by ykm dev on 12/3/12.
//
//

#import "Arc_cv_page3.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"

@implementation Arc_cv_page3

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage15;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_cv_page3_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_cv_page3_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    UIImageView *imgGraph = [[UIImageView alloc] initWithFrame:CGRectMake(130, 210, 270, 58)];
    [imgGraph setImage:[UIImage imageNamed:@"arc_cv_page3_graph1.png"]];
    [imgGraph setContentMode:UIViewContentModeTopLeft];
    [imgGraph setWidth:0];
    [imgGraph setClipsToBounds:YES];
    [self.container addSubview:imgGraph];
    
    UIImageView *imgGraph2 = [[UIImageView alloc] initWithFrame:CGRectMake(544, 210, 258, 48)];
    [imgGraph2 setImage:[UIImage imageNamed:@"arc_cv_page3_graph2.png"]];
    [imgGraph2 setContentMode:UIViewContentModeTopLeft];
    [imgGraph2 setWidth:0];
    [imgGraph2 setClipsToBounds:YES];
    [self.container addSubview:imgGraph2];
    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(850, 0, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_cv_page3_info.png" WithOrientation:InfoControlOrientationLEFT] ;
    info.arrowSideMargin = 25;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 animations:^(void) {
            [imgGraph setWidth:270];
            [imgGraph2 setWidth:258];
        } completion:^(BOOL finished) {
            
        }];
    }];
}




@end