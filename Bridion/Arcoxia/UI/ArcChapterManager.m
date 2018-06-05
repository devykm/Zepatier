//
//  ArcChapterManager.m
//  Arcoxia
//
//  Created by ykm dev on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArcChapterManager.h"
#import "UIView-Extensions.h"
#import "FTAnimation+UIView.h"

#define TOP_BOX_W 273
#define TOP_BOX_H 86
#define TOP_BOX_X 718
#define TOP_BOX_Y 0

#define BOTTOM_BOX_W 1024
#define BOTTOM_BOX_H 49

@interface ArcChapterManager ()
@end

@implementation ArcChapterManager
static ArcChapterManager * instance;

+(ArcChapterManager*)getInstance{
    if (instance==nil)
    {
        instance = [[ArcChapterManager alloc] init];
    }
    return instance;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setClipsToBounds:YES];
        self.statisticId = ArcoxiaStatistictPageMainLobby;
        
        self.pagesScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.pagesScrollView.pagingEnabled = YES;
        self.pagesScrollView.clipsToBounds = NO;
        self.pagesScrollView.showsHorizontalScrollIndicator = NO;
        self.pagesScrollView.showsVerticalScrollIndicator = NO;
        self.pagesScrollView.scrollsToTop = NO;
        self.pagesScrollView.bounces = YES;
        [self.pagesScrollView setDelegate:self];
        [self.pagesScrollView setUserInteractionEnabled:YES];
        self.pagesScrollView.canCancelContentTouches = NO;
        [self.pagesScrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
        [self.pagesScrollView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.pagesScrollView];
        
        self.topBox = [[ArcChapterTopBox alloc] initWithFrame:CGRectMake(TOP_BOX_X, TOP_BOX_Y, TOP_BOX_W, TOP_BOX_H) target:self selector:@selector(topBoxClick:)];
        [self addSubview:self.topBox];
        
        self.bottomPager = [[ArcPagesPagerView alloc] initWithFrame:CGRectMake(0, self.height-BOTTOM_BOX_H, BOTTOM_BOX_W, BOTTOM_BOX_H)];
        self.bottomPager.delegate = self;
        [self addSubview:self.bottomPager];
        
        //hidden state
        [self setHidden:YES];
        [self.pagesScrollView setAlpha:0];
        [self.topBox setY:-(TOP_BOX_H+10.0)];
        [self.bottomPager setY:self.height];
        _isClosedMode = YES;
    }
    instance = self;

    return self;
}

-(void) initControl:(NSMutableArray*)chapters
{
    self.topMenuOpened = YES;
    self.pagesScrollView.contentSize = CGSizeMake(0, 0);
    [self resetAllPages];
    self.scrollVertical = YES;
    self.chapterArray = chapters;
    self.pagesScrollView.contentSize = CGSizeMake(self.bounds.size.width*[self.chapterArray count], self.bounds.size.height);
    [self initPagesData];
}
-(void) initControlNew:(NSMutableArray*)chapters
{
    self.pagesScrollView.contentSize = CGSizeMake(0, 0);
    [self resetAllPages];

    self.topMenuOpened = NO;
    self.scrollVertical = NO;
    self.chapterArray = chapters;
    self.pagesScrollView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height*[self.chapterArray count]);
    [self initPagesData];
}











#pragma -------------------
#pragma Actions

-(BOOL) switchToTopChapterWithAnimation:(int)chapter page:(int)page
{
    //if(_isClosedMode) {
        [self openTopChapterWithAnimation:chapter page:page];
        return YES;
    //}
    //else {
        //[self setChapter:chapter page:page animate:NO];
       // return NO;
    //}
}


-(BOOL) switchToChapterWithAnimation:(int)chapter page:(int)page
{
    if(_isClosedMode) {
        [self openChapterWithAnimation:chapter page:page];
        return YES;
    }
    else {
        [self setChapter:chapter page:page animate:NO];
        return NO;
    }
}

-(void) topBoxClick:(id)sender
{
    [self closeChapterWithAnimation];
}

