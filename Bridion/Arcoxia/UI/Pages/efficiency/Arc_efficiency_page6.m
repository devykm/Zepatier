//
//  Arc_efficiency_page6.m
//  Arcoxia
//
//  Created by ykm dev on 12/2/12.
//
//

#import "Arc_efficiency_page6.h"
#import "InfoControl.h"

@implementation Arc_efficiency_page6

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage5;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_efficiency_page6_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_efficiency_page6_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(30, 330, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_efficiency_page6_info.png" WithOrientation:InfoControlOrientationRIGHT];
    info.arrowSideMargin = 0;
    [self.container addSubview:info];
    
    InfoControl *info2 = [[InfoControl alloc] initWithFrame:CGRectMake(255, 34, 80, 45) BgImageName:nil textImageName:@"arc_efficiency_page6_pop1.png" WithOrientation:InfoControlOrientationBOTTOM] ;
    info2.arrowTopMargin = -30;
    [self.container addSubview:info2];
    
    InfoControl *info3 = [[InfoControl alloc] initWithFrame:CGRectMake(110, 70, 80, 45) BgImageName:nil textImageName:@"arc_efficiency_page6_pop1.png" WithOrientation:InfoControlOrientationBOTTOM];
    info3.arrowTopMargin = -30;
    [self.container addSubview:info3];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];
}



@end