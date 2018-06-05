//
//  ArcOpenBoxBasePageView.m
//  Arcoxia
//
//  Created by ykm dev on 12/3/12.
//
//

#import "ArcOpenBoxBasePageView.h"
#import "FTAnimation+UIView.h"
#import "InfoControl.h"

#define BOX_CLOSE CGRectMake(20, 42, 301, 310)
#define BOX_OPEN CGRectMake(20, 42, 860, 330)

@implementation ArcOpenBoxBasePageView

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:page size:size]) {
	}
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    
    imgBox = [[UIButton alloc] initWithFrame:BOX_CLOSE];
    [imgBox setAdjustsImageWhenHighlighted:NO];
    [imgBox addTarget:self action:@selector(boxClick:) forControlEvents:UIControlEventTouchUpInside];
    [imgBox setBackgroundImage:[[UIImage imageNamed:@"arc_openbox.png"] stretchableImageWithLeftCapWidth:50 topCapHeight:50] forState:UIControlStateNormal];
    [imgBox setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBox];
    
    imgBack1 = [[UIImageView alloc] initWithFrame:self.container.bounds];
    [imgBack1 setImage:[self getBackImage1]];
    [imgBack1 setContentMode:UIViewContentModeTopRight];
    [self.container addSubview:imgBack1];
    
    self.info = [[InfoControl alloc] initWithFrame:CGRectMake(834, 0, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:[self getInfo1] WithOrientation:InfoControlOrientationLEFT] ;
    self.info.arrowSideMargin = 10;
    [self.container addSubview:self.info];
}

-(void) boxClick:(id)sender
{
    if(_isAnimating) return;
    
    if(_isOpen) {
        _isAnimating = YES;
        _isOpen = NO;
        
        self.info.textImageName = [self getInfo1];
        [imgBack2 fadeOut:0.3 delegate:nil];
        [UIView animateWithDuration:0.5 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
            [imgBox setFrame:BOX_CLOSE];
        } completion:^(BOOL finished) {
            [imgBack1 fadeIn:0.3 delegate:nil];
            _isAnimating = NO;
        }];
        
    }
    else {
        _isAnimating = YES;
        _isOpen = YES;
        if(imgBack2 == nil) {
            imgBack2 = [[UIImageView alloc] initWithFrame:self.container.bounds];
            [imgBack2 setImage:[self getBackImage2]];
            [imgBack2 setContentMode:UIViewContentModeTopRight];
            //[imgBack2 setUserInteractionEnabled:YES];
            [imgBack2 setHidden:YES];
            [self.container addSubview:imgBack2];
        }
        
        
        self.info.textImageName = [self getInfo2];
        [imgBack1 fadeOut:0.3 delegate:nil];
        [UIView animateWithDuration:0.5 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
            [imgBox setFrame:BOX_OPEN];
        } completion:^(BOOL finished) {
            [imgBack2 fadeIn:0.3 delegate:nil];
            _isAnimating = NO;
        }];
    }
}


-(UIImage*) getBackImage1
{
    return nil;
}
-(UIImage*) getBackImage2
{
    return nil;
}
-(NSString*) getInfo1
{
    return nil;
}
-(NSString*) getInfo2
{
    return nil;
}




@end
