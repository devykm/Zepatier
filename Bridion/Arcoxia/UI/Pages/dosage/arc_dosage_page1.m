//
//  arc_dosage_page1.m
//  Arcoxia
//
//  Created by ykm dev on 11/29/12.
//
//

#import "arc_dosage_page1.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"

@implementation arc_dosage_page1

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage22;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_dosage1_title.png"]];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setOrigin:CGPointMake(0, 0)];
    [imgBack setImage:[UIImage imageNamed:@"dosage01_slide.png"]];
    [imgBack setContentMode:UIViewContentModeScaleAspectFit];
    [self.container addSubview:imgBack];

    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(830, 30, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_dosage1_info.png" WithOrientation:InfoControlOrientationLEFT] ;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];
}




@end
