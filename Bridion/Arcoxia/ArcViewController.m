//
//  ViewController.m
//  Arcoxia
//
//  Created by ykm dev on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArcViewController.h"
#import "ChapterData.h"
#import "Test.h"
#import "Constants.h"
#import "UIView-Extensions.h"
#import "HistoryUniversalViewController.h"
#import "EndMeetingUniversalController.h"
#import "FTAnimation+UIView.h"
#import "InfoControl.h"
#import "CustomCallsChapterData.h"
#import "BasePageTimer.h"
#import "CustomCallsPageData.h"
#import "CustomCallsChapterData.h"

//#import "FosBasePageView.h"
#define ORIGINAL_Y_FRAME_TOP_MENU 90
@interface ArcViewController ()

@end

@implementation ArcViewController
UIButton *infoButton;
UIImageView *referenceView;
static ArcViewController * instance;
+(ArcViewController*)getInstance{
    if (instance==nil)
    {
        instance = [[ArcViewController alloc] init];
    }
    return instance;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.applicationId = APPLICATION_ARCOXIA;
    self.chapterArray = [ChapterData loadData:@"ArcChapters.plist"];
    self.profileChapterArray = [ChapterData loadData:@"profileChapters.plist"];
    self.arcAll = [ChapterData loadData:@"ArcAll.plist"];
    self.CustomCallArray = [CustomCallsChapterData loadCustomCallData:@"customCallList.plist"];
    self.effiencyMenuButton.alpha = 0.0;
    self.combinationMenuButton.alpha = 0.0;
    self.dosageMenuButton.alpha = 0.0;
    self.safetyMenuButton.alpha = 0.0;
    self.timeMenuButton.alpha = 0.0;
    
    [self.safetyMenuButton setY:self.safetyMenuButton.frame.origin.y - 50];
    [self.effiencyMenuButton setY:self.effiencyMenuButton.frame.origin.y - 50];
    [self.combinationMenuButton setY:self.combinationMenuButton.frame.origin.y - 50];
    [self.dosageMenuButton setY:self.dosageMenuButton.frame.origin.y - 50];
    [self.timeMenuButton setY:self.timeMenuButton.frame.origin.y - 50];

    [self.btnTools setUserInteractionEnabled:NO];
    
    self.startMeetingMenu.delegate = self;
    [self.view bringSubviewToFront:self.startMeetingMenu];
    self.chapterCenterPager.delegate = self;
    [self.chapterCenterPager initChapters:self.profileChapterArray];;
    
    [self.chapterManager initControlNew:self.profileChapterArray];
    self.chapterManager.delegateM = self;
    [self.chapterManager setHidden:YES];
    
    
    [self.view bringSubviewToFront:self.headerView];
    [self.view bringSubviewToFront:self.btnTools];

    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(670, 710, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestStartNotification:) 
                                                 name:@"TestStartNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestEndNotification:) 
                                                 name:@"TestEndNotification"
                                               object:nil];
    
    instance = self;
}

-(void)setCustomCallsFromPage:(NSMutableArray *)customCallsArray page:(int)page{
    if (self.customCallsMenu != nil){
        [self.customCallsMenu removeFromSuperview];
    }
    [self.scrollView removeFromSuperview];
    
    [self.CustomCallArray removeAllObjects];
    self.CustomCallArray = customCallsArray;
    [self initPagesData];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 90, 1024, 600)];
    self.scrollView.contentSize = CGSizeMake(1024.0 * [self.CustomCallArray count],  600);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.bounces = YES;
    [self.scrollView setDelegate:self];
    [self.scrollView setUserInteractionEnabled:YES];
    self.scrollView.canCancelContentTouches = NO;
    [self.scrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
    [self.scrollView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.scrollView];
    self.currentPage = page;
    [self loadScrollViewWithPage:page];


    [self notifyActiveScreenAppear];
    
    [self scrollToPageAtIndex:page animated:NO];
    self.startMeetingMenu.delegate = self;
    [self.view bringSubviewToFront:self.startMeetingMenu];
    
    
    
    instance = self;
    
}

-(void) setCustomCallsScrollView:(NSMutableArray *)customCallsArray appID:(NSInteger*)appId
{
    if (self.customCallsMenu != nil){
        [self.customCallsMenu removeFromSuperview];
    }
    [self.scrollView removeFromSuperview];
    
    
    [self.CustomCallArray removeAllObjects];
    self.CustomCallArray = customCallsArray;
    
    [self initPagesData];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 90, 1024, 600)];
    self.scrollView.contentSize = CGSizeMake(1024.0 * [self.CustomCallArray count],  600);

    self.scrollView.pagingEnabled = YES;
    self.scrollView.clipsToBounds = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.bounces = YES;
    [self.scrollView setDelegate:self];
    [self.scrollView setUserInteractionEnabled:YES];
    self.scrollView.canCancelContentTouches = NO;
    [self.scrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
    [self.scrollView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.scrollView];
    self.currentPage = 0;

    [self loadScrollViewWithPage:0];

    [self notifyActiveScreenAppear];
    
    
    [self scrollToPageAtIndex:0 animated:NO];
    
    instance = self;
    
}



-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arcoxia_HP_ref534x946@2x.png"]];
        [referenceView setFrame:CGRectMake(180, 490, 640, 270)];
        referenceView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:referenceView];
        [referenceView setAlpha:0.0f];
        
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:1.0f];
            
        } completion:^(BOOL finished) {
            
            
        }];
    }else{
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [referenceView removeFromSuperview];
        }];
        
    }
}

