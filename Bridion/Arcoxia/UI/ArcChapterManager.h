//
//  ArcChapterManager.h
//  Arcoxia
//
//  Created by ykm dev on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChapterData.h"
#import "ArcPagesManager.h"
#import "BasePageTimer.h"
#import "customCallsMenuView.h"
@class ArcChapterTopBox;
@class ArcPagesPagerView;


@protocol ArcPagesPagerViewDelegate <NSObject>
-(void) arcPagesPagerPageSelected:(int)page;
@end

@protocol ArcChapterManagerViewDelegate <NSObject>
-(void)arcChapterManagerViewChapterChanged:(int)chapter;
-(void)arcChapterManagerViewOpenCenterPager:(int)chapter;
@end

@interface ArcChapterManager : BasePageTimer <UIScrollViewDelegate, ArcPagesManagerDelegate, ArcPagesPagerViewDelegate,DataManagerDelegate> {
    BOOL _isClosedMode;
}

@property(nonatomic,weak) id<ArcChapterManagerViewDelegate> delegateM;
@property(nonatomic,assign) int currentChapter;
@property(nonatomic,retain) NSMutableArray *chapterArray;
@property(nonatomic,retain) UIScrollView *pagesScrollView;
@property(nonatomic,retain) NSMutableArray *viewControllers;
@property(nonatomic,retain) ArcChapterTopBox *topBox;
@property(nonatomic,retain) ArcPagesPagerView *bottomPager;
@property(nonatomic,assign) BOOL topMenuOpened;
@property(nonatomic,assign) BOOL scrollVertical;
@property(nonatomic,retain) customCallsMenuView *customCallsMenu;
@property(nonatomic,retain) DataManager *customCallManager;



-(void) resetAllPages;

-(void)openTopChapterWithAnimation:(int)chapter page:(int)page;
-(void) setTopChapter:(int)chapter page:(int)page animate:(BOOL)animated;
- (void)loadScrollViewWithTopChapter:(int)chapter page:(int)page;
-(void) initControlNew:(NSMutableArray*)chapters;

-(void) initControl:(NSMutableArray*)chapters;
-(void) openChapterWithAnimation:(int)chapter page:(int)page;
-(void) notifyActiveScreenWillDisappear;
-(void) notifyActiveScreenAppear;
-(void) closeChapterWithAnimation;
-(BOOL) switchToChapterWithAnimation:(int)chapter page:(int)page;
-(void) refreshCurrentPageTiming;
-(BOOL) switchToTopChapterWithAnimation:(int)chapter page:(int)page;

-(void)closeTopChapterWithAnimation;
-(void) getcustomCalls:(int)appId ;
-(void) setCustomCallsScrollView:(NSMutableArray *)customCallsArray appID:(NSInteger*)appId;
-(void)setCustomCallsFromPage:(NSMutableArray *)customCallsArray page:(int)page;
- (void)loadScrollViewWithPage:(int)page;
+(ArcChapterManager*)getInstance;
-(void)setChapterForCustomCalls:(int)chapter page:(int)page;
-(void)loadScrollViewWithTopChapter:(int)chapter page:(int)page;

@end

@interface ArcChapterTopBox : UIView {
    UIButton *lastBtn;
}
@property(nonatomic,assign) BOOL topMenuOpened;

@property(nonatomic,weak) id target;
@property(nonatomic,assign) SEL selector;
@property(nonatomic,retain) UIButton *button;
@property(nonatomic,retain) UIView *backColor;

-(id) initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector;
-(void) setData:(ChapterData*)data;

@end



@interface ArcPagesPagerView : UIView {
    UIButton *lastBtn;
}

@property(nonatomic, weak) id<ArcPagesPagerViewDelegate> delegate;

-(void) buildUI:(int)numPages;
-(void) setPageSelection:(int)page;

@end

