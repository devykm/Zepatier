//
//  Arc_timer_page1.m
//  Arcoxia
//
//  Created by ykm dev on 11/29/12.
//
//

#import "Arc_timer_page1.h"
#import "InfoControl.h"

@implementation Arc_timer_page1

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage20;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_time1_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeLeft];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_time1_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(830, 30, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_time1_info.png" WithOrientation:InfoControlOrientationLEFT] ;
    info.arrowSideMargin = 8;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];
}



@end