-(void)setUIForCustomPager{
    UIImageView *back = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 900, 500)];
    [back setImage:[UIImage imageNamed:@"arc_basepage_back.png"]];
    [self.scrollView addSubview:back];
    
    self.container = [[UIView alloc] initWithFrame:CGRectMake(25, 76, 900, 420)];
    [self.container setBackgroundColor:[UIColor clearColor]];
    [self.scrollView addSubview:self.container];

}

-(void)initPagesData
{
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [self.CustomCallArray count]; i++) {
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
    if (self.customCallsMenu != nil){
        self.customCallsMenu.hidden = YES;
    }
    [self loadScrollViewWithPage:pageNumber];
    
    self.currentPage = pageNumber;
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * pageNumber;
    frame.origin.y = self.scrollView.frame.origin.y;
    [self.scrollView scrollRectToVisible:frame animated:NO];
    
    
}

- (void) scrollToPageAtIndex:(NSInteger)index animated:(BOOL)animated
{
    CGPoint offset = CGPointMake(index * self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:offset animated:animated];
}

-(ArcBasePageView*)getControllerAtIndex:(int)index
{
    if (index<0 || index>=[self.viewControllers count]) {
        return nil;
    }
    return [self.viewControllers objectAtIndex:self.currentPage];
}

-(void)notifyActiveScreenWillDisappear
{
    ArcBasePageView *controller = [self getControllerAtIndex:self.currentPage];
    if ((NSNull *)controller != [NSNull null]) {
        [controller pagewillDisapear];
    }
}

-(void)notifyActiveScreenAppear
{
    ArcBasePageView *controller = [self getControllerAtIndex:self.currentPage];
    if ((NSNull *)controller != [NSNull null]) {
        [controller pageDidAppear];
    }
}

- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0) return;
    if (page >= [self.CustomCallArray count]) return;
    if (menuOpened == YES ){
       	[self createPageForCustomCalls:page];
        
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
  
    
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth) / pageWidth) + 1;
    if(self.currentPage != page) {
        
        self.currentPage = page;
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

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)_scrollView {
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

-(void)createPageForCustomCalls:(int)page
{
    if (page < 0) return;
    if (page >= [self.CustomCallArray count]) return;
    
    CustomCallsPageData *pageData = [self.CustomCallArray objectAtIndex:page];
    
    ArcBasePageView *controller = [self.viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        
        
            if (pageData.prodId == 5){
                
            [self removeBackViews];
            self.backImageView.image = [UIImage imageNamed:@"arc_back.png"];
            
            ArcBasePageView *controller = [self.viewControllers objectAtIndex:page];
            if ((NSNull *)controller == [NSNull null]) {
               
                controller = [[NSClassFromString(pageData.className) alloc] initWithPageNumber:page size:CGSizeMake (950, 530)];
                if([pageData.className isEqualToString:@"pdf"]){
                    
                    CustomCallsPageData *pagePdf = pageData;
                    
                    [[ArcViewController getInstance] performSelector:@selector(openMenu)];
                    
                    [[ArcGMMainMenuView getInstance] showPdfMenu:5 section:pagePdf.materialSection statisticId:-1 animate:NO];
                
                    PDFJanViewController *controller = [self.viewControllers objectAtIndex:page];
                    controller = [[PDFJanViewController alloc] init];
                    
                    controller.applicationId = self.applicationId;
                    [[GMPdfMenu getInstance] PdfOpenClickshowPdfInCustom:pagePdf.materialID vcDelegate:(PDFJanViewController *)controller];
                    [[ArcGMMainMenuView getInstance]removeFromSuperview];
                    [[GMPdfMenu getInstance]removeFromSuperview];
                    
                    if (controller != nil && controller.view.superview == nil) {
                        CGRect frame = self.scrollView.frame;
                        frame.origin.x = frame.size.width * page;
                        frame.origin.y = 0;
                        frame.size.height = self.scrollView.frame.size.height + 78;

                        controller.view.frame = frame;
                        [self.scrollView addSubview:controller.view];
                        [self.scrollView bringSubviewToFront:controller.view];
                        [self.view bringSubviewToFront:self.startMeetingMenu];

                    }
                    if(controller != nil)
                    {
                        //controller.delegate = self;
                        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
                    }
                    
                    
                    return;
                    
                    
                }else if([pageData.className isEqualToString:@"vid"]){
                    CustomCallsPageData *pagevideo = pageData;
                    
                    
                    
                    [[ArcViewController getInstance] performSelector:@selector(openMenu)];
                    
                    [[ArcGMMainMenuView getInstance] showPdfMenu:5 section:pagevideo.materialSection statisticId:-1 animate:NO];
                    VideoViewController *controller = [self.viewControllers objectAtIndex:page];
                    controller = [[VideoViewController alloc] init];
                    controller.applicationId = self.applicationId;
                    [[GMPdfMenu getInstance] PdfOpenClickshowPdfInCustomVideo:pagevideo.materialID vcDelegate:(VideoViewController *)controller];
                    [[ArcGMMainMenuView getInstance]removeFromSuperview];
                    [[GMPdfMenu getInstance]removeFromSuperview];
                    
                    if (controller != nil && controller.view.superview == nil) {
                        CGRect frame = self.scrollView.frame;
                        frame.origin.x = frame.size.width * page;
                        frame.origin.y = 0;
                        frame.size.height = self.scrollView.frame.size.height + 78;

                        controller.view.frame = frame;
                        [self.scrollView addSubview:controller.view];
                        [self.scrollView bringSubviewToFront:controller.view];
                        [self.view bringSubviewToFront:self.startMeetingMenu];

                        
                    }
                    if(controller != nil)
                    {
                        //controller.delegate = self;
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
                    CGRect frame = self.scrollView.frame;
                    frame.origin.x = frame.size.width * page +40;
                    frame.origin.y = self.scrollView.frame.origin.y;
                    
                    controller.frame = frame;
                    [self.scrollView addSubview:controller];
                    [self.scrollView bringSubviewToFront:controller];
                    [self.view bringSubviewToFront:self.startMeetingMenu];
                    
                }
                
                }
                
            }else{
                
                    
                    controller = [[NSClassFromString(pageData.className) alloc] initWithPageNumber:page size:self.scrollView.bounds.size];
                    if([pageData.className isEqualToString:@"pdf"]){
                        
                        //TAMIR SET PDF
                        CustomCallsPageData *pagePdf = pageData;
                        
                        [[ArcViewController getInstance] performSelector:@selector(openMenu)];
                        
                        [[ArcGMMainMenuView getInstance] showPdfMenu:48 section:pagePdf.materialSection statisticId:-1 animate:NO];
                        
                        //TAMIR create the controller
                        //BridionPageData *pageData = [self.pagesData objectAtIndex:page];
                        
                        PDFJanViewController *controller = [self.viewControllers objectAtIndex:page];
                        controller = [[PDFJanViewController alloc] init];
                        
                        controller.applicationId = self.applicationId;
                        [[GMPdfMenu getInstance] PdfOpenClickshowPdfInCustom:pagePdf.materialID vcDelegate:(PDFJanViewController *)controller];
                        [[ArcGMMainMenuView getInstance]removeFromSuperview];
                        [[GMPdfMenu getInstance]removeFromSuperview];
                        
                        if (controller != nil && controller.view.superview == nil) {
                            CGRect frame = self.scrollView.frame;
                            frame.origin.x = frame.size.width * page;
                            frame.origin.y = 0;
                            frame.size.height = self.scrollView.frame.size.height + 78;
                            
                            controller.view.frame = frame;
                            [self.scrollView addSubview:controller.view];
                            [self.scrollView bringSubviewToFront:controller.view];
                            [self.view bringSubviewToFront:self.startMeetingMenu];
                            
                        }
                        if(controller != nil)
                        {
                            //controller.delegate = self;
                            [self.viewControllers replaceObjectAtIndex:page withObject:controller];
                        }
                        
                        return;
                        
                        
                    }else if([pageData.className isEqualToString:@"vid"]){
                        CustomCallsPageData *pagevideo = pageData;
                        
                        
                        
                        [[ArcViewController getInstance] performSelector:@selector(openMenu)];
                        
                        [[ArcGMMainMenuView getInstance] showPdfMenu:48 section:pagevideo.materialSection statisticId:-1 animate:NO];
                        VideoViewController *controller = [self.viewControllers objectAtIndex:page];
                        controller = [[VideoViewController alloc] init];
                        controller.applicationId = self.applicationId;
                        [[GMPdfMenu getInstance] PdfOpenClickshowPdfInCustomVideo:pagevideo.materialID vcDelegate:(VideoViewController *)controller];
                        [[ArcGMMainMenuView getInstance]removeFromSuperview];
                        [[GMPdfMenu getInstance]removeFromSuperview];
                        
                        if (controller != nil && controller.view.superview == nil) {
                            CGRect frame = self.scrollView.frame;
                            frame.origin.x = frame.size.width * page;
                            frame.origin.y = 0;
                            frame.size.height = self.scrollView.frame.size.height + 78;
                            
                            controller.view.frame = frame;
                            [self.scrollView addSubview:controller.view];
                            [self.scrollView bringSubviewToFront:controller.view];
                            [self.view bringSubviewToFront:self.startMeetingMenu];
                            
                            
                        }
                        if(controller != nil)
                        {
                            //controller.delegate = self;
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
                    
                    CGRect frame = CGRectMake(0, 90, 1024, self.view.frame.size.height - 90);
                    frame.origin.x = frame.size.width * page;
                    frame.origin.y = 0;
                    controller.frame = frame;
                    [self.scrollView addSubview:controller];
                    [self.scrollView sendSubviewToBack:controller];
                    [self.view bringSubviewToFront:self.startMeetingMenu];
                    [self.view bringSubviewToFront:self.btnTools];

                }
                
                }
            }
            
        }
        

    





-(void) resetAllPages {
    for (int i=0; i<[self.viewControllers count]; i++) {
        ArcBasePageView *controller = [self.viewControllers objectAtIndex:i];
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
            ArcBasePageView *controller = [self.viewControllers objectAtIndex:i];
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
    if(page == self.currentPage || page == self.currentPage + 1 || page == self.currentPage - 1) {
        return YES;
    }
    return NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if([self.menu isOpen]) {
        [self.menu pageDidAppear];
        return;
    }
    if([self.toolsMenu isOpen]) {
        [self.toolsMenu pageDidAppear];
        return;
    }
    
    [self.chapterManager notifyActiveScreenAppear];
    if(!isLoad) {
        [self performSelector:@selector(initAfterDelay) withObject:nil afterDelay:0.2];
    }
    isLoad = YES;
}

- (void)viewWillDisappear:(BOOL)animated
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
    
    [self.chapterManager notifyActiveScreenWillDisappear];
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





#pragma -------------------
#pragma Buttons click
-(IBAction) openMenu
{
    if(referenceView != nil){
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [referenceView removeFromSuperview];
        }];
        
    }
    if(self.menu != nil) {
        [self.menu hide];
    }
    else {
        self.menu = [[ArcGMMainMenuView alloc] initWithFrame:CGRectMake(0, 90, 1024, 768 - 90)];
        self.menu.delegate = self;
        [self.menu showInView:self.view];
        [self.view bringSubviewToFront:self.topMenu];
        [self.view bringSubviewToFront:self.startMeetingMenu];
        [self.chapterManager notifyActiveScreenWillDisappear];
        [self.view bringSubviewToFront:self.btnTools];
    }
}

-(IBAction) btnMenuClick:(id)sender
{
    
    [self.chapterManager initControlNew:self.profileChapterArray];
    self.chapterManager.delegateM = self;
    [self.chapterManager setHidden:YES];
    
    if([self.chapterManager switchToTopChapterWithAnimation:0 page:0]) {
        [self.chapterCenterPager closeFromChapter:0];
    }

    
    
    if(referenceView != nil){
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [referenceView removeFromSuperview];
        }];
        
    }
    if (self.customCallsMenu != nil){
        [self customCallOpenMenu:self.customCallMenuButton];
    }
    
    
    if(self.menu != nil) {
        [self.menu hide];
        self.menu = nil;
    }

    else {
        self.menu = [[ArcGMMainMenuView alloc] initWithFrame:CGRectMake(0, 90, 1024, 768 - 90)];
        self.menu.delegate = self;
        [self.menu showInView:self.view];
        [self.view bringSubviewToFront:self.topMenu];
        [self.view bringSubviewToFront:self.startMeetingMenu];
        [self.chapterManager notifyActiveScreenWillDisappear];
        [self.view bringSubviewToFront:self.btnTools];
    }
}