/**
 * Used only by main controller, called by center pager to open specific chapter
 * -animate opening
 **/
-(void)openChapterWithAnimation:(int)chapter page:(int)page
{
    //if(!_isClosedMode) return;
    
    [self notifyActiveScreenWillDisappear];//notify main screen
    _isClosedMode = NO;
    [self setChapter:chapter page:page animate:NO];
    
    //animate open
    [self setHidden:NO];
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^(void) {
        [self.pagesScrollView setAlpha:1.0];
    } completion:^(BOOL finished){
        
    }];
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^(void) {
        [self.topBox setY:TOP_BOX_Y];
        [self.bottomPager setY:self.height-BOTTOM_BOX_H];
    } completion:^(BOOL finished){
        
    }];
}


-(void)openTopChapterWithAnimation:(int)chapter page:(int)page
{
    //self.topBox.topMenuOpened = YES;

    [self notifyActiveScreenWillDisappear];//notify main screen
    _isClosedMode = NO;

    [self setTopChapter:chapter page:page animate:NO];
    [self setHidden:NO];
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^(void) {
        [self.pagesScrollView setAlpha:1.0];
    } completion:^(BOOL finished){
        
    }];
}

/**
 * Used only by main controller, called when need to close chapter mode
 * -animate opening
 **/
-(void)closeTopChapterWithAnimation
{
    
    if(_isClosedMode) return;
    self.topBox.topMenuOpened = NO;
    
    [self notifyActiveScreenWillDisappear];
    _isClosedMode = YES;//DO NOT CHANGE THE ORDER!!!!
    //animate close
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
        [self.pagesScrollView setAlpha:0.0];
    } completion:^(BOOL finished){
    }];
    
    [UIView animateWithDuration:0.2 delay:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^(void) {
        
    } completion:^(BOOL finished){
        [self setHidden:YES];
        [self notifyActiveScreenAppear];//notify main screen
        [self.delegateM arcChapterManagerViewOpenCenterPager:self.currentChapter];
    }];
}

-(void)closeChapterWithAnimation
{
    if(_isClosedMode) return;
    self.topBox.topMenuOpened = NO;
   
    [self notifyActiveScreenWillDisappear];
    _isClosedMode = YES;//DO NOT CHANGE THE ORDER!!!!
    //animate close
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
        [self.pagesScrollView setAlpha:0.0];
    } completion:^(BOOL finished){
    }];

    [UIView animateWithDuration:0.2 delay:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^(void) {
        [self.topBox setY:-(TOP_BOX_H+10.0)];
        [self.bottomPager setY:self.height];
    } completion:^(BOOL finished){
        [self setHidden:YES];
        [self notifyActiveScreenAppear];//notify main screen
        [self.delegateM arcChapterManagerViewOpenCenterPager:self.currentChapter];
    }];
}

/**
 * Refresh page timing statistic
 * Used by play button to start new session
 **/
-(void) refreshCurrentPageTiming
{
    //[self notifyActiveScreenWillDisappear];
    [self notifyActiveScreenAppear];
}


#pragma ----------------
#pragma ArcPagesManagerDelegate

-(void) arcPagesManagerPageChanged:(int)page
{
    [self.bottomPager setPageSelection:page];
}


#pragma -----------------
#pragma ArcPagesPagerViewDelegate

-(void) arcPagesPagerPageSelected:(int)page
{
    ArcPagesManager *controller = [self.viewControllers objectAtIndex:self.currentChapter];
    [controller moveToPage:page animate:YES];
}



#pragma ----------------
#pragma UIScrollViewDelegate


