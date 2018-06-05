//
//  Arc_efficiency_page8.m
//  Arcoxia
//
//  Created by ykm dev on 12/2/12.
//
//

#import "Arc_efficiency_page8.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"

@implementation Arc_efficiency_page8

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage7;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_efficiency_page8_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_efficiency_page8_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    UIImageView *imgGraph = [[UIImageView alloc] initWithFrame:CGRectMake(140, 63, 537, 190)];
    [imgGraph setImage:[UIImage imageNamed:@"arc_efficiency_page8_graph.png"]];
    [imgGraph setContentMode:UIViewContentModeTopLeft];
    [imgGraph setWidth:0];
    [imgGraph setClipsToBounds:YES];
    [self.container addSubview:imgGraph];
    
    UIImageView *imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(812, 63, 47, 231)] ;
    [imgArrow setImage:[UIImage imageNamed:@"arc_efficiency_page8_arrow.png"]];
    [imgArrow setContentMode:UIViewContentModeScaleToFill];
    [imgArrow setHeight:0];
    [imgArrow setClipsToBounds:YES];
    [self.container addSubview:imgArrow];
    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(35, 300, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_efficiency_page8_info.png" WithOrientation:InfoControlOrientationRIGHT] ;
    info.arrowSideMargin = 15;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 animations:^(void) {
            [imgGraph setWidth:537];
            [imgArrow setHeight:231];
        } completion:^(BOOL finished) {
            
        }];
    }];
}


@end