-(IBAction) btnToolsMenuClick:(id)sender
{
    [super toggleToolsMenu];
}

-(void) openToolsMenu:(GTMAction)action
{
    [super openToolsMenu:action arg:nil];
    [self.chapterManager notifyActiveScreenWillDisappear];
}


- (IBAction)effiencyChapter:(UIButton*)sender {
    
    
    if (self.effiencyClicked == YES){
        
        return;
    }else{

    
    UIImage *effiencyMenupressedImage = [UIImage imageNamed:@"menu_efficiency_butt_press.png"];
    [[self effiencyMenuButton] setImage :effiencyMenupressedImage forState:UIControlStateNormal];

    self.effiencyClicked = YES;
    }
    if (self.safetyClicked == YES){
        UIImage *safetyMenupressedImage = [UIImage imageNamed:@"menu_safety_butt.png"];
        [[self safetyMenuButton] setImage :safetyMenupressedImage forState:UIControlStateNormal];
        self.safetyClicked = NO;
    }
    if(self.timeClicked == YES){
        UIImage *timeMenupressedImage = [UIImage imageNamed:@"menu_time_butt.png"];
        [[self timeMenuButton] setImage :timeMenupressedImage forState:UIControlStateNormal];
        self.timeClicked = NO;

    }
    if(self.combinationClicked == YES){
        UIImage *combinationMenupressedImage = [UIImage imageNamed:@"menu_combination_butt.png"];
        [[self combinationMenuButton] setImage :combinationMenupressedImage forState:UIControlStateNormal];
        self.combinationClicked = NO;

    }
    if(self.dosageClicked == YES){
        UIImage *dosageMenupressedImage = [UIImage imageNamed:@"menu_dosage_butt.png"];
        [[self dosageMenuButton] setImage :dosageMenupressedImage forState:UIControlStateNormal];
        self.dosageClicked = NO;
    }
    [self.chapterManager resetAllPages];
    [self.chapterManager.pagesScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSMutableArray *pageArray = [[NSMutableArray alloc] init];
    ChapterData *data = [self.chapterArray objectAtIndex:0];
    [pageArray addObject:data];
    [self.chapterManager initControl:pageArray];
    self.chapterManager.delegateM = self;
    [self.chapterManager setHidden:YES];
    self.chapterManager.topMenuOpened = YES;
    

    [self.chapterManager openTopChapterWithAnimation:0 page:0];
}
- (IBAction)safetyChapter:(UIButton*)sender {
    
    if (self.safetyClicked == YES){
        return;

    }else{
    UIImage *safetyMenupressedImage = [UIImage imageNamed:@"menu_safety_butt_press.png"];
    [[self safetyMenuButton] setImage :safetyMenupressedImage forState:UIControlStateNormal];
    self.safetyClicked = YES;
    }
    
    if (self.effiencyClicked == YES){
        UIImage *effiencyMenupressedImage = [UIImage imageNamed:@"menu_efficiency_butt.png"];
        [[self effiencyMenuButton] setImage :effiencyMenupressedImage forState:UIControlStateNormal];
        
        self.effiencyClicked = NO;

    }
    if(self.timeClicked == YES){
        UIImage *timeMenupressedImage = [UIImage imageNamed:@"menu_time_butt.png"];
        [[self timeMenuButton] setImage :timeMenupressedImage forState:UIControlStateNormal];
        self.timeClicked = NO;
        
    }
    if(self.combinationClicked == YES){
        UIImage *combinationMenupressedImage = [UIImage imageNamed:@"menu_combination_butt.png"];
        [[self combinationMenuButton] setImage :combinationMenupressedImage forState:UIControlStateNormal];
        self.combinationClicked = NO;
        
    }
    if(self.dosageClicked == YES){
        UIImage *dosageMenupressedImage = [UIImage imageNamed:@"menu_dosage_butt.png"];
        [[self dosageMenuButton] setImage :dosageMenupressedImage forState:UIControlStateNormal];
        self.dosageClicked = NO;
    }
    
    [self.chapterManager resetAllPages];
    [self.chapterManager.pagesScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSMutableArray *pageArray = [[NSMutableArray alloc] init];
    ChapterData *data = [self.chapterArray objectAtIndex:1];
    [pageArray addObject:data];

    [self.chapterManager initControl:pageArray];
    self.chapterManager.delegateM = self;
    [self.chapterManager setHidden:YES];
    self.chapterManager.topMenuOpened = YES;
    

    [self.chapterManager openTopChapterWithAnimation:0 page:0];


}
- (IBAction)combinationChapter:(UIButton*)sender {
    
    
    if(self.combinationClicked == YES){
        return;

    }else{
    
    UIImage *combinationMenupressedImage = [UIImage imageNamed:@"menu_combination_butt_press.png"];
    [[self combinationMenuButton] setImage :combinationMenupressedImage forState:UIControlStateNormal];
    
    self.combinationClicked = YES;
    }
    
    if (self.safetyClicked == YES){
        UIImage *safetyMenupressedImage = [UIImage imageNamed:@"menu_safety_butt.png"];
        [[self safetyMenuButton] setImage :safetyMenupressedImage forState:UIControlStateNormal];
        self.safetyClicked = NO;
    }
    if(self.timeClicked == YES){
        UIImage *timeMenupressedImage = [UIImage imageNamed:@"menu_time_butt.png"];
        [[self timeMenuButton] setImage :timeMenupressedImage forState:UIControlStateNormal];
        self.timeClicked = NO;
        
    }
    if(self.effiencyClicked == YES){
        UIImage *effiencyMenupressedImage = [UIImage imageNamed:@"menu_efficiency_butt.png"];
        [[self effiencyMenuButton] setImage :effiencyMenupressedImage forState:UIControlStateNormal];
        
        self.effiencyClicked = NO;

        
    }
    if(self.dosageClicked == YES){
        UIImage *dosageMenupressedImage = [UIImage imageNamed:@"menu_dosage_butt.png"];
        [[self dosageMenuButton] setImage :dosageMenupressedImage forState:UIControlStateNormal];
        self.dosageClicked = NO;
    }
    [self.chapterManager resetAllPages];
    [self.chapterManager.pagesScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSMutableArray *pageArray = [[NSMutableArray alloc] init];
    ChapterData *data = [self.chapterArray objectAtIndex:2];
    [pageArray addObject:data];

    [self.chapterManager initControl:pageArray];
    self.chapterManager.delegateM = self;
    [self.chapterManager setHidden:YES];
    self.chapterManager.topMenuOpened = YES;
    
    [self.chapterManager openTopChapterWithAnimation:0 page:0];


    
}
- (IBAction)timeChapter:(UIButton*)sender {
    
    if(self.timeClicked == YES){

        return;
    }else{
    
    UIImage *timeMenupressedImage = [UIImage imageNamed:@"menu_time_butt_press.png"];
    [[self timeMenuButton] setImage :timeMenupressedImage forState:UIControlStateNormal];
    
    self.timeClicked = YES;
    }
        if (self.safetyClicked == YES){
            UIImage *safetyMenupressedImage = [UIImage imageNamed:@"menu_safety_butt.png"];
            [[self safetyMenuButton] setImage :safetyMenupressedImage forState:UIControlStateNormal];
            self.safetyClicked = NO;
        }
        if(self.combinationClicked == YES){
            UIImage *combinationMenupressedImage = [UIImage imageNamed:@"menu_combination_butt.png"];
            [[self combinationMenuButton] setImage :combinationMenupressedImage forState:UIControlStateNormal];
            self.combinationClicked = NO;
            
        }
        if(self.effiencyClicked == YES){
            UIImage *effiencyMenupressedImage = [UIImage imageNamed:@"menu_efficiency_butt.png"];
            [[self effiencyMenuButton] setImage :effiencyMenupressedImage forState:UIControlStateNormal];
            
            self.effiencyClicked = NO;
            
            
        }
        if(self.dosageClicked == YES){
            UIImage *dosageMenupressedImage = [UIImage imageNamed:@"menu_dosage_butt.png"];
            [[self dosageMenuButton] setImage :dosageMenupressedImage forState:UIControlStateNormal];
            self.dosageClicked = NO;
        }
    [self.chapterManager resetAllPages];
    [self.chapterManager.pagesScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    NSMutableArray *pageArray = [[NSMutableArray alloc] init];
    ChapterData *data = [self.chapterArray objectAtIndex:3];
    [pageArray addObject:data];

    
    [self.chapterManager initControl:pageArray];
    self.chapterManager.delegateM = self;
    [self.chapterManager setHidden:YES];
    self.chapterManager.topMenuOpened = YES;
    
    [self.chapterManager openTopChapterWithAnimation:0 page:0];

    
}
- (IBAction)dosageChapter:(UIButton*)sender {
    
    if (self.dosageClicked == YES){
        return;

    }else{
    
    UIImage *dosageMenupressedImage = [UIImage imageNamed:@"menu_dosage_butt_press.png"];
    [[self dosageMenuButton] setImage :dosageMenupressedImage forState:UIControlStateNormal];
    
    self.dosageClicked = YES;
    }
    
    if (self.safetyClicked == YES){
        UIImage *safetyMenupressedImage = [UIImage imageNamed:@"menu_safety_butt.png"];
        [[self safetyMenuButton] setImage :safetyMenupressedImage forState:UIControlStateNormal];
        self.safetyClicked = NO;
    }
    if(self.combinationClicked == YES){
        UIImage *combinationMenupressedImage = [UIImage imageNamed:@"menu_combination_butt.png"];
        [[self combinationMenuButton] setImage :combinationMenupressedImage forState:UIControlStateNormal];
        self.combinationClicked = NO;
        
    }
    if(self.effiencyClicked == YES){
        UIImage *effiencyMenupressedImage = [UIImage imageNamed:@"menu_efficiency_butt.png"];
        [[self effiencyMenuButton] setImage :effiencyMenupressedImage forState:UIControlStateNormal];
        
        self.effiencyClicked = NO;
        
        
    }
    if(self.timeClicked == YES){
        UIImage *timeMenupressedImage = [UIImage imageNamed:@"menu_time_butt.png"];
        [[self timeMenuButton] setImage :timeMenupressedImage forState:UIControlStateNormal];
        self.timeClicked = NO;
    }
    [self.chapterManager resetAllPages];
    [self.chapterManager.pagesScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSMutableArray *pageArray = [[NSMutableArray alloc] init];
    ChapterData *data = [self.chapterArray objectAtIndex:4];
    [pageArray addObject:data];
    
    [self.chapterManager initControl:pageArray];
    self.chapterManager.delegateM = self;
    [self.chapterManager setHidden:YES];
    self.chapterManager.topMenuOpened = YES;
    

    [self.chapterManager openTopChapterWithAnimation:0 page:0];

    
}





#pragma ---------------
#pragma Generic menu

-(void) GMMainMenuClosed:(GMMainMenuView *)menu
{
//    if(self.effiencyMenuButton.frame.origin.y != ORIGINAL_Y_FRAME_TOP_MENU){
//        [self openTopMenu];
//    }

    self.menu = nil;
    [self.chapterManager notifyActiveScreenAppear];
}

-(void) GMMainMenuPageSelected:(int)chapter page:(int)pageNumber
{
    if(chapter < 5){
        
        [self.chapterManager initControlNew:self.profileChapterArray];
        self.chapterManager.delegateM = self;
        [self.chapterManager setHidden:YES];
        
        if([self.chapterManager switchToTopChapterWithAnimation:chapter page:pageNumber]) {
            [self.chapterCenterPager closeFromChapter:chapter];
        }
    }
    
   else if (chapter == 5){
      
       self.effiencyClicked = NO;
        [self effiencyChapter:self.effiencyMenuButton];
       if([self.chapterManager switchToTopChapterWithAnimation:0 page:pageNumber]) {
       }


    }else if(chapter == 6){
        self.safetyClicked = NO;
        [self safetyChapter:self.safetyMenuButton];
        [self.chapterManager switchToTopChapterWithAnimation:0 page:pageNumber];
        
    }else if(chapter == 7){
        self.combinationClicked = NO;
        [self combinationChapter:self.combinationMenuButton];
        [self.chapterManager switchToTopChapterWithAnimation:0 page:pageNumber];
    }else if(chapter == 8){
        self.timeClicked = NO;
        [self timeChapter:self.timeMenuButton];
        [self.chapterManager switchToTopChapterWithAnimation:0 page:pageNumber];

    }else if (chapter == 9){
        self.dosageClicked = NO;
        [self dosageChapter:self.dosageMenuButton];
        [self.chapterManager switchToTopChapterWithAnimation:0 page:pageNumber];

    }
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

-(void)removeBackViews{
    
    self.backImageView.image = [UIImage imageNamed:@"arc_back.png"];
    }

#pragma ---------------
#pragma Tools menu

-(void) GTMMainMenuViewClosed:(GTMMainMenuView*)menu
{
    self.toolsMenu = nil;
    [self.chapterManager notifyActiveScreenAppear];
}

-(void) GTMMainMenuViewHistory:(GTMMainMenuView*)menu
{
    HistoryUniversalViewController *historyController = [[HistoryUniversalViewController alloc] initWithNibName:@"HistoryUniversalViewController" bundle:nil];
    historyController.statisticId = ArcoxiaStatistictMenuHistory;
    [self presentViewController:historyController animated:YES completion:nil];
}

-(void) GTMMainMenuViewHistoryDoctor:(GTMMainMenuView*)menu
{
    HistoryUniversalViewController *historyController = [[HistoryUniversalViewController alloc] initWithNibName:@"HistoryUniversalViewController" bundle:nil];
    historyController.statisticId = ArcoxiaStatistictMenuHistory;
    historyController.openDoctorModeInLoad = YES;
    [self presentViewController:historyController animated:YES completion:nil];

    
    [self.chapterManager closeChapterWithAnimation];
}


#pragma --------------------
#pragma ArcChapterManagerViewDelegate

-(void) arcChapterManagerViewChapterChanged:(int)chapter
{
    
}

/**
 * Open center pager from chapter point.
 * Used when closing chapter manager 
 **/
-(void)closeBackGroundView
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.effiencyMenuButton.alpha = 0.0;
        self.combinationMenuButton.alpha = 0.0;
        self.dosageMenuButton.alpha = 0.0;
        self.safetyMenuButton.alpha = 0.0;
        self.timeMenuButton.alpha = 0.0;
        [self.safetyMenuButton setY:self.safetyMenuButton.frame.origin.y - 50];
        [self.effiencyMenuButton setY:self.effiencyMenuButton.frame.origin.y - 50];
        [self.combinationMenuButton setY:self.combinationMenuButton.frame.origin.y - 50];
        [self.dosageMenuButton setY:self.dosageMenuButton.frame.origin.y - 50];
        [self.timeMenuButton setY:self.timeMenuButton.frame.origin.y - 50];
        
    }];
    [self removeTopBar];
    [self.chapterManager setHidden:YES];
}

-(void) arcChapterManagerViewOpenCenterPager:(int)chapter
{
    
    self.sideMenuOpened = NO;
    [UIView animateWithDuration:0.5 animations:^{
    
    self.effiencyMenuButton.alpha = 0.0;
    self.combinationMenuButton.alpha = 0.0;
    self.dosageMenuButton.alpha = 0.0;
    self.safetyMenuButton.alpha = 0.0;
    self.timeMenuButton.alpha = 0.0;
    [self.safetyMenuButton setY:self.safetyMenuButton.frame.origin.y - 50];
    [self.effiencyMenuButton setY:self.effiencyMenuButton.frame.origin.y - 50];
    [self.combinationMenuButton setY:self.combinationMenuButton.frame.origin.y - 50];
    [self.dosageMenuButton setY:self.dosageMenuButton.frame.origin.y - 50];
    [self.timeMenuButton setY:self.timeMenuButton.frame.origin.y - 50];

}];
    [self removeTopBar];
    [self.chapterManager resetAllPages];

    self.chapterCenterPager.delegate = self;
    [self.chapterCenterPager initChapters:self.profileChapterArray];;
    
    [self.chapterManager initControlNew:self.profileChapterArray];
    self.chapterManager.delegateM = self;
    [self.chapterManager setHidden:YES];
    //self.chapterManager.topMenuOpened = YES;
    [self.chapterManager.pagesScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.chapterCenterPager openFromChapter:chapter];
    }


#pragma --------------------
#pragma ArcCenterPagerDelegate

-(void) arcCenterPagerChapterSelected:(int)chapter
{
    if(referenceView != nil){
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [referenceView removeFromSuperview];
        }];

    }
    self.sideMenuOpened = YES;
    [self.chapterManager openChapterWithAnimation:chapter page:0];
    if(self.menu != nil) {
    }else{
    [self openTopMenu];
    }
}
-(void) openTopMenu{
    
    [UIView animateWithDuration:1.0 animations:^{
        self.effiencyMenuButton.alpha = 1.0;
        self.combinationMenuButton.alpha = 1.0;
        self.dosageMenuButton.alpha = 1.0;
        self.safetyMenuButton.alpha = 1.0;
        self.timeMenuButton.alpha = 1.0;
        
        [self.safetyMenuButton setY:ORIGINAL_Y_FRAME_TOP_MENU];
        [self.effiencyMenuButton setY:ORIGINAL_Y_FRAME_TOP_MENU];
        [self.combinationMenuButton setY:ORIGINAL_Y_FRAME_TOP_MENU];
        [self.dosageMenuButton setY:ORIGINAL_Y_FRAME_TOP_MENU];
        [self.timeMenuButton setY:ORIGINAL_Y_FRAME_TOP_MENU];
        
        
        [self.view bringSubviewToFront:self.effiencyMenuButton];
        [self.view bringSubviewToFront:self.combinationMenuButton];
        [self.view bringSubviewToFront:self.dosageMenuButton];
        [self.view bringSubviewToFront:self.safetyMenuButton];
        [self.view bringSubviewToFront:self.timeMenuButton];
        [self.view bringSubviewToFront:self.headerView];
        [self.view bringSubviewToFront:self.btnTools];
        
    }];
}



-(void) arcCenterPagerWillClose
{
    if(self.backMenImage.isHidden)
    [self.backMenImage fadeIn:0.3 delegate:nil];
    
    [UIView animateWithDuration:0.6 animations:^(void) {
        [infoButton setAlpha:1.0];
    } completion:^(BOOL finished) {
    }];
}

-(void) arcCenterPagerWillOpen
{
    if(!self.backMenImage.isHidden)
    [self.backMenImage fadeOut:0.3 delegate:nil];
    
    [UIView animateWithDuration:0.6 animations:^(void) {
        [infoButton setAlpha:0.0];

    } completion:^(BOOL finished) {
    }];
}


-(void) showEndView
{
    EndMeetingUniversalController *end = [[EndMeetingUniversalController alloc] initWithNibName:@"EndMeetingViewController" bundle:nil];
    [self presentViewController:end animated:YES completion:nil];

}


#pragma ----------------
#pragma startMeetingMenuDelegate

-(void) startMeetingMenuEnd
{
    [self.startMeetingMenu showCloseMode:YES];
    [self showEndView];
}

-(void) startMeetingMenuStart
{
    
}


-(void)removeTopBar{
    
    UIImage *effiencyMenupressedImage = [UIImage imageNamed:@"menu_efficiency_butt.png"];
    [[self effiencyMenuButton] setImage :effiencyMenupressedImage forState:UIControlStateNormal];
    self.effiencyClicked = NO;

    UIImage *safetyMenupressedImage = [UIImage imageNamed:@"menu_safety_butt.png"];
    [[self safetyMenuButton] setImage :safetyMenupressedImage forState:UIControlStateNormal];
    self.safetyClicked = NO;
    
    UIImage *combinationMenupressedImage = [UIImage imageNamed:@"menu_combination_butt.png"];
    [[self combinationMenuButton] setImage :combinationMenupressedImage forState:UIControlStateNormal];
    self.combinationClicked = NO;
    
    UIImage *timeMenupressedImage = [UIImage imageNamed:@"menu_time_butt.png"];
    [[self timeMenuButton] setImage :timeMenupressedImage forState:UIControlStateNormal];
    self.timeClicked = NO;
    
    UIImage *dosageMenupressedImage = [UIImage imageNamed:@"menu_dosage_butt.png"];
    [[self dosageMenuButton] setImage :dosageMenupressedImage forState:UIControlStateNormal];
    self.dosageClicked = NO;


}
#pragma ---------------
#pragma Test notifications

- (void) receiveTestStartNotification:(NSNotification *) notification 
{
    [Test activeTest].isNeetToStart = NO;
    [self.chapterManager refreshCurrentPageTiming];
    
    // for portal
    [self.startMeetingMenu showCloseMode:YES];
}

- (void) receiveTestEndNotification:(NSNotification *) notification 
{
    [Test activeTest].isNeetToStart = YES;
    [self.startMeetingMenu showStartMode:YES];
}


#pragma ---------------------
#pragma QuestionViewControllerDelegate

-(void) questionViewControllerCloseMe
{
    [self dismissViewControllerAnimated:YES completion:nil];
	finalQuestionController = nil;
    self.lockQuestionScreen = NO;
}

-(void) showQuestionView
{
	if(finalQuestionController == nil) {
        finalQuestionController = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:[NSBundle mainBundle]];
        finalQuestionController.dataFileName = @"arc_question.plist";
        finalQuestionController.delegateQ = self;
        finalQuestionController.applicationId = self.applicationId;
        finalQuestionController.answersData = [Test activeTest].answers;
        finalQuestionController.statisticId = ArcoxiaStatistictQuestionScreen;
        [self presentViewController:finalQuestionController animated:YES completion:nil];
    }
}