-(void) setTopChapter:(int)chapter page:(int)page animate:(BOOL)animated
{
    self.currentChapter = chapter;
    [self loadScrollViewWithChapter:self.currentChapter-1 page:0];
    [self loadScrollViewWithChapter:self.currentChapter page:page];
    [self loadScrollViewWithChapter:self.currentChapter+1 page:0];
    CGPoint offset = CGPointMake(0, self.currentChapter * self.pagesScrollView.frame.size.height);
    
    if(animated) {
        [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^(void) {
            [self.pagesScrollView setContentOffset:offset animated:NO];
        } completion:^(BOOL finished){
            ChapterData *data = [self.chapterArray objectAtIndex:self.currentChapter];
            //[self.topBox setData:data];
            [self.bottomPager buildUI:[data.pages count]];
            [self.bottomPager setPageSelection:page];
            [self notifyActiveScreenAppear];
        }];
    }
    else {
        [self.pagesScrollView setContentOffset:offset animated:NO];
        
        ChapterData *data = [self.chapterArray objectAtIndex:self.currentChapter];
        //[self.topBox setData:data];
        [self.bottomPager buildUI:[data.pages count]];
        [self.bottomPager setPageSelection:page];
        [self notifyActiveScreenAppear];
    }
}

-(void)setChapterForCustomCalls:(int)chapter page:(int)page
{
    
    [self loadScrollViewWithChapter:self.currentChapter page:page];
    CGPoint offset = CGPointMake(0, self.currentChapter * self.pagesScrollView.frame.size.height);

    [self.pagesScrollView setContentOffset:offset animated:NO];
    
    ChapterData *data = [self.chapterArray objectAtIndex:self.currentChapter];
    //[self.topBox setData:data];
    //[self.bottomPager buildUI:[data.pages count]];
    //[self.bottomPager setPageSelection:page];
    [self notifyActiveScreenAppear];

    
}

-(void) setChapter:(int)chapter page:(int)page animate:(BOOL)animated
{
    self.currentChapter = chapter;
    [self loadScrollViewWithChapter:self.currentChapter-1 page:0];
    [self loadScrollViewWithChapter:self.currentChapter page:page];
    [self loadScrollViewWithChapter:self.currentChapter+1 page:0];
    
    CGPoint offset = CGPointMake(0, self.currentChapter * self.pagesScrollView.frame.size.height);
    if(animated) {
        [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^(void) {
            [self.pagesScrollView setContentOffset:offset animated:NO];
        } completion:^(BOOL finished){
            ChapterData *data = [self.chapterArray objectAtIndex:self.currentChapter];
            [self.topBox setData:data];
            [self.bottomPager buildUI:[data.pages count]];
            [self.bottomPager setPageSelection:page];
            [self notifyActiveScreenAppear];
        }];
    }
    else {
        [self.pagesScrollView setContentOffset:offset animated:NO];
        
        ChapterData *data = [self.chapterArray objectAtIndex:self.currentChapter];
        [self.topBox setData:data];
        [self.bottomPager buildUI:[data.pages count]];
        [self.bottomPager setPageSelection:page];
        [self notifyActiveScreenAppear];
    }
}

-(void) initPagesData 
{
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [self.chapterArray count]; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
	
}

- (void)loadScrollViewWithChapter:(int)chapter page:(int)page
{
    if (chapter < 0) return;
    if (chapter >= [self.chapterArray count]) return;
	
	[self createChapter:chapter page:page];
}


