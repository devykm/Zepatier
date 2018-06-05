//
//  Arc_cv_page4.m
//  Arcoxia
//
//  Created by ykm dev on 12/3/12.
//
//

#import "Arc_cv_page4.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"

@implementation Arc_cv_page4

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage16;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_cv_page4_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_cv_page4_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    UIImageView *imgGraph1 = [[UIImageView alloc] initWithFrame:CGRectMake(319, 176, 127, 75)] ;
    [imgGraph1 setImage:[UIImage imageNamed:@"arc_cv_page4_graph1.png"]];
    [imgGraph1 setContentMode:UIViewContentModeBottomLeft];
    [imgGraph1 setHeight:0];
    [imgGraph1 setClipsToBounds:YES];
    [self.container addSubview:imgGraph1];
    
    UIImageView *imgGraph2 = [[UIImageView alloc] initWithFrame:CGRectMake(500, 176, 125, 26)];
    [imgGraph2 setImage:[UIImage imageNamed:@"arc_cv_page4_graph2.png"]];
    [imgGraph2 setContentMode:UIViewContentModeBottomLeft];
    [imgGraph2 setHeight:0];
    [imgGraph2 setClipsToBounds:YES];
    [self.container addSubview:imgGraph2];
    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(834, 40, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_cv_page4_info.png" WithOrientation:InfoControlOrientationLEFT] ;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 animations:^(void) {
            [imgGraph1 setHeight:75];
            [imgGraph2 setHeight:26];
        } completion:^(BOOL finished) {
            
        }];
    }];
}



@end