- (IBAction)customCallOpenMenu:(UIButton*)sender {
    
    if(referenceView != nil){
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [referenceView removeFromSuperview];
        }];
        
    }
    
    if (menuOpened == YES){
        
    }
    if (menuOpened == NO){
        if(self.menu != nil) {
            [self.menu hide];
        }
        self.customCallMenuButton.transform = CGAffineTransformMakeScale(0.1, 0.1);
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:6.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.customCallMenuButton.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
        }];
        
        
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
        self.customCallMenuButton.transform = CGAffineTransformMakeScale(0.1, 0.1);
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:6.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.customCallMenuButton.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
        }];
        
        
        UIImage *customMenuOpened = [UIImage imageNamed:@"icon_call@2x.png"];
        [[self customCallMenuButton] setImage :customMenuOpened forState:UIControlStateNormal];
        menuOpened = NO;
        [self.scrollView removeFromSuperview];
        [self resetAllPages];
        if(self.sideMenuOpened == YES){
            
            [self openTopMenu];
            [UIView animateWithDuration:1.0 animations:^{
                [self arcCenterPagerWillOpen];
                self.chapterManager.alpha = 1.0;
                [self.chapterManager setHidden:NO];
            }];
        }else{
            [UIView animateWithDuration:0.4 animations:^{
                [self arcCenterPagerWillClose];
                self.chapterManager.alpha = 1.0;
                [self.chapterManager setHidden:NO];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.4 animations:^{
                    self.chapterCenterPager.alpha = 1.0;
                    [self.chapterCenterPager layoutIfNeeded];
               
                }];
            }];
            
        }
        [self removeBackViews];

        
    }
}

