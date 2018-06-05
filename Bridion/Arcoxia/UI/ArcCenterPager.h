//
//  ArcCenterPager.h
//  Arcoxia
//
//  Created by ykm dev on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ChapterData;
@class ArcCenterPagerBox;

@protocol ArcCenterPagerDelegate <NSObject>
-(void) arcCenterPagerWillOpen;
-(void) arcCenterPagerWillClose;
-(void) arcCenterPagerChapterSelected:(int)chapter;
-(void) openTopMenu;

@end

@protocol ArcCenterPagerBoxDelegate <NSObject>
-(void) arcCenterPagerBoxBoxSelected:(ArcCenterPagerBox*)box number:(int)number;
@end

@interface ArcCenterPager : UIView <ArcCenterPagerBoxDelegate> {
    BOOL _isCloseMode;
}

@property(nonatomic,weak) id<ArcCenterPagerDelegate> delegate;
@property(nonatomic,retain) NSMutableArray *chaptersData;
@property(nonatomic,retain) NSMutableArray *boxes;

-(void) initChapters:(NSMutableArray*)chapters;
-(void) openFromChapter:(int)index;
-(void) closeFromChapter:(int)index;

@end



@interface ArcCenterPagerBox : UIView {
    UIButton *lastBtn;
}

@property(nonatomic,assign) CGRect realPosition;
@property(nonatomic,weak) id<ArcCenterPagerBoxDelegate> delegate;
@property(nonatomic,retain) UIButton *button;
@property(nonatomic,retain) UIView *backColor;

-(id) initWithFrame:(CGRect)frame data:(ChapterData*)data;

@end
