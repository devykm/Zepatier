//
//  ZostavaxViewController.m
//  Zostavax
//
//  Created by YKM Company on 8/20/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "BridionViewController.h"
#import "GMMainMenuView.h"
#import "UIView-Extensions.h"
#import "BridionBase.h"
#import "EndMeetingUniversalController.h"
#import "EndMeetingUniQuestionView.h"

#import "Test.h"
#import "Constants.h"
#import "HistoryUniversalViewController.h"
#import "FTAnimation+UIView.h"

@interface BridionViewController ()
@property (nonatomic, retain) NSMutableArray *pagesData;
@property (nonatomic, retain) NSMutableArray *chapterArray;

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, assign) int currentPage;

@end

@implementation BridionViewController
{
    BOOL _pageControlUsed;
    QuestionViewController *finalQuestionController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.applicationId = APPLICATION_BRIDION;
    [self.view setBackgroundColor:[UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0]];
    
    self.pagesData = [BridionChapterData loadPagesData:@"BridionChapters.plist"];
    self.chapterArray = [BridionChapterData loadData:@"BridionChapters.plist"];
	[self initPagesData];
    
	self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 768-679, SCREEN_WIDTH, 679)];
	self.scrollView.pagingEnabled = YES;
	self.scrollView.clipsToBounds = YES;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * [self.pagesData count], self.scrollView.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
	self.scrollView.bounces = YES;
    self.scrollView.delegate = self;
	[self.scrollView setUserInteractionEnabled:YES];
	self.scrollView.canCancelContentTouches = NO;
    [self.scrollView setBackgroundColor:[UIColor clearColor]];
	[self.view addSubview:self.scrollView];
	
    //Create first pages
    self.currentPage = 0;
	[self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
	[self notifyActiveScreenAppear];
    
    //Init bottom pager
    self.chapterPager.delegate = self;
    [self.chapterPager initChapters:self.chapterArray];
    
    [self notifyPageChanged];
	
    self.startMeetingMenu.delegate = self;
    [self.view bringSubviewToFront:self.chapterPager];
    [self.view bringSubviewToFront:self.topMenu];
    [self.view bringSubviewToFront:self.startMeetingMenu];
    [self.view bringSubviewToFront:self.btnTools];
    
    //notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestStartNotification:)
                                                 name:@"TestStartNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestEndNotification:)
                                                 name:@"TestEndNotification"
                                               object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    [tap setDelaysTouchesEnded:NO];
    [tap setCancelsTouchesInView:NO];
    [tap setNumberOfTapsRequired:2];
    [self.scrollView addGestureRecognizer:tap];
    
    [self btnMenuClick:nil];
}

-(void) viewWillAppear:(BOOL )animated
{
    if([self.menu isOpen]) {
        [self.menu pageDidAppear];
        return;
    }
    if([self.toolsMenu isOpen]) {
        [self.toolsMenu pageDidAppear];
        return;
    }
	[self notifyActiveScreenAppear];
    
    [self performSelector:@selector(initAfterDelay) withObject:nil afterDelay:0.2];
}

-(void) viewWillDisappear:(BOOL )animated
{
    if([self.menu isOpen]) {
        [self.menu pagewillDisapear];
        return;
    }
    if([self.toolsMenu isOpen]) {
        [self.toolsMenu pagewillDisapear];
        return;
    }
    
	[self notifyActiveScreenDisAppear];
}

-(void) initAfterDelay
{
    if([Test activeTest].isNeetToStart) {
        [self.startMeetingMenu showStartMode:YES];
    }
    else {
        [self.startMeetingMenu showCloseMode:NO];
    }
}

-(void) doubleTap:(UIGestureRecognizer*)gesture
{
    [self.chapterPager show];
}


/////////////////////////
#pragma mark startMeetingMenuDelegate

-(void) showEndView
{
    EndMeetingUniversalController *end = [[EndMeetingUniversalController alloc] initWithNibName:@"EndMeetingUniversalController" bundle:nil];
	[self presentViewController:end animated:YES completion:nil];
}

-(void) startMeetingMenuEnd
{
    [self.startMeetingMenu showCloseMode:YES];
    [self showEndView];
}

-(void) startMeetingMenuStart
{
    
}


//////////////////////
#pragma mark Test notifications

- (void) receiveTestStartNotification:(NSNotification *) notification
{
    [Test activeTest].isNeetToStart = NO;
    //[self resetAllPages];
    //[self setPage:currentPage animate:NO];
    [self notifyPageChanged]; //stop current page timer
	[self notifyActiveScreenAppear]; //start new page timer
}

