//
//  Arc_efficiency_page13.m
//  Arcoxia
//
//  Created by ykm dev on 12/3/12.
//
//

#import "Arc_efficiency_page13.h"
#import "InfoControl.h"
#import "UIView-Extensions.h"

@implementation Arc_efficiency_page13

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage12;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_efficiency_page13_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeRight];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_efficiency_page13_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    UIImageView *imgGraph1 = [[UIImageView alloc] initWithFrame:CGRectMake(161, 321, 125, 234)];
    [imgGraph1 setImage:[UIImage imageNamed:@"arc_efficiency_page13_graph1.png"]];
    [imgGraph1 setContentMode:UIViewContentModeTopLeft];
    [imgGraph1 setHeight:0];
    [imgGraph1 setClipsToBounds:YES];
    [self.container addSubview:imgGraph1];
    
    UIImageView *imgGraph2 = [[UIImageView alloc] initWithFrame:CGRectMake(352, 321, 127, 240)];
    [imgGraph2 setImage:[UIImage imageNamed:@"arc_efficiency_page13_graph2.png"]];
    [imgGraph2 setContentMode:UIViewContentModeTopLeft];
    [imgGraph2 setHeight:0];
    [imgGraph2 setClipsToBounds:YES];
    [self.container addSubview:imgGraph2];
    
    UIImageView *imgGraph3 = [[UIImageView alloc] initWithFrame:CGRectMake(524, 321, 127, 159)];
    [imgGraph3 setImage:[UIImage imageNamed:@"arc_efficiency_page13_graph3.png"]];
    [imgGraph3 setContentMode:UIViewContentModeTopLeft];
    [imgGraph3 setHeight:0];
    [imgGraph3 setClipsToBounds:YES];
    [self.container addSubview:imgGraph3];
    
    UIImageView *imgGraph4 = [[UIImageView alloc] initWithFrame:CGRectMake(700, 321, 127, 98)];
    [imgGraph4 setImage:[UIImage imageNamed:@"arc_efficiency_page13_graph4.png"]];
    [imgGraph4 setContentMode:UIViewContentModeTopLeft];
    [imgGraph4 setHeight:0];
    [imgGraph4 setClipsToBounds:YES];
    [self.container addSubview:imgGraph4];
    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(35, 300, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:@"arc_efficiency_page13_info.png" WithOrientation:InfoControlOrientationRIGHT];
    info.arrowSideMargin = 0;
    [self.container addSubview:info];
    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8 animations:^(void) {
            CGRect rect1 = imgGraph1.frame;
            rect1.size.height = 234;
            rect1.origin.y = 321-234;
            imgGraph1.frame = rect1;
            
            CGRect rect2 = imgGraph2.frame;
            rect2.size.height = 240;
            rect2.origin.y = 321-240;
            imgGraph2.frame = rect2;
            
            CGRect rect3 = imgGraph3.frame;
            rect3.size.height = 159;
            rect3.origin.y = 321-159;
            imgGraph3.frame = rect3;
  
            CGRect rect4 = imgGraph4.frame;
            rect4.size.height = 98;
            rect4.origin.y = 321-98;
            imgGraph4.frame = rect4;
        } completion:^(BOOL finished) {
            
        }];
    }];
}



@end