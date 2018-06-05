//
//  PresBasePage.h
//  Victrelis
//
//  Created by ykm dev on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePageTimer.h"

@interface ArcBasePageView : BasePageTimer

@property(nonatomic,assign) BOOL isLoaded;
@property(nonatomic,retain) UIView *container;
@property(nonatomic,retain) UIImageView *imgTitle;

-(id)initWithPageNumber:(int)page size:(CGSize)size;

@end
