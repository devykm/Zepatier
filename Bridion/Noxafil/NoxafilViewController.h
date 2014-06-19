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
#import "NoxafilStartMeetingMenu.h"
#import "QuestionViewController.h"
#import "NoxafilGMMainMenuView.h"
#import "NoxafilBottomPagerView.h"
#import "NoxafilBase.h"

@interface NoxafilViewController : BaseMainAppViewController <QuestionViewControllerDelegate,NoxafilStartMeetingMenuDelegate,GTMMainMenuViewDelegate,UIScrollViewDelegate,NoxafilBottomPagerViewDelegate,GMMainMenuViewDelegate,NoxafilBaseDelegate>

@property(nonatomic,retain) NoxafilGMMainMenuView *menu;
@property(nonatomic,retain) IBOutlet NoxafilStartMeetingMenu *startMeetingMenu;
@property(nonatomic,retain) IBOutlet UIView *topMenu;
@property(nonatomic,weak) IBOutlet UILabel *lblTopMenu;
@property(nonatomic,weak) IBOutlet UIImageView *IVIconTopMenu;

@property(nonatomic,retain) IBOutlet NoxafilBottomPagerView *chapterPager;

-(IBAction) btnToolsMenuClick:(id)sender;
-(IBAction) btnMenuClick:(id)sender;
-(void) showQuestionView;
-(void) setPage:(int)pageNumber animate:(BOOL)animated;
@end
