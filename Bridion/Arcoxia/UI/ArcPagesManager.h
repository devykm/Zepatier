//
//  ArcPagesManager.h
//  Arcoxia
//
//  Created by ykm dev on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChapterData.h"
#import "ArcBasePageView.h"
#import "BasePageTimer.h"

@protocol ArcPagesManagerDelegate <NSObject>
-(void) arcPagesManagerPageChanged:(int)page;
@end

@interface ArcPagesManager : UIView <UIScrollViewDelegate> {

    int currentPage;
    BOOL pageControlUsed;
}

@property(nonatomic,weak) id<ArcPagesManagerDelegate> delegate;
@property(nonatomic,retain) ChapterData *chapterData;
@property(nonatomic,retain) UIScrollView *scrollView;
@property(nonatomic,retain) NSMutableArray *viewControllers;

-(id)initWithFrame:(CGRect)frame chapterData:(ChapterData*)data;
-(void) moveToPage:(int)page animate:(BOOL)animated;
-(void) chapterDidAppear;
-(void) chapterWillDisappear;

@end
