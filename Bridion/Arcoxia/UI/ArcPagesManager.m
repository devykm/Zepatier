//
//  ArcPagesManager.m
//  Arcoxia
//
//  Created by ykm dev on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArcPagesManager.h"
#import "UIView-Extensions.h"

#define SCROLL_TOP_GAP 20.0
#define SCROLL_PAGE_X 10.0

@interface ArcPagesManager (PRIVATE)
-(void) initPagesData;
-(void) notifyActiveScreenWillDisappear;
-(void) notifyActiveScreenAppear;
-(ArcBasePageView*)getControllerAtIndex:(int)index;

-(BOOL) isPageVisible:(int)page;
-(void) createPage:(int)page;
-(void) loadScrollViewWithPage:(int)page;
-(void) setPage:(int)pageNumber animate:(BOOL)animated;
-(void) scrollEnded;
@end


@implementation ArcPagesManager

-(id)initWithFrame:(CGRect)frame chapterData:(ChapterData*)data
{
    self = [super initWithFrame:frame];
    if (self) {
        self.chapterData = data;
        currentPage = -1;

        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.clipsToBounds = YES;
        self.scrollView.contentSize = CGSizeMake(self.bounds.size.width * [self.chapterData.pages count], self.bounds.size.height);
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.scrollsToTop = NO;
        self.scrollView.bounces = YES;
        [self.scrollView setDelegate:self];
        [self.scrollView setUserInteractionEnabled:YES];
        self.scrollView.canCancelContentTouches = NO;
        [self.scrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
        [self.scrollView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.scrollView];
        [self initPagesData];
    }
    return self;
}

-(void)initPagesData 
{
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [self.chapterData.pages count]; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;

}

-(ArcBasePageView*)getControllerAtIndex:(int)index 
{
	if (index<0 || index>=[self.viewControllers count]) {
		return nil;
	}
	return [self.viewControllers objectAtIndex:currentPage];
}

-(void)notifyActiveScreenWillDisappear 
{
	ArcBasePageView *controller = [self getControllerAtIndex:currentPage];
    if ((NSNull *)controller != [NSNull null]) {
        [controller pagewillDisapear];
    }
}

-(void)notifyActiveScreenAppear 
{
	ArcBasePageView *controller = [self getControllerAtIndex:currentPage];
    if ((NSNull *)controller != [NSNull null]) {
        [controller pageDidAppear];
    }
}

-(void) resetNotVisiblePages 
{
	for (int i=0; i<[self.viewControllers count]; i++) {
		if([self isPageVisible:i] == NO) {
			ArcBasePageView *controller = [self.viewControllers objectAtIndex:i];
			if ((NSNull *)controller != [NSNull null]) {
				[controller removeFromSuperview];
				[self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
			}
		}
	}
}

-(BOOL) isPageVisible:(int)page 
{
	if(page == currentPage || page == currentPage + 1 || page == currentPage - 1) {
		return YES;
	}
	return NO;
}

/**
 *  Called by chapter manager to move to the given page number
 *  and mark the side pager
 **/
-(void) moveToPage:(int)page animate:(BOOL)animated 
{
    if(currentPage == page) return;
    
    [self notifyActiveScreenWillDisappear];
    currentPage = page;
    pageControlUsed = animated;
    [self.delegate arcPagesManagerPageChanged:currentPage];
    [self setPage:currentPage animate:animated];
}

-(void) setPage:(int)pageNumber animate:(BOOL)animated 
{
    currentPage = pageNumber;
	[self loadScrollViewWithPage:currentPage - 1];
	[self loadScrollViewWithPage:currentPage];
	[self loadScrollViewWithPage:currentPage + 1];
	
    //update the scroll view to the appropriate page
    CGRect frame = self.scrollView.frame;
    float offset = (frame.size.width * (([self.chapterData.pages count] - 1) - currentPage));
	[self.scrollView setContentOffset:CGPointMake(offset, 0) animated:animated];
    if(!animated) {
        [self notifyActiveScreenWillDisappear];
    }
}

- (void)loadScrollViewWithPage:(int)page 
{
    if (page < 0) return;
    if (page >= [self.chapterData.pages count]) return;
	
	[self createPage:page];
}

-(void)createPage:(int)page 
{
	if (page < 0) return;
    if (page >= [self.chapterData.pages count]) return;
    
    ArcBasePageView *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        PageData *pageData = (PageData*)[self.chapterData.pages objectAtIndex:page];
        
		controller = [[NSClassFromString(pageData.className) alloc] initWithPageNumber:page size:CGSizeMake(self.width-74.0, self.height)];
        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
        [controller setBackgroundColor:[UIColor clearColor]];

    }	
	
	if (controller != nil && controller.superview == nil) {
        CGRect frame = controller.frame;
        frame.origin.x = ((([self.chapterData.pages count] - 1) - page)*self.scrollView.frame.size.width) + 37.0;
        frame.origin.y = 0;
        controller.frame = frame;
        [self.scrollView addSubview:controller];
    }
}

-(void) setPageSelected:(int)page
{
	if(page == currentPage) return;
    
	pageControlUsed = YES;
    [self notifyActiveScreenWillDisappear];
	[self setPage:page animate:YES];
}


#pragma --------------------
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
    pageControlUsed = NO;
	[self notifyActiveScreenAppear];
	[self resetNotVisiblePages];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
	[self notifyActiveScreenAppear];
	[self resetNotVisiblePages];
}

-(void) scrollEnded
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
	page = (([self.chapterData.pages count] - 1) - page);
    
    if (page < 0) return;
    if (page >= [self.chapterData.pages count]) return;
    
    if(currentPage != page) {
        //NSLog(@"%d   %d",currentPage,page);
		currentPage = page;
		[self loadScrollViewWithPage:currentPage - 1];
		[self loadScrollViewWithPage:currentPage];
		[self loadScrollViewWithPage:currentPage + 1];
		[self resetNotVisiblePages];
        
        if(!pageControlUsed) {
            [self.delegate arcPagesManagerPageChanged:currentPage];
        }
	}
}



/**
 *  notification from chapter manager
 *  called when the chapter is visible
 **/
-(void) chapterDidAppear
{
    [self notifyActiveScreenAppear];
}

-(void) chapterWillDisappear
{
    [self notifyActiveScreenWillDisappear];
}



@end
