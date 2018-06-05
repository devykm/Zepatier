//
//  Pager.h
//  lior
//
//  Created by ykm dev on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@protocol PagerDelegate<NSObject>
-(void) pagerControlPageSelected:(int)pageNumber chapter:(int)chapterNumber;
@end

@interface BulletPager : UIView {
	int total;
	int currentChapter;
	int currentIndex;
}

@property (nonatomic, weak) id<PagerDelegate> delegate;

-(id)initWithFrame:(CGRect)frame total:(int)totalItems selected:(int)selectIndex chapter:(int)chapter;
-(void) bindControl:(int)totalItems selected:(int)selectIndex chapter:(int)chapter;

@end