-(void)createChapter:(int)chapter page:(int)page
{
	if (chapter < 0) return;
    if (chapter >= [self.chapterArray count]) return;
    
    UIView *controller = [self.viewControllers objectAtIndex:chapter];
    if ((NSNull *)controller == [NSNull null]) {
        controller = [[ArcPagesManager alloc] initWithFrame:CGRectMake(0, 0, 1024.0, 519.0) chapterData:[self.chapterArray objectAtIndex:chapter]];
        ((ArcPagesManager*)controller).delegate = self;
        [self.viewControllers replaceObjectAtIndex:chapter withObject:controller];

    }	
	
    //set chapter page
    if([controller isKindOfClass:[ArcPagesManager class]]) {
        [((ArcPagesManager*)controller) moveToPage:page animate:NO];
    }
    
	if (controller != nil && controller.superview == nil) {
        [controller setY:self.pagesScrollView.size.height * chapter + 110];
        [self.pagesScrollView addSubview:controller];
    }
}
-(void) resetAllPages
{
    for (int i=0; i<[self.viewControllers count]; i++) {
            UIView *controller = [self.viewControllers objectAtIndex:i];
            if ((NSNull *)controller != [NSNull null]) {
                [controller removeFromSuperview];
                [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
            }
        }
}
-(void) resetNotVisiblePages 
{
	for (int i=0; i<[self.viewControllers count]; i++) {
		if(![self isChapterVisible:i]) {
			UIView *controller = [self.viewControllers objectAtIndex:i];
			if ((NSNull *)controller != [NSNull null]) {
				[controller removeFromSuperview];
				[self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
			}
		}
	}
}

-(BOOL) isChapterVisible:(int)chapter 
{
	if(chapter == self.currentChapter || chapter == self.currentChapter + 1 || chapter == self.currentChapter - 1) {
		return YES;
	}
	return NO;
}

-(void) notifyActiveScreenAppear
{
    if(!_isClosedMode) {
        UIView *controller = [self.viewControllers objectAtIndex:self.currentChapter];
        if([controller isKindOfClass:[ArcPagesManager class]]) {
            [((ArcPagesManager*)controller) chapterDidAppear];
        }
        else if([controller isKindOfClass:[BasePageTimer class]]) {
            [((BasePageTimer*)controller) pageDidAppear];
        }
    }
    else {
        [super pageDidAppear];
    }
}

-(void)notifyActiveScreenWillDisappear 
{
    if(!_isClosedMode) {
        UIView *controller = [self.viewControllers objectAtIndex:self.currentChapter];
        if([controller isKindOfClass:[ArcPagesManager class]]) {
            [((ArcPagesManager*)controller) chapterWillDisappear];
        }
        else if([controller isKindOfClass:[BasePageTimer class]]) {
            [((BasePageTimer*)controller) pagewillDisapear];
        }
    }
    else {
        [super pagewillDisapear];
    }
}




#pragma -------------------
#pragma UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    
    [self scrollEnded];
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView 
{

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView 
{
	[self notifyActiveScreenWillDisappear];
}

-(void) scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView 
{
	[self notifyActiveScreenAppear];
	[self resetNotVisiblePages];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	[self notifyActiveScreenAppear];
	[self resetNotVisiblePages];
}

-(void) scrollEnded
{
    
    CGFloat pageHeight = self.pagesScrollView.frame.size.height;
    int page = floor((self.pagesScrollView.contentOffset.y - pageHeight / 2) / pageHeight) + 1;
    
    if (page < 0) return;
    if (page >= [self.chapterArray count]) return;
    
    if(self.currentChapter != page) {
        self.currentChapter = page;
        //[self loadScrollViewWithChapter:self.currentChapter-1 page:0];
        [self loadScrollViewWithChapter:self.currentChapter page:0];
        //[self loadScrollViewWithChapter:self.currentChapter+1 page:0];
        [self resetNotVisiblePages];
        
        //set top box chapter data
        ChapterData *data = [self.chapterArray objectAtIndex:self.currentChapter];
        if (self.topMenuOpened == YES){
            [self.bottomPager buildUI:[data.pages count]];
            [self.bottomPager setPageSelection:0];

        }else{
        [self.topBox setData:data];
        [self.bottomPager buildUI:[data.pages count]];
        [self.bottomPager setPageSelection:0];
        }
    }
}
@end





//////////////////////////ArcChapterTopBox////////////////////



@implementation ArcChapterTopBox



-(id) initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector;
{
    if(self = [super initWithFrame:frame]) {
        self.target = target;
        self.selector = selector;
        
        //shadow
        self.layer.masksToBounds = NO;
        self.layer.shadowRadius = 20;
        self.layer.shadowOpacity = 0.5;
        CGFloat indent = 10;
        CGRect innerRect = CGRectMake(-indent,5.0,self.width+(2*indent),self.height-10);
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:innerRect].CGPath;
        
        //back color
        self.backColor = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0, self.width-20.0, self.height + 8.0)];
        [self.backColor setBackgroundColor:[UIColor colorWithRed:144.0/255.0 green:183.0/255.0 blue:207.0/255 alpha:0.6]];
        self.backColor.layer.cornerRadius = 4.0;
        [self addSubview:self.backColor];
        
        //button
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(10.0, 0, self.width-20.0, self.height)];
        self.button.imageView.contentMode = UIViewContentModeCenter;
        [self.button setAdjustsImageWhenHighlighted:NO];
        [self.button setContentMode:UIViewContentModeCenter];
        [self.button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.button.tag = -1;
        [self addSubview:self.button];
    }
    return self;
}