- (void) receiveTestEndNotification:(NSNotification *) notification
{
    [Test activeTest].isNeetToStart = YES;
    [self.startMeetingMenu showStartMode:YES];
    [self resetAllPages];
    [self setPage:0 animate:NO];
    [self notifyPageChanged];
	[self notifyActiveScreenAppear];
}



///////////////////////
#pragma mark BridionBaseDelegate


-(void) bridionBaseMoveToPage:(int)page
{
    [self notifyActiveScreenDisAppear];
    [self setPage:page animate:YES];
}

-(void) bridionBaseChangeHeaderTitle:(NSString*)title
{
    self.lblTopMenu.text = title;
    [self.lblTopMenu setFont:[UIFont fontWithName:@"Tipograf2" size:28]];
}

///////////////////////
#pragma mark Generic Menu

-(IBAction) btnMenuClick:(id)sender
{
    if(self.menu != nil) {
        [self.menu hide];
    }
    else {
        self.menu = [[BridionGMMainMenuView alloc] initWithFrame:CGRectMake(0, 92, 1024, 768 - 92)];
        self.menu.delegate = self;
        [self.menu showInView:self.view];
        [self.view bringSubviewToFront:self.topMenu];
        [self.view bringSubviewToFront:self.startMeetingMenu];
        [self.view bringSubviewToFront:self.btnTools];
        [self notifyActiveScreenDisAppear];
    }
}

-(void) GMMainMenuClosed:(GMMainMenuView *)menu
{
    self.menu = nil;
    [self notifyActiveScreenAppear];
}

-(void) GMMainMenuPageSelected:(int)chapter page:(int)pageNumber
{
    if(self.currentPage == pageNumber) return;
    
	[self notifyActiveScreenDisAppear];
	[self setPage:pageNumber animate:NO];
	[self notifyPageChanged];
	[self notifyActiveScreenAppear];
}

-(void) GMMainMenuShowPdf:(GMMainMenuView *)menu pdf:(PdfFileData *)pdfName
{
    [self openPdf:pdfName];
}

-(void) GMMainMenuShowQuestion
{
    [self showQuestionView];
}

-(void) GMMainMenuShowUnivadis
{
    [super openUnivadis];
}


///////////////////////
#pragma QuestionViewControllerDelegate

-(void) questionViewControllerCloseMe
{
    [self dismissViewControllerAnimated:YES completion:nil];
	finalQuestionController = nil;
}

-(void) showQuestionView
{
    if(finalQuestionController == nil) {
        finalQuestionController = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:[NSBundle mainBundle]];
        finalQuestionController.dataFileName = @"bridion_question.plist";
        finalQuestionController.delegateQ = self;
        finalQuestionController.applicationId = self.applicationId;
        finalQuestionController.answersData = [Test activeTest].answers;
        finalQuestionController.statisticId = BridionStatistictQuestionScreen;
        finalQuestionController.applicationId = self.applicationId;
        [self presentViewController:finalQuestionController animated:YES completion:nil];
    }
}


////////////////////////
#pragma Tools Menu

-(IBAction) btnToolsMenuClick:(id)sender
{
    [super toggleToolsMenu];
}

-(void) openToolsMenu:(GTMAction)action
{
    [super openToolsMenu:action arg:nil];
    [self notifyActiveScreenDisAppear];
}

-(void) GTMMainMenuViewClosed:(GTMMainMenuView*)menu
{
    self.toolsMenu = nil;
    [self notifyActiveScreenAppear];
}

-(void) GTMMainMenuViewHistory:(GTMMainMenuView*)menu
{
    HistoryUniversalViewController *historyController = [[HistoryUniversalViewController alloc] initWithNibName:@"HistoryUniversalViewController" bundle:nil];
    historyController.statisticId = BridionStatistictMenuHistory;
    [self presentViewController:historyController animated:YES completion:nil];
}

-(void) GTMMainMenuViewHistoryDoctor:(GTMMainMenuView*)menu
{
    HistoryUniversalViewController *historyController = [[HistoryUniversalViewController alloc] initWithNibName:@"HistoryUniversalViewController" bundle:nil];
    historyController.statisticId = BridionStatistictMenuHistory;
    historyController.openDoctorModeInLoad = YES;
    [self presentViewController:historyController animated:YES completion:nil]; //change warnings to this
}


///////////////////////
#pragma mark BridionBottomPagerViewDelegate

-(void) bridionBottomPagerPreviewSelected:(int)chapter page:(int)page
{
    if(self.currentPage == page) return;
    
	[self notifyActiveScreenDisAppear];
	[self setPage:page animate:NO];
    [self resetNotVisiblePages];
	[self notifyPageChanged];
	[self notifyActiveScreenAppear];
}

