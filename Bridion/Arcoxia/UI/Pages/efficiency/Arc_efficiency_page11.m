//
//  Arc_efficiency_page11.m
//  Arcoxia
//
//  Created by ykm dev on 12/2/12.
//
//

#import "Arc_efficiency_page11.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"

@implementation Arc_efficiency_page11

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage10;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_efficiency_page11_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_efficiency_page11_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    UIImageView *imgGraph1 = [[UIImageView alloc] initWithFrame:CGRectMake(558, 63, 125, 242)];
    [imgGraph1 setImage:[UIImage imageNamed:@"arc_efficiency_page11_graph1.png"]];
    [imgGraph1 setContentMode:UIViewContentModeBottomLeft];
    [imgGraph1 setHeight:0];
    [imgGraph1 setClipsToBounds:YES];
    [self.container addSubview:imgGraph1];
    
    UIImageView *imgGraph2 = [[UIImageView alloc] initWithFrame:CGRectMake(372, 63, 127, 218)];
    [imgGraph2 setImage:[UIImage imageNamed:@"arc_efficiency_page11_graph2.png"]];
    [imgGraph2 setContentMode:UIViewContentModeBottomLeft];
    [imgGraph2 setHeight:0];
    [imgGraph2 setClipsToBounds:YES];
    [self.container addSubview:imgGraph2];
    
    UIImageView *imgGraph3 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 63, 127, 133)];
    [imgGraph3 setImage:[UIImage imageNamed:@"arc_efficiency_page11_graph3.png"]];
    [imgGraph3 setContentMode:UIViewContentModeBottomLeft];
    [imgGraph3 setHeight:0];
    [imgGraph3 setClipsToBounds:YES];
    [self.container addSubview:imgGraph3];
    
    UIImageView *imgArrow = [[UIImageView alloc] initWithFrame:CGRectMake(812, 64, 47, 259)];
    [imgArrow setImage:[UIImage imageNamed:@"arc_efficiency_page11_arrow.png"]];
    [imgArrow setContentMode:UIViewContentModeScaleToFill];
    [imgArrow setHeight:0];
    [imgArrow setClipsToBounds:YES];
    [self.container addSubview:imgArrow];
    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(35, 300, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_efficiency_page11_info.png" WithOrientation:InfoControlOrientationRIGHT] ;
    info.arrowSideMargin = 0;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 animations:^(void) {
            [imgGraph1 setHeight:242];
            [imgGraph2 setHeight:218];
            [imgGraph3 setHeight:133];
            [imgArrow setHeight:259];
        } completion:^(BOOL finished) {
            
        }];
    }];
}


@end