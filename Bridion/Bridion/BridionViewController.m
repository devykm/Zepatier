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
#import "CustomCallsPageData.h"
#import "Test.h"
#import "Constants.h"
#import "HistoryUniversalViewController.h"
#import "FTAnimation+UIView.h"
#import "VideoViewController.h"
#import "ZepatierPageData.h"
#import "ZepatierChapterData.h"
#import "ArcBasePageView.h"
@interface BridionViewController ()
@property (nonatomic, retain) NSMutableArray *pagesData;
@property (nonatomic, retain) NSMutableArray *chapterArray;

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, assign) int currentPage;

@end

@implementation BridionViewController
{
    BOOL menuOpened;

    BOOL _pageControlUsed;
    QuestionViewController *finalQuestionController;
}
static  BridionViewController * instance;

+(BridionViewController*)getInstance{
    if (instance==nil)
    {
        instance = [[BridionViewController alloc] init];
    }
    return instance;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.applicationId = APPLICATION_ZEPATIER;
    [self.view setBackgroundColor:[UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0]];
    
    // set MSD icon btn to inactive
    [self.btnTools setUserInteractionEnabled:NO];
    
    self.pagesData = [ZepatierChapterData loadPagesData:@"ZepatierChapters.plist"];
    self.chapterArray = [ZepatierChapterData loadData:@"ZepatierChapters.plist"];
	[self initPagesData];
    self.topLogo.hidden = YES;

    if((self.scrollMain.hidden = YES)){
        self.scrollMain.hidden = NO;
    }
    
    self.scrollMain.contentSize = CGSizeMake(self.scrollMain.width * [self.pagesData count], self.scrollMain.height);
    [self.scrollMain setDelaysContentTouches:NO];
    if (self.lastPage != 0){
        //self.mainScrollView.hidden = NO;
        self.currentPage = self.lastPage;
        [self loadScrollViewWithPage:self.currentPage];
        [self scrollToPageAtIndex:self.currentPage animated:NO];
        [self notifyActiveScreenAppear];
        [self notifyPageChanged];
        
    }else{
        self.currentPage = 0;
        [self loadScrollViewWithPage:0];
        //[self loadScrollViewWithPage:1];
        [self scrollToPageAtIndex:self.currentPage animated:NO];
        
        [self notifyActiveScreenAppear];
        [self notifyPageChanged];
        
    }

	
    //Create first pages
//    self.currentPage = 0;
//	[self loadScrollViewWithPage:0];
//    [self loadScrollViewWithPage:1];
//    
//	[self notifyActiveScreenAppear];
    
    //Init bottom pager
    self.chapterPager.delegate = self;
    [self.chapterPager initChapters:self.chapterArray];
    
    //[self notifyPageChanged];
	
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
    [self.scrollMain addGestureRecognizer:tap];
    instance = self;
    
}

-(void)setCustomCallsFromPage:(NSMutableArray *)customCallsArray page:(int)page{
    [self.customCallsMenu removeFromSuperview];
    //[self.view setBackgroundColor:[UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1.0]];
    [self.btnTools setUserInteractionEnabled:NO];
    //self.scrollMain.contentSize = CGSizeMake(self.scrollMain.width , self.scrollMain.height);
    
    
    [self.pagesData removeAllObjects];
    self.pagesData = customCallsArray;
    //[self resetNotVisiblePages];
    [self initPagesData];
    self.scrollMain.contentSize = CGSizeMake(self.scrollMain.width * [self.pagesData count], self.scrollMain.height);
    [self.scrollMain setDelaysContentTouches:NO];
    //menuOpened = YES;
    self.currentPage = page;
    //[self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:page];
    [self notifyActiveScreenAppear];
    [self scrollToPageAtIndex:page animated:NO];
    
    
    self.startMeetingMenu.delegate = self;
    //self.chapterPager.delegate = self;
    //[self.chapterPager initChapters:self.chapterArray];
    //[self.lblChapterTitle setFont:[UIFont fontWithName:@"Tipograf2" size:30]];
    instance = self;
    
}

