//
//  Arc_cv_page2.m
//  Arcoxia
//
//  Created by ykm dev on 12/3/12.
//
//

#import "Arc_cv_page2.h"

@implementation Arc_cv_page2

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage14;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_cv_page2_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeLeft];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_cv_page2_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];
    
    self.arrowSideMargin = 10;
}

-(UIImage*) getRotateImage
{
    return [UIImage imageNamed:@"arc_cv_page2_rotate.png"];
}

-(NSString*) getRotateInfo
{
    return @"arc_cv_page2_info.png";
}

-(void) rotateViewDidShow
{
    [rotateView.info setY:rotateView.info.y + 15];
}



@end