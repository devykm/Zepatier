//
//  Arc_efficiency_page1.m
//  Arcoxia
//
//  Created by ykm dev on 12/2/12.
//
//

#import "Arc_efficiency_page1.h"
#import "InfoControl.h"

@implementation Arc_efficiency_page1

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage0;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_efficiency_page1_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_efficiency_page1_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    UIImageView *imgBack4 = [[UIImageView alloc] initWithFrame:CGRectMake(582, 131, 122, 124)];
    [imgBack4 setImage:[UIImage imageNamed:@"arc_efficiency_page1_back_4.png"]];
    [imgBack4 setAlpha:0];
    [imgBack4 setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack4];

    
    UIImageView *imgBack8 = [[UIImageView alloc] initWithFrame:CGRectMake(151, 131, 183, 124)];
    [imgBack8 setImage:[UIImage imageNamed:@"arc_efficiency_page1_back_8.png"]];
    [imgBack8 setAlpha:0];
    [imgBack8 setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack8];

    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(850, 0, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_efficiency_page1_info.png" WithOrientation:InfoControlOrientationLEFT] ;
    info.arrowSideMargin = -4;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 animations:^(void) {
            [imgBack4 setAlpha:1];
            [imgBack8 setAlpha:1];
        } completion:^(BOOL finished) {
            
        }];
    }];
}



@end