-(void) setCustomCallsScrollView:(NSMutableArray *)customCallsArray appID:(int)appId
{
    [self.customCallsMenu removeFromSuperview];
    //self.scrollMain.contentSize = CGSizeMake(self.scrollMain.width , self.scrollMain.height);
    //[self resetNotVisiblePages];
    
    [self.pagesData removeAllObjects];
    self.pagesData = customCallsArray;
    
    [self initPagesData];
    self.scrollMain.contentSize = CGSizeMake(self.scrollMain.width * [self.pagesData count], self.scrollMain.height);
    [self.scrollMain setDelaysContentTouches:NO];
    
    self.currentPage = 0;
    [self loadScrollViewWithPage:0];
    //[self loadScrollViewWithPage:1];
    [self notifyActiveScreenAppear];
    [self scrollToPageAtIndex:0 animated:NO];
    self.startMeetingMenu.delegate = self;
    //self.chapterPager.delegate = self;
    //[self.chapterPager initChapters:self.chapterArray];
    //[self.lblChapterTitle setFont:[UIFont fontWithName:@"Tipograf2" size:30]];
    instance = self;
    
}


-(void) viewWillAppear:(BOOL )animated
{
    [super viewWillAppear:animated];
    
    if([self.menu isOpen]) {
        [self.menu pageDidAppear];
        return;
    }
    if([self.toolsMenu isOpen]) {
        [self.toolsMenu pageDidAppear];
        return;
    }
	//[self notifyActiveScreenAppear];
    
    [self performSelector:@selector(initAfterDelay) withObject:nil afterDelay:0.2];
}

-(void) viewWillDisappear:(BOOL )animated
{
     [super viewWillDisappear:animated];
    
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
    if(menuOpened == YES)return;
    [self.chapterPager show];
}

- (IBAction)btnPredictableCompleteClick:(id)sender
{
    if (menuOpened == YES)return;
    [self notifyActiveScreenDisAppear];
    [self setPage:1 animate:NO];
    [self notifyActiveScreenAppear];
    
    [self.menu hide];
}

/////////////////////////
#pragma mark startMeetingMenuDelegate

-(void) showEndView
{
    EndMeetingUniversalController *end = [[EndMeetingUniversalController alloc] initWithNibName:@"EndMeetingViewController" bundle:nil];
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
    
    // for portal
    [self.startMeetingMenu showCloseMode:YES];
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
    
    [sender setEnabled:NO];
    double delayInSeconds = 1.4;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [sender setEnabled:YES];
    });
    if (self.customCallsMenu != nil){
        [self customCallOpenMenu:self.customCallOpen];
    }
    if(self.menu != nil) {
        [self.menu hide];
    }
    else {
        self.menu = [[BridionGMMainMenuView alloc] initWithFrame:CGRectMake(0, 86, 1024, 768 - 86)];
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
        finalQuestionController.dataFileName = @"Zepatier_question.plist";
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
	CGRect frame = self.scrollMain.frame;
	frame.origin.x = frame.size.width * pageNumber;
	frame.origin.y = 0;
	[self.scrollMain scrollRectToVisible:frame animated:animated];
    
    if(!animated) {
        [self notifyPageChanged];
    }
    if(self.currentPage >= 1 ){
        self.topLogo.hidden = NO;
    }else{
        self.topLogo.hidden = YES;
        
    }

}

