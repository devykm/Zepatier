//
//  ZostavaxViewController.h
//  Zostavax
//
//  Created by YKM Company on 8/20/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMMainMenuView.h"
#import "BaseMainAppViewController.h"
#import "BridionStartMeetingMenu.h"
#import "QuestionViewController.h"
#import "BridionGMMainMenuView.h"
#import "BridionBottomPagerView.h"
#import "BridionBase.h"
#import "customCallsMenuView.h"

@interface BridionViewController : BaseMainAppViewController <QuestionViewControllerDelegate,BridionStartMeetingMenuDelegate,GTMMainMenuViewDelegate,UIScrollViewDelegate,BridionBottomPagerViewDelegate,GMMainMenuViewDelegate,BridionBaseDelegate,DataManagerDelegate,PageDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *topLogo;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *waitingCC;
@property(nonatomic,retain) BridionGMMainMenuView *menu;
@property(nonatomic,retain) IBOutlet BridionStartMeetingMenu *startMeetingMenu;
@property(nonatomic,retain) IBOutlet UIView *topMenu;
@property(nonatomic,weak) IBOutlet UILabel *lblTopMenu;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollMain;
@property(nonatomic,retain) DataManager *customCallManager;
@property (weak, nonatomic) IBOutlet UIButton *customCallOpen;
@property(nonatomic,retain) customCallsMenuView *customCallsMenu;
@property (nonatomic,assign) int lastPage;
-(void)setCustomCallsFromPage:(NSMutableArray *)customCallsArray page:(int)page;
-(void) setCustomCallsScrollView:(NSMutableArray *)customCallsArray appID:(int)appId;
-(void)createPageForCustomCalls:(int)page;
-(void) getcustomCalls:(int)appID;
-(void) backFromPageDate;
+(BridionViewController*)getInstance;
-(void)bridionBaseViewOpenPage:(int)page animated:(BOOL)animated;

@property(nonatomic,retain) IBOutlet BridionBottomPagerView *chapterPager;

-(IBAction) btnToolsMenuClick:(id)sender;
-(IBAction) btnMenuClick:(id)sender;
-(void) showQuestionView;
-(void) setPage:(int)pageNumber animate:(BOOL)animated;
@end
