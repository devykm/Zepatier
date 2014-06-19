//
//  ExtraImage.h
//  lior
//
//  Created by ykm dev on 5/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>
#import "Constants.h"
#import "UserStatistics.h"

@protocol NoxafilExtraImageDelegate <NSObject>
-(void) innerImageSelected:(id)control;
-(void) innerImageUnSelected:(id)control;
@end

@interface NoxafilExtraImage : UIImageView {
	double previousDistance;
	BOOL isAnimationOnProgress;
	BOOL isFullScreen;
	BOOL isShadow;
}

@property(nonatomic, assign) UserStatisticTypes userStatistic;
@property(nonatomic, weak) id<NoxafilExtraImageDelegate> delegate;
@property(nonatomic, retain) MPMoviePlayerController *player;

-(id)initWithFrame:(CGRect)frame andImage:(UIImage*) image;
-(float)distanceBetweenPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2;
-(CGFloat)angleBetweenPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2;
-(void) resetImage:(BOOL)oneTouch;
-(void) showShadow:(BOOL)big isLoad:(BOOL)load;
-(void) resetImage;
-(void) animateFullScreen;
-(void) setLocation:(CGPoint)point;
-(void) animationReturnToPlace:(BOOL)oneTouch;

@end
