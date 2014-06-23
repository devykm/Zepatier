//
//  JanBottomPagerView.h
//  Victrelis
//
//  Created by ykm dev on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BridionBottomPagerPreview.h"

@protocol BridionBottomPagerViewDelegate <NSObject>
-(void) bridionBottomPagerPreviewSelected:(int)chapter page:(int)page;
-(void) bridionBottomPagerPreviewOpen;
-(void) bridionBottomPagerPreviewClose;

@end

@interface BridionBottomPagerView : UIView <BridionBottomPagerPreviewDelegate> {
    UIButton *lastBtn;
    BOOL isAnimating;
}

@property(nonatomic,retain) BridionBottomPagerPreview *previewView;
@property(nonatomic,retain) NSMutableArray *chaptersData;
@property(nonatomic,retain) UIView *barContainer;
@property(nonatomic,retain) UIView *fadeView;
@property(nonatomic,retain) NSMutableDictionary *boxes;
@property(nonatomic,weak) id<BridionBottomPagerViewDelegate> delegate;

-(void) initChapters:(NSMutableArray*)chapters;
-(void) setChapterSelected:(int)chapter;
-(void) show;
-(void) hide;

@end