-(void) bridionBottomPagerPreviewClose
{
    [self notifyActiveScreenAppear];
    [self notifyPageChanged];
}

-(void) bridionBottomPagerPreviewOpen
{
    [self notifyActiveScreenDisAppear];
}



//////////////////////////
#pragma mark Page

-(void)initPagesData
{
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [self.pagesData count]; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
}

-(void) setPage:(int)pageNumber
{
	[self setPage:pageNumber animate:YES];
}

-(void) setPage:(int)pageNumber animate:(BOOL)animated
{
	[self loadScrollViewWithPage:pageNumber - 1];
	[self loadScrollViewWithPage:pageNumber];
	[self loadScrollViewWithPage:pageNumber + 1];
	
    _currentPage = pageNumber;
	CGRect frame = _scrollView.frame;
	frame.origin.x = frame.size.width * pageNumber;
	frame.origin.y = 0;
	[_scrollView scrollRectToVisible:frame animated:animated];
    
    if(!animated) {
        [self notifyPageChanged];
    }
}

- (void) scrollToPageAtIndex:(NSInteger)index animated:(BOOL)animated
{
	CGPoint offset = CGPointMake(index * self.scrollView.frame.size.width, 0);
	[self.scrollView setContentOffset:offset animated:animated];
}

-(void)notifyActiveScreenDisAppear
{
	BasePageTimer *controller = [self getControllerAtIndex:_currentPage];
    if ((NSNull *)controller != [NSNull null]) {
        [controller pagewillDisapear];
    }
}

-(void)notifyActiveScreenAppear
{
	BasePageTimer *controller = [self getControllerAtIndex:_currentPage];
    if ((NSNull *)controller != [NSNull null]) {
        [controller pageDidAppear];
    }
}

-(BasePageTimer*)getControllerAtIndex:(int)index
{
	if (index<0 || index>=[self.viewControllers count]) {
		return nil;
	}
	return [self.viewControllers objectAtIndex:_currentPage];
}

/**
 * Reset all pages
 * Used whene full refresh is needed, after refresh load the '0' page
 */
-(void) resetAllPages {
	for (int i=0; i<[self.viewControllers count]; i++) {
        BasePageTimer *controller = [self.viewControllers objectAtIndex:i];
        if ((NSNull *)controller != [NSNull null]) {
            [controller removeFromSuperview];
            [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
        }
	}
}

-(void) resetNotVisiblePages {
	for (int i=0; i<[self.viewControllers count]; i++) {
		if([self isPageVisible:i] == NO) {
			BasePageTimer *controller = [self.viewControllers objectAtIndex:i];
			if ((NSNull *)controller != [NSNull null]) {
				[controller removeFromSuperview];
				[self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
			}
		}
	}
}

-(BOOL) isPageVisible:(int) page
{
	if(page == _currentPage || page == _currentPage + 1 || page == _currentPage - 1) {
		return YES;
	}
	return NO;
}

-(void) notifyPageChanged
{
	if(_currentPage < 0 || _currentPage >= [self.pagesData count]) {
		return;
	}

    BridionPageData *pageData = [self.pagesData objectAtIndex:self.currentPage];
    [self.chapterPager setChapterSelected:pageData.chapter];
}


////////////////////////////
#pragma mark ScrollViewDelegate

-(void)createPage:(int)page
{
	if (page < 0) return;
    if (page >= [self.pagesData count]) return;
    
    BridionPageData *pageData = [self.pagesData objectAtIndex:page];
    BridionBase *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        controller = [[NSClassFromString(pageData.className) alloc] initWithPageNumber:1 size:self.scrollView.bounds.size];
		controller.delegate = self;
        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
    }
	
	if (controller != nil && controller.superview == nil) {
        CGRect frame = _scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.frame = frame;
        [_scrollView addSubview:controller];
    }
}

- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0) return;
    if (page >= [self.pagesData count]) return;
	
	[self createPage:page];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    if (_pageControlUsed) {
        return;
    }
    
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth) / pageWidth) + 1;
	if(_currentPage != page) {
		_currentPage = page;
		[self loadScrollViewWithPage:page - 1];
		[self loadScrollViewWithPage:page];
		[self loadScrollViewWithPage:page + 1];
		[self resetNotVisiblePages];
	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)_scrollView
{
    _pageControlUsed = NO;
	[self notifyActiveScreenDisAppear];
}

-(void) scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    _pageControlUsed = NO;
	[self notifyActiveScreenAppear];
    [self notifyPageChanged];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControlUsed = NO;
	[self notifyActiveScreenAppear];
    [self notifyPageChanged];
}

-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