-(void)openCustomCallMenuAfterUpdate{
    UIImage *customMenuOpened = [UIImage imageNamed:@"icon_call_x@2x.png"];
    [[self customCallMenuButton] setImage :customMenuOpened forState:UIControlStateNormal];
    
    
    
    self.customCallsMenu = [[customCallsMenuView alloc] initWithFrame:CGRectMake(0, 90, 1024, 768 )];
    self.customCallsMenu.delegate = self;
    [self.customCallsMenu showInView:self.view];
    menuOpened = YES;
    [self.view bringSubviewToFront:self.btnTools];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"CustomCallsReturned" object:nil];
    self.waitingCC.hidden = YES;
    self.customCallMenuButton.enabled = YES;
    [self closeBackGroundView];
    if(self.sideMenuOpened == NO){
        [self arcCenterPagerWillOpen];
        self.chapterCenterPager.alpha = 0.0;

    }
}


-(void) dataManager:(DataManager *)manager dataDidFailed:(NSString *)error forType:(int)type

{
    
}
-(void) dataManager:(DataManager*)manager dataDidReceived:(id)data forType:(int)type
{
    
    if(type == REQUEST_GET_CUSTOM_CALLS_FILES){
        
    }
    
    
    
}

-(void) getcustomCalls:(int)appId  {
    
    self.customCallManager = [[DataManager alloc] initWithDelegate:(id<DataManagerDelegate>)self];
    [self.customCallManager getCustomCallsFiles:[Test activeUser].userName appId:appId];
}
-(void) getcustomCallsInApp:(int)appId  {
    
    self.customCallManager = [[DataManager alloc] initWithDelegate:(id<DataManagerDelegate>)self];
    [self.customCallManager getCustomCallsFilesFromButton:[Test activeUser].userName appId:appId];
}
-(void) backFromPageDate{
    
    self.customCallsMenu = [[customCallsMenuView alloc] initWithFrame:CGRectMake(0, 90, 1024, 768 )];
    self.customCallsMenu.delegate = self;
    [self.customCallsMenu showInView:self.view];
    [self.view bringSubviewToFront:self.startMeetingMenu];
    [self.view bringSubviewToFront:self.topMenu];
    [self.view bringSubviewToFront:self.btnTools];
    menuOpened = YES;
}




#pragma --------------------
#pragma Life Cycle

-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
