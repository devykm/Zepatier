//
//  ZostavaxBase.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "BridionBase.h"
#import "UIView-Extensions.h"
#import "BridionInfoControl.h"
@implementation BridionBase
{
    UIImage *buttonImageInfo;
    UIButton *buttonInfoText;
    BOOL isInfoShowing;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super init])
    {
        self.statisticId = page;
        [self setFrame:CGRectMake(0, 0, size.width, size.height)];
        [self setClipsToBounds:YES];

        self.imgBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self.imgBack setContentMode:UIViewContentModeBottomLeft];
        [self addSubview:self.imgBack];

    }
    return self;
}

-(void) bridionZoomItemWillOpen:(BridionZoomItem*)sender
{
    
}

-(void) setRInfo:(NSString*)image
{
    self.infoPlus = [[BridionInfoControl alloc] initWithFrame:CGRectMake(25, 620, 50, 50) textImageName:image imageToPress:@"bridion_r.png"];
    [self addSubview:self.infoPlus];
}

-(void) setPlusInfo:(NSString*)image
{
    self.infoPlus = [[BridionInfoControl alloc] initWithFrame:CGRectMake(85, 620, 50, 50) textImageName:image imageToPress:@"bridion_+.png"];
    [self addSubview:self.infoPlus];
}

- (void) addAndAnimateDownImageWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file
{
    UIImageView *imgGraph = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, height)];
    
    [imgGraph setImage:[UIImage imageNamed:file]];
    [imgGraph setContentMode:UIViewContentModeTopLeft];
    [imgGraph setClipsToBounds:YES];
    [self addSubview:imgGraph];
    
    [imgGraph setHeight:0];
    [UIView animateWithDuration:0.4 animations:^(void)
     {
         
     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.8 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut  animations:^(void) {
                             [imgGraph setHeight:height];
                         } completion:^(BOOL finished) {
                         }];
                     }];
}

- (void) addAndAnimateUpImageWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file
{
    UIImageView *imgGraph = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, height)];
    
    [imgGraph setImage:[UIImage imageNamed:file]];
    [imgGraph setContentMode:UIViewContentModeTopLeft];
    [imgGraph setClipsToBounds:YES];
    [self addSubview:imgGraph];
    
    [imgGraph setHeight:0];
    
    [UIView animateWithDuration:0.4 animations:^(void)
     {
         [self setAlpha:1.0];
     }
                     completion:^(BOOL finished)
     {
         
         [UIView animateWithDuration:0.8 animations:^(void)
          {
              [imgGraph setHeight:height];
          }
                          completion:^(BOOL finished)
          {
          }];
     }];
}

- (void) addAndDelayAnimateImageWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file delay:(float)delay
{
    UIImageView *imgGraph = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, height)];
    
    [imgGraph setImage:[UIImage imageNamed:file]];
    [imgGraph setContentMode:UIViewContentModeTopLeft];
    [imgGraph setAlpha:0.0];
    [imgGraph setClipsToBounds:YES];
    [self addSubview:imgGraph];
    
    [UIView animateWithDuration:1.0 delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
        [imgGraph setAlpha:1.0];
    } completion:^(BOOL finished) {
    }];
}

- (void) addAndAnimateGraphWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file
{
    UIImageView *imgGraph = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, height)];
    
    [imgGraph setImage:[UIImage imageNamed:file]];
    [imgGraph setContentMode:UIViewContentModeTopLeft];
    [imgGraph setWidth:0];
    [imgGraph setClipsToBounds:YES];
    [self addSubview:imgGraph];
    
    [UIView animateWithDuration:0.4 animations:^(void)
     {
         [self setAlpha:1.0];
     }
                     completion:^(BOOL finished)
     {
         
         [UIView animateWithDuration:0.8 animations:^(void)
          {
              [imgGraph setWidth:width];
          }
                          completion:^(BOOL finished)
          {
          }];
     }];
}



@end
