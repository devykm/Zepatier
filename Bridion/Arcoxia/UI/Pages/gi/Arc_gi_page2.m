//
//  Arc_gi_page2.m
//  Arcoxia
//
//  Created by ykm dev on 12/3/12.
//
//

#import "Arc_gi_page2.h"
#import "InfoControl.h"

@implementation Arc_gi_page2

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage18;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_gi_page2_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeLeft];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_gi_page2_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(850, 0, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_gi_page2_info.png" WithOrientation:InfoControlOrientationLEFT];
    info.arrowSideMargin = 5;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];
}




@end
