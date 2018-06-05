//
//  ViewController.h
//  Arcoxia
//
//  Created by ykm dev on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoomingPDFViewerViewController.h"
#import "QuestionViewController.h"
#import "ArcCenterPager.h"
#import "ArcChapterManager.h"
#import "ArcStartMeetingMenu.h"
#import "BaseMainAppViewController.h"
#import "ArcGMMainMenuView.h"
#import "GTMMainMenuView.h"
#import "customCallsMenuView.h"
@interface ArcViewController : BaseMainAppViewController <QuestionViewControllerDelegate,ArcCenterPagerDelegate,ArcChapterManagerViewDelegate,ArcStartMeetingMenuDelegate,GMMainMenuViewDelegate,UIScrollViewDelegate>
{

    QuestionViewController *finalQuestionController;
    BOOL isLoad;
    BOOL menuOpened;

}
@property (weak, nonatomic) IBOutlet UIButton *effiencyMenuButton;
@property (weak, nonatomic) IBOutlet UIButton *safetyMenuButton;
@property (weak, nonatomic) IBOutlet UIButton *combinationMenuButton;
@property (weak, nonatomic) IBOutlet UIButton *timeMenuButton;
@property (weak, nonatomic) IBOutlet UIButton *dosageMenuButton;
@property (nonatomic,assign) int lastPage;
@property(nonatomic,retain) UIView *container;

@property(nonatomic,retain) IBOutlet ArcStartMeetingMenu *startMeetingMenu;
@property(nonatomic,retain) IBOutlet UIView *topMenu;
@property(nonatomic,retain) IBOutlet ArcCenterPager *chapterCenterPager;
@property(nonatomic,retain) IBOutlet ArcChapterManager *chapterManager;
@property(nonatomic,retain) IBOutlet UIImageView *backMenImage;
@property(nonatomic,retain) ArcGMMainMenuView *menu;
@property(nonatomic,assign) BOOL lockQuestionScreen;
@property(nonatomic,retain) NSMutableArray *chapterArray;
@property(nonatomic,retain) NSMutableArray *CustomCallArray;
@property(nonatomic,retain) NSMutableArray *viewControllers;
@property (nonatomic,assign) int currentPage;

@property(nonatomic,retain) NSMutableArray *profileChapterArray;
@property(nonatomic,retain) NSMutableArray *arcAll;
@property(nonatomic,retain) UIScrollView *scrollView;
@property(nonatomic,assign) BOOL sideMenuOpened;

@property (nonatomic,retain) UIImageView *arcBack;
@property (nonatomic,retain) UIImageView *fosBack;
@property (nonatomic,retain) UIView *janBack;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@property(nonatomic,assign) BOOL topMenuOpened;

@property(nonatomic,assign) BOOL effiencyClicked;
@property(nonatomic,assign) BOOL safetyClicked;
@property(nonatomic,assign) BOOL combinationClicked;
@property(nonatomic,assign) BOOL timeClicked;
@property(nonatomic,assign) BOOL dosageClicked;

@property(nonatomic,retain) IBOutlet UIActivityIndicatorView * waitingCC;
@property(nonatomic,retain) DataManager *customCallManager;
-(void) getcustomCalls:(int)appId ;
-(void) setCustomCallsScrollView:(NSMutableArray *)customCallsArray appID:(NSInteger*)appId;
-(void)setCustomCallsFromPage:(NSMutableArray *)customCallsArray page:(int)page;
@property (nonatomic,retain) IBOutlet UIButton *customCallMenuButton;
-(void)showInfo;

@property(nonatomic,retain) customCallsMenuView *customCallsMenu;
+(ArcViewController*)getInstance;


-(IBAction) btnMenuClick:(id)sender;
-(IBAction) btnToolsMenuClick:(id)sender;
-(void) showQuestionView;
-(void) showEndView;
-(void) openTopMenu;

@end
