//
//  Arc_efficiency_page5.m
//  Arcoxia
//
//  Created by ykm dev on 12/2/12.
//
//

#import "Arc_efficiency_page5.h"

@implementation Arc_efficiency_page5

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPage4;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"arc_efficiency_page5_title.png"]];
    [self.imgTitle setContentMode:UIViewContentModeLeft];
    
    UIImageView *imgBack = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack setImage:[UIImage imageNamed:@"arc_efficiency_page5_back.png"]];
    [imgBack setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack];

    
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
    }];
    
    self.arrowSideMargin = 20;
}

-(UIImage*) getRotateImage
{
    return [UIImage imageNamed:@"arc_efficiency_page5_rotate.png"];
}

-(NSString*) getRotateInfo
{
    return @"arc_efficiency_page5_info.png";
}


@end
