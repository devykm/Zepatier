//
//  JanBottomPagerView.h
//  Victrelis
//
//  Created by ykm dev on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoxafilBottomPagerPreview.h"

@protocol NoxafilBottomPagerViewDelegate <NSObject>
-(void) invanzBottomPagerPreviewSelected:(int)chapter page:(int)page;
-(void) invanzBottomPagerPreviewOpen;
-(void) invanzBottomPagerPreviewClose;
@end

@interface NoxafilBottomPagerView : UIView <NoxafilBottomPagerPreviewDelegate> {
    UIButton *lastBtn;
    BOOL isAnimating;
}

@property(nonatomic,retain) NoxafilBottomPagerPreview *previewView;
@property(nonatomic,retain) NSMutableArray *chaptersData;
@property(nonatomic,retain) UIView *barContainer;
@property(nonatomic,retain) UIView *fadeView;
@property(nonatomic,retain) NSMutableDictionary *boxes;
@property(nonatomic,weak) id<NoxafilBottomPagerViewDelegate> delegate;

-(void) initChapters:(NSMutableArray*)chapters;
-(void) setChapterSelected:(int)chapter;
-(void) show;
-(void) hide;

@end
