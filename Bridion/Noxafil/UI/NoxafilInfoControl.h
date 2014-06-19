//
//  InfoControl.h
//  lior
//
//  Created by ykm dev on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "NoxafilInfoControlController.h"

@interface NoxafilInfoControl : UIView {
	int pageNumber;
	BOOL isLock;
}

@property(nonatomic,retain) NSString *textImageName;
@property(nonatomic,retain) UIButton *button;
@property(nonatomic,retain) UIImageView *imageView;
@property(nonatomic,retain) NoxafilInfoControlController *controller;

-(void) setIsLock:(BOOL)locked;
- (id)initWithFrame:(CGRect)frame textImageName:(NSString*)textImage imageToPress:(NSString*)imgToPress;

@end