- (void) scrollToPageAtIndex:(NSInteger)index animated:(BOOL)animated
{
	CGPoint offset = CGPointMake(index * self.scrollMain.frame.size.width, 0);
	[self.scrollMain setContentOffset:offset animated:animated];
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
            @try {
                if ([controller isKindOfClass:[PDFJanViewController class]]){
                    PDFJanViewController *controller = [self.viewControllers objectAtIndex:i];
                    
                    [controller.view removeFromSuperview];
                    [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                }else if ([controller isKindOfClass:[VideoViewController class]]){
                    VideoViewController *controller = [self.viewControllers objectAtIndex:i];
                    
                    [controller.view removeFromSuperview];
                    [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                }else{
                    [controller removeFromSuperview];
                    [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                    
                }
            }
            @catch (NSException *exception) {
                if ([controller isKindOfClass:[PDFJanViewController class]]){
                    PDFJanViewController *controller = [self.viewControllers objectAtIndex:i];
                    
                    [controller.view removeFromSuperview];
                    [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                    
                }else if ([controller isKindOfClass:[VideoViewController class]]){
                    VideoViewController *controller = [self.viewControllers objectAtIndex:i];
                    
                    [controller.view removeFromSuperview];
                    [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                }else{
                    [controller removeFromSuperview];
                    [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                    
                }
            }
            

        }
	}
}

-(void) resetNotVisiblePages {
    for (int i=0; i<[self.viewControllers count]; i++) {
        if([self isPageVisible:i] == NO) {
            BasePageTimer *controller = [self.viewControllers objectAtIndex:i];
            if ((NSNull *)controller != [NSNull null]) {
                @try {
                    if ([controller isKindOfClass:[PDFJanViewController class]]){
                        PDFJanViewController *controller = [self.viewControllers objectAtIndex:i];
                        
                        [controller removeFromParentViewController];
                        [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                    
                    }else if ([controller isKindOfClass:[VideoViewController class]]){
                        VideoViewController *controller = [self.viewControllers objectAtIndex:i];
                        
                        [controller removeFromParentViewController];
                        [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                        }else{
                        [controller removeFromSuperview];
                        [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                        
                    }
                }
                
                
                @catch (NSException *exception) {
                    if ([controller isKindOfClass:[PDFJanViewController class]]){
                        PDFJanViewController *controller = [self.viewControllers objectAtIndex:i];
                        
                        [controller.view removeFromSuperview];
                        [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                    
                    }else if ([controller isKindOfClass:[VideoViewController class]]){
                        VideoViewController *controller = [self.viewControllers objectAtIndex:i];
                        
                        [controller removeFromParentViewController];
                        [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                        }else{
                        [controller removeFromSuperview];
                        [self.viewControllers replaceObjectAtIndex:i withObject:[NSNull null]];
                        
                    }
                }
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

    ZepatierPageData *pageData = [self.pagesData objectAtIndex:self.currentPage];
    [self.chapterPager setChapterSelected:pageData.chapter];
}
-(void)openMenu{
    self.menu = [[BridionGMMainMenuView alloc] initWithFrame:CGRectMake(0, 92, 1024, 768 - 92)];
    self.menu.delegate = self;
    [self.menu showInView:self.view];
    [self.view bringSubviewToFront:self.topMenu];
    [self.view bringSubviewToFront:self.startMeetingMenu];
    [self.view bringSubviewToFront:self.btnTools];
    [self notifyActiveScreenDisAppear];
    
}


////////////////////////////
#pragma mark ScrollViewDelegate

-(void)createPage:(int)page
{
	if (page < 0) return;
    if (page >= [self.pagesData count]) return;
    
    ZepatierPageData *pageData = [self.pagesData objectAtIndex:page];
    BridionBase *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        controller = [[NSClassFromString(pageData.className) alloc] initWithPageNumber:page size:self.scrollMain.bounds.size];
		controller.delegate = self;
        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
    }
	
	if (controller != nil && controller.superview == nil) {
        CGRect frame = self.scrollMain.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.frame = frame;
        [self.scrollMain addSubview:controller];
    }
    if(self.currentPage >= 1 ){
        self.topLogo.hidden = NO;
    }else{
        self.topLogo.hidden = YES;
        
    }

}

-(void)createPageForCustomCalls:(int)page{
    
    
    if (page < 0) return;
    if (page >= [self.pagesData count]) return;
    if(self.currentPage >= 1 ){
        self.topLogo.hidden = NO;
    }else{
        self.topLogo.hidden = YES;
        
    }

    CustomCallsPageData *pageData = [self.pagesData objectAtIndex:page];
    
    BridionBase *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        
        if (pageData.prodId == 5){
            
            //ArcBasePageView *controller = [self.viewControllers objectAtIndex:page];
            
                controller = [[NSClassFromString(pageData.className) alloc] initWithPageNumber:page size:CGSizeMake (950, 530)];
                if([pageData.className isEqualToString:@"pdf"]){
                    
                    CustomCallsPageData *pagePdf = pageData;
                    
                    [[BridionViewController getInstance] performSelector:@selector(openMenu)];
                    
                    [[BridionGMMainMenuView getInstance] showPdfMenu:5 section:pagePdf.materialSection statisticId:-1 animate:NO];
                    
                    PDFJanViewController *controller = [self.viewControllers objectAtIndex:page];
                    controller = [[PDFJanViewController alloc] init];
                    
                    controller.applicationId = self.applicationId;
                    [[GMPdfMenu getInstance] PdfOpenClickshowPdfInCustom:pagePdf.materialID vcDelegate:(PDFJanViewController *)controller];
                    [[BridionGMMainMenuView getInstance]removeFromSuperview];
                    [[GMPdfMenu getInstance]removeFromSuperview];
                    
                    if (controller != nil && controller.view.superview == nil) {
                        CGRect frame = self.scrollMain.frame;
                        frame.origin.x = frame.size.width * page;
                        frame.origin.y = 0;
                        controller.view.frame = frame;
                        [self.scrollMain addSubview:controller.view];
                    }
                    if(controller != nil)
                    {
                        controller.delegate = self;
                        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
                    }
                    
        
                    return;
                    
                    
                }else if([pageData.className isEqualToString:@"vid"]){
                    CustomCallsPageData *pagevideo = pageData;
                    
                    
                    
                    [[BridionViewController getInstance] performSelector:@selector(openMenu)];
                    
                    [[BridionGMMainMenuView getInstance] showPdfMenu:5 section:pagevideo.materialSection statisticId:-1 animate:NO];
                    VideoViewController *controller = [self.viewControllers objectAtIndex:page];
                    controller = [[VideoViewController alloc] init];
                    controller.applicationId = self.applicationId;
                    [[GMPdfMenu getInstance] PdfOpenClickshowPdfInCustomVideo:pagevideo.materialID vcDelegate:(VideoViewController *)controller];
                    [[BridionGMMainMenuView getInstance]removeFromSuperview];
                    [[GMPdfMenu getInstance]removeFromSuperview];
                    
                    if (controller != nil && controller.view.superview == nil) {
                        CGRect frame = self.scrollMain.frame;
                        frame.origin.x = frame.size.width * page;
                        frame.origin.y = 0;
                        controller.view.frame = frame;
                        [self.scrollMain addSubview:controller.view];
                    }
                    if(controller != nil)
                    {
                        controller.delegate = self;
                        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
                    }
                    return;
                    
                }
                
                if(controller != nil)
                {
                    //controller.delegate = self;
                    [self.viewControllers replaceObjectAtIndex:page withObject:controller];
                }
                if (controller != nil && controller.superview == nil) {
                    CGRect frame = self.scrollMain.frame;
                    frame.origin.x = frame.size.width * page +40;
                    frame.origin.y = self.scrollMain.frame.origin.y;
                    
                    controller.frame = frame;
                    [self.scrollMain addSubview:controller];
                    //[self.scrollView bringSubviewToFront:controller];
                    //[self.view bringSubviewToFront:self.startMeetingMenu];
                    
                }
                
        
  
            
        }else{
        
        controller = [[NSClassFromString(pageData.className) alloc] initWithPageNumber:page size:self.scrollMain.bounds.size];
        if([pageData.className isEqualToString:@"pdf"]){
            
            //TAMIR SET PDF
            CustomCallsPageData *pagePdf = pageData;
            
            [[BridionViewController getInstance] performSelector:@selector(openMenu)];
            
            [[BridionGMMainMenuView getInstance] showPdfMenu:48 section:pagePdf.materialSection statisticId:-1 animate:NO];
            
            //TAMIR create the controller
            //BridionPageData *pageData = [self.pagesData objectAtIndex:page];
            
            PDFJanViewController *controller = [self.viewControllers objectAtIndex:page];
            controller = [[PDFJanViewController alloc] init];
            
            controller.applicationId = self.applicationId;
            [[GMPdfMenu getInstance] PdfOpenClickshowPdfInCustom:pagePdf.materialID vcDelegate:(PDFJanViewController *)controller];
            [[BridionGMMainMenuView getInstance]removeFromSuperview];
            [[GMPdfMenu getInstance]removeFromSuperview];
            
            if (controller != nil && controller.view.superview == nil) {
                CGRect frame = self.scrollMain.frame;
                frame.origin.x = frame.size.width * page;
                frame.origin.y = 0;
                controller.view.frame = frame;
                [self.scrollMain addSubview:controller.view];
            }
            if(controller != nil)
            {
                controller.delegate = self;
                [self.viewControllers replaceObjectAtIndex:page withObject:controller];
            }
        
            return;
            
            
        }else if([pageData.className isEqualToString:@"vid"]){
            CustomCallsPageData *pagevideo = pageData;
            
            
            
            [[BridionViewController getInstance] performSelector:@selector(openMenu)];
            
            [[BridionGMMainMenuView getInstance] showPdfMenu:48 section:pagevideo.materialSection statisticId:-1 animate:NO];
            VideoViewController *controller = [self.viewControllers objectAtIndex:page];
            controller = [[VideoViewController alloc] init];
            controller.applicationId = self.applicationId;
            [[GMPdfMenu getInstance] PdfOpenClickshowPdfInCustomVideo:pagevideo.materialID vcDelegate:(VideoViewController *)controller];
            [[BridionGMMainMenuView getInstance]removeFromSuperview];
            [[GMPdfMenu getInstance]removeFromSuperview];
            
            if (controller != nil && controller.view.superview == nil) {
                CGRect frame = self.scrollMain.frame;
                frame.origin.x = frame.size.width * page;
                frame.origin.y = 0;
                controller.view.frame = frame;
                [self.scrollMain addSubview:controller.view];
            }
            if(controller != nil)
            {
                controller.delegate = self;
                [self.viewControllers replaceObjectAtIndex:page withObject:controller];
            }
            return;
            
        }
    
        if(controller != nil)
        {
            controller.delegate = self;
            [self.viewControllers replaceObjectAtIndex:page withObject:controller];
        }
        if (controller != nil && controller.superview == nil) {
            CGRect frame = self.scrollMain.frame;
            frame.origin.x = frame.size.width * page;
            frame.origin.y = 0;
            controller.frame = frame;
            [self.scrollMain addSubview:controller];
        }
        
    }
        
        
        
        
        
        
        
        
    }
    
}

-(void)bridionBaseViewOpenPage:(int)page animated:(BOOL)animated
{
    [self notifyActiveScreenDisAppear];
    [self setPage:page animate:NO];
    [self resetNotVisiblePages];

    [self notifyActiveScreenAppear];
    [self notifyPageChanged];

}

- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0) return;
    if (page >= [self.pagesData count]) return;
	
    if (menuOpened == YES ){
       	[self createPageForCustomCalls:page];
        
    }else{
        [self createPage:page];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    if (_pageControlUsed) {
        return;
    }
    
    CGFloat pageWidth = self.scrollMain.frame.size.width;
    int page = floor((self.scrollMain.contentOffset.x - pageWidth) / pageWidth) + 1;
	if(_currentPage != page) {
		_currentPage = page;
               if (self.customCallsMenu != nil){
            [self loadScrollViewWithPage:page];
            [self resetNotVisiblePages];
            
        }else{
		[self loadScrollViewWithPage:page - 1];
		[self loadScrollViewWithPage:page];
		[self loadScrollViewWithPage:page + 1];
		[self resetNotVisiblePages];
        }
	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
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

- (IBAction)customCallOpenMenu:(UIButton *)sender {
    
    
    if (menuOpened == YES){
        
    }
    if (menuOpened == NO){
        
        
        if(self.menu != nil) {
            [self.menu hide];
        }
        [self.view bringSubviewToFront:self.btnTools];
        [self.view bringSubviewToFront:self.topMenu];
        self.customCallOpen.transform = CGAffineTransformMakeScale(0.1, 0.1);
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:6.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.customCallOpen.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
        }];
        //        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
        //            self.facebookPhotos.transform = CGAffineTransformIdentity
        self.waitingCC.hidden = NO;
        [self getcustomCallsInApp:self.applicationId];
        sender.enabled= NO;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(openCustomCallMenuAfterUpdate)
                                                     name:@"CustomCallsReturned"
                                                   object:nil];
        
        
        
    }else{
        if(self.customCallsMenu != nil) {
            
            [self.customCallsMenu removeFromSuperview];
            self.customCallsMenu = nil;
        }
        if(self.menu != nil) {
            [self.menu hide];
        }

        self.customCallOpen.transform = CGAffineTransformMakeScale(0.1, 0.1);
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:6.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.customCallOpen.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
        }];
        
        UIImage *customMenuOpened = [UIImage imageNamed:@"icon_call@2x.png"];
        [[self customCallOpen] setImage :customMenuOpened forState:UIControlStateNormal];
        menuOpened = NO;
        //self.currentPage = self.lastPage;
        //self.scrollMain.contentSize = CGSizeMake(self.scrollMain.width, self.scrollMain.height);
        //[self.scrollMain.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        [self.scrollMain.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        //[self.scrollMain scrollRectToVisible:CGRectMake(1024*self.currentPage, 0, 1024, self.scrollMain.height) animated:NO];
        [self viewDidLoad];
        //[self getcustomCalls:self.applicationId];
        
        
    }
    
    
    
}
-(void) getcustomCallsInApp:(int)appId  {
    
    self.customCallManager = [[DataManager alloc] initWithDelegate:(id<DataManagerDelegate>)self];
    [self.customCallManager getCustomCallsFilesFromButton:[Test activeUser].userName appId:appId];
}
-(void)openCustomCallMenuAfterUpdate{
    UIImage *customMenuOpened = [UIImage imageNamed:@"icon_call_x@2x.png"];
    [[self customCallOpen] setImage :customMenuOpened forState:UIControlStateNormal];
    [self.scrollMain.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    self.customCallsMenu = [[customCallsMenuView alloc] initWithFrame:CGRectMake(0, 86, 1024, 678 )];
    self.customCallsMenu.delegate = self;
    [self.customCallsMenu showInView:self.view];
    [self.view bringSubviewToFront:self.btnTools];
    menuOpened = YES;
    self.lastPage = self.currentPage;
    //self.lblChapterTitle.hidden = YES;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CustomCallsReturned" object:nil];
    self.waitingCC.hidden = YES;
    self.customCallOpen.enabled = YES;
    //[self.startMeetingMenu showCloseMode:YES];
    
}
-(void)getcustomCalls:(int)appID{
    self.customCallManager = [[DataManager alloc] initWithDelegate:(id<DataManagerDelegate>)self];
    [self.customCallManager getCustomCallsFiles:[Test activeUser].userName appId:appID];
}
-(void) backFromPageDate{
    
    self.customCallsMenu = [[customCallsMenuView alloc] initWithFrame:CGRectMake(0, 86, 1024, 678 )];
    self.customCallsMenu.delegate = self;
    [self.customCallsMenu showInView:self.view];
    //[self.view bringSubviewToFront:self.startMeetingMenu];
    [self.view bringSubviewToFront:self.topMenu];
    //
    //[self.view addSubview:customHeaderView];
    //[self notifyActiveScreenWillDisappear];
    [self.view bringSubviewToFront:self.btnTools];
    menuOpened = YES;
}

-(void) dataManager:(DataManager *)manager dataDidFailed:(NSString *)error forType:(int)type
{
    NSLog(error);
}
-(void) dataManager:(DataManager*)manager dataDidReceived:(id)data forType:(int)type
{
    
    if(type == REQUEST_GET_CUSTOM_CALLS_FILES){
        NSError *error;
        
        //        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cc.plist" ofType:nil];
        //        [data writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }
    
    
    
}


-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
