//
//  JanBottomPagerPreview.h
//  Victrelis
//
//  Created by YKM Company on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "NoxafilChapterData.h"

@protocol NoxafilBottomPagerPreviewDelegate <NSObject>
-(void) invanzBottomPagerPreviewSelected:(int)chapter page:(int)page;
@end

@interface NoxafilBottomPagerPreview : UIView

@property(nonatomic,retain) NoxafilChapterData *currentChapterData;
@property(nonatomic,weak) id<NoxafilBottomPagerPreviewDelegate> delegate;

-(void) moveToPoint:(CGPoint)point andInitItems:(NoxafilChapterData*)data;

@end