-(void) setData:(ChapterData*)data
{
    if(self.button.tag == data.number) return;
    //if(self.topMenuOpened == YES) return;
    [self.button setImage:[UIImage imageNamed:data.previewImage] forState:UIControlStateNormal];
    self.button.tag = data.number;
    [self.button.layer removeAllAnimations];
    
    CATransition* transition = [CATransition animation];
	transition.removedOnCompletion = YES;
	transition.duration = 0.25;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	transition.type = kCATransitionFade;
	[self.button.layer addAnimation:transition forKey:nil];
}

-(void) btnClick:(id)sender
{
    [self.target performSelector:self.selector withObject:nil];
}



@end





//////////////////////////ArcPagesPagerView////////////////////





#define PAGER_TAG 200

@implementation ArcPagesPagerView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //shadow
        /*self.layer.masksToBounds = NO;
        self.layer.shadowRadius = 20;
        self.layer.shadowOpacity = 0.6;
        CGFloat indent = 10;
        CGRect innerRect = CGRectMake(-indent,40.0,self.width+(2*indent),self.height+60);
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:innerRect].CGPath;*/
        
        //back color
        /*UIView *backColor = [[UIView alloc] initWithFrame:CGRectMake(10.0, -8.0, self.width-20.0, self.height + 8.0)];
        backColor.layer.cornerRadius = 4.0;
        [backColor setBackgroundColor:[UIColor colorWithRed:144.0/255.0 green:183.0/255.0 blue:207.0/255 alpha:0.6]];
        [self addSubview:backColor];*/
        
        UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        back.tag = 111;
        [back setContentMode:UIViewContentModeScaleToFill];
        [back setImage:[UIImage imageNamed:@"arc_pagesPager_back.png"]];
        [self addSubview:back];

    }
    return self;
}

-(void) buildUI:(int)numPages
{
    //clear previous buttons
    lastBtn = nil;
    for(UIView *view in self.subviews) {
        if([view isKindOfClass:[UIButton class]]) {
            [view removeFromSuperview];
        }
    }
    
    float yPos = 14;
    float xPos = (self.bounds.size.width) - 55;
    for (int i=0; i<numPages; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(xPos, yPos, 27, 27)];
		btn.tag = PAGER_TAG + i;
		[btn setImage:[UIImage imageNamed:@"arc_pagesPager_off.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"arc_pagesPager_on.png"] forState:UIControlStateHighlighted];
		[btn setImage:[UIImage imageNamed:@"arc_pagesPager_on.png"] forState:UIControlStateSelected];
        [btn setImage:[UIImage imageNamed:@"arc_pagesPager_on.png"] forState:UIControlStateSelected | UIControlStateHighlighted];
		btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
		[btn setContentMode:UIViewContentModeRight];
		[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:btn];

        
        xPos -= 36.0;
    }
    
    CATransition* transition = [CATransition animation];
	transition.removedOnCompletion = YES;
	transition.duration = 0.15;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	transition.type = kCATransitionFade;
	[self.layer addAnimation:transition forKey:nil];
}

-(void) btnClick:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    [lastBtn setSelected:NO];
    lastBtn = btn;
    [lastBtn setSelected:YES];
    
    [delegate arcPagesPagerPageSelected:btn.tag-PAGER_TAG];
}

-(void) setPageSelection:(int)page
{
    UIButton *btn = (UIButton*)[self viewWithTag:PAGER_TAG+page];
    if(btn == lastBtn) return;
    
    [lastBtn setSelected:NO];
    lastBtn = btn;
    [lastBtn setSelected:YES];
}

-(void) dealloc
{
    delegate = nil;

}

@end





