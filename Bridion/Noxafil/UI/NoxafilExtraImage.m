//
//  ExtraImage.m
//  lior
//
//  Created by ykm dev on 5/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoxafilExtraImage.h"

@implementation NoxafilExtraImage

- (id)initWithFrame:(CGRect)frame andImage:(UIImage*) image {
    if ((self = [super initWithFrame:frame])) {
		[self setImage:image];
		[self setBackgroundColor:[UIColor clearColor]];
		self.userInteractionEnabled = YES;
		self.multipleTouchEnabled = YES;
		self.contentMode = UIViewContentModeScaleAspectFit;
		self.clipsToBounds = NO;
		
		self.layer.shadowColor = [UIColor blackColor].CGColor;
		self.layer.shadowOffset = CGSizeMake(0, 3);
		self.layer.shadowOpacity = 1.0f;
		self.layer.shouldRasterize = YES;
		self.layer.shadowRadius = 10.0f;
		isFullScreen = NO;
		isAnimationOnProgress = NO;
	}
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	if(isAnimationOnProgress) {
		return;
	}
    
    [self showShadow:YES isLoad:NO];
    if(!isFullScreen) {
	   [self.delegate innerImageSelected:self];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event { 
    if([touches count] == 2) {  
		CGPoint prevPoint1 = [[[touches allObjects] objectAtIndex:0] previousLocationInView:self];
		CGPoint prevPoint2 = [[[touches allObjects] objectAtIndex:1] previousLocationInView:self];
		CGPoint curPoint1 = [[[touches allObjects] objectAtIndex:0] locationInView:self];
		CGPoint curPoint2 = [[[touches allObjects] objectAtIndex:1] locationInView:self];
		
		float prevmidx = (prevPoint1.x + prevPoint2.x) / 2.0;
		float prevmidy = (prevPoint1.y + prevPoint2.y) / 2.0;
		float curmidx = (curPoint1.x + curPoint2.x) / 2.0;
		float curmidy = (curPoint1.y + curPoint2.y) / 2.0;
		float difx = curmidx - prevmidx;
		float dify = curmidy - prevmidy;
		CGAffineTransform newTransform1 = CGAffineTransformTranslate(self.transform, difx, dify);
		self.transform = newTransform1;
				
		float prevDistance = [self distanceBetweenPoint1:prevPoint1 andPoint2:prevPoint2];
		float newDistance = [self distanceBetweenPoint1:curPoint1 andPoint2:curPoint2];
		float sizeDifference = (newDistance / prevDistance);
		CGAffineTransform newTransform2 = CGAffineTransformScale(self.transform, sizeDifference, sizeDifference);
		self.transform = newTransform2;
		
		CGFloat prevAngle = [self angleBetweenPoint1:prevPoint1 andPoint2:prevPoint2];
		CGFloat curAngle = [self angleBetweenPoint1:curPoint1 andPoint2:curPoint2];
		float angleDifference = curAngle - prevAngle;
		CGAffineTransform newTransform3 = CGAffineTransformRotate(self.transform, angleDifference);
		self.transform = newTransform3;
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if(isAnimationOnProgress) {
		return;
	}
    
	if([touches count] == 2) {	
		isAnimationOnProgress = YES;
		if(self.frame.size.width > self.bounds.size.width + 150) {
			[self animateFullScreen];
		}
		else {
			[self resetImage:NO];
		}
	}
	else if([touches count] == 1){
		isAnimationOnProgress = YES;
		if(isFullScreen) {
			[self resetImage:YES];
		}
		else {
			[self animateFullScreen];
		}
	}
}

-(void) animateFullScreen {
	CGPoint center = CGPointMake(SCREEN_WIDTH/2.0 , SCREEN_HEIGHT/2.0);
    [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^(void) {
        CGAffineTransform invTransform = CGAffineTransformIdentity;
		invTransform = CGAffineTransformTranslate(invTransform, center.x - self.center.x, center.y - self.center.y);
		invTransform = CGAffineTransformScale(invTransform, 1.45,1.45);
		self.transform = invTransform;
    } completion:^(BOOL finished) {
        isAnimationOnProgress = NO;
        isFullScreen = YES;
    }];
}




-(void) setLocation:(CGPoint)point {
	CGRect rect = self.frame;
	rect.origin.x = point.x;
	rect.origin.y = point.y;
	self.frame = rect;
}

-(void) animationReturnToPlace:(BOOL)oneTouch {
    [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^(void) {
        CGAffineTransform invTransform = CGAffineTransformIdentity;
		self.transform = invTransform;
    } completion:^(BOOL finished) {
        [self.delegate innerImageUnSelected:self];
        isAnimationOnProgress = NO;
        isFullScreen = NO;
    }];
}

-(void) showShadow:(BOOL)big isLoad:(BOOL)load {
	if(big) {
		if(isShadow) {
			return;
		}
		self.layer.shadowColor = [UIColor blackColor].CGColor;
		self.layer.shadowOffset = CGSizeMake(0, 3);
		self.layer.shadowOpacity = 1.0f;
		self.layer.shouldRasterize = YES;
		
		CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
		theAnimation.duration = 0.4;
		[theAnimation setRemovedOnCompletion:NO];
		theAnimation.autoreverses = NO;
		theAnimation.fillMode = kCAFillModeForwards;
		theAnimation.fromValue = [NSNumber numberWithFloat:10.0];
		theAnimation.toValue = [NSNumber numberWithFloat:20.0];
		[self.layer addAnimation:theAnimation forKey:@"animateShadow"];
		isShadow = YES;
	}
	else {
		if(!isShadow) {
			return;
		}
		self.layer.shadowColor = [UIColor blackColor].CGColor;
		self.layer.shadowOffset = CGSizeMake(0, 3);
		self.layer.shadowOpacity = 1.0f;
		self.layer.shouldRasterize = YES;
		if(!load) {
			CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
			theAnimation.duration = 0.4;
			theAnimation.repeatCount = 1;
			[theAnimation setRemovedOnCompletion:NO];
			theAnimation.autoreverses = NO;
			theAnimation.fromValue = [NSNumber numberWithFloat:20.0];
			theAnimation.toValue = [NSNumber numberWithFloat:10.0];
			theAnimation.fillMode = kCAFillModeForwards;
			[self.layer addAnimation:theAnimation forKey:@"animateShadow"];
			//self.layer.shadowRadius = 10.0f;
		}
		else {
			self.layer.shadowRadius = 10.0f;
		}
		isShadow = NO;
	}
}

-(void) resetImage {
	if(isFullScreen) {
	[self resetImage:YES];
	}
}

-(void) resetImage:(BOOL)oneTouch {
	[self animationReturnToPlace:oneTouch];
	[self showShadow:NO isLoad:NO];
}

- (float)distanceBetweenPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2 {
	CGFloat deltaX = fabsf(point1.x - point2.x);
	CGFloat deltaY = fabsf(point1.y - point2.y);
	CGFloat distance = sqrt((deltaY*deltaY)+(deltaX*deltaX));
	return (float)distance;
}

- (CGFloat)angleBetweenPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2 { 
	CGFloat deltaY = point1.y - point2.y;
	CGFloat deltaX = point1.x - point2.x;
	CGFloat angle = atan2(deltaY, deltaX);
	return angle;
}


@end
