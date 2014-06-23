//
//  JanBottomPagerPreview.h
//  Victrelis
//
//  Created by YKM Company on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BridionChapterData.h"

@protocol BridionBottomPagerPreviewDelegate <NSObject>
-(void) bridionBottomPagerPreviewSelected:(int)chapter page:(int)page;
@end

@interface BridionBottomPagerPreview : UIView

@property(nonatomic,retain) BridionChapterData *currentChapterData;
@property(nonatomic,weak) id<BridionBottomPagerPreviewDelegate> delegate;

-(void) moveToPoint:(CGPoint)point andInitItems:(BridionChapterData*)data;

@end
