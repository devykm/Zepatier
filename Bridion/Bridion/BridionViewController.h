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
#import "EmendBase.h"

@interface BridionViewController : BaseMainAppViewController <QuestionViewControllerDelegate,BridionStartMeetingMenuDelegate,GTMMainMenuViewDelegate,UIScrollViewDelegate,BridionBottomPagerViewDelegate,GMMainMenuViewDelegate,EmendBaseDelegate>

@property(nonatomic,retain) BridionGMMainMenuView *menu;
@property(nonatomic,retain) IBOutlet BridionStartMeetingMenu *startMeetingMenu;
@property(nonatomic,retain) IBOutlet UIView *topMenu;
@property(nonatomic,weak) IBOutlet UILabel *lblTopMenu;

@property(nonatomic,retain) IBOutlet BridionBottomPagerView *chapterPager;

-(IBAction) btnToolsMenuClick:(id)sender;
-(IBAction) btnMenuClick:(id)sender;
-(void) showQuestionView;
-(void) setPage:(int)pageNumber animate:(BOOL)animated;
@end
