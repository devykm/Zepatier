//
//  customCallsMenuView.m
//  msdAllInOne
//
//  Created by iOS Developer on 10/18/15.
//
//

//
//  customCallsMenuView.m
//  msdAllInOne
//
//  Created by iOS Developer on 10/18/15.
//
//

#import "customCallsMenuView.h"
#import "GMMenuItemData.h"
#import "AppDelegate.h"
#import "GMPageData.h"
#import "CustomCallsChapterData.h"
#import "CustomCallsPageData.h"
#import "GMCustomChapterData.h"
#import "GMCustomPageData.h"
#import "GMMainMenuView.h"
#import "DataManager.h"
#import "BridionGMMainMenuView.h"
#import "GMMenuItemData.h"
#import "AppDelegate.h"
#import "GMPageData.h"
#import "Constants.h"
#import "UserStatistics.h"
#import "BridionChapterData.h"
#import "BridionViewController.h"

@implementation customCallsMenuView

static customCallsMenuView * instance;
-(id) initWithFrame:(CGRect)frame
{
    NSMutableArray *items = [GMMenuItemData readPlistFile:@"BridionGMMainMenu.plist" applicationId:APPLICATION_BRIDION];
    self = [super initWithFrame:frame items:items];
    if (self) {
        
    }
    instance = self;

    return self;
}
+(customCallsMenuView *)getInstance{
    return instance;
}


-(void) btnActionClick:(int)menuTag animate:(BOOL)animate
{
    switch (menuTag)
    {
        case 0:
        {
            NSMutableArray *pagesArray = [[NSMutableArray alloc] init];
            NSMutableArray *pages = [CustomCallsChapterData loadCustomCallData:@"customCallList.plist"];
            if (pages.count != 0){
                int index = 0;
                for(CustomCallsChapterData *p in pages) {
                    //if(!p.isLobi) {
                    GMCustomChapterData *gmp = [[GMCustomChapterData alloc] init];
                    gmp.previewImage = p.thumb;
                    gmp.number = index;
                    //gmp.chapter = p.chapter;
                    gmp.synopsis = p.synopsis;
                    gmp.title = p.title;
                    gmp.pages = p.pages;
                    gmp.ChapterID = p.ID;

                    [pagesArray addObject:gmp];
                    
                    //}
                    index++;
                }
                
                [self showCustomCallsMenu:pagesArray statisticId:StatistictMenuHome chapterName:NULL];
            }else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                                message:@"No Custom Calls Created"
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
        }
        case 1:
        {
            [self showQuestion];
            break;
        }
        case 2:
        {
            [self showUnivadis];
            break;
        }
        case 3:
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://medical.msd.co.il"]];
            break;
        }
            // invanz application
        case 2000:
        {
            // show invanz
            //            InvanzViewController *viewController = [[InvanzViewController alloc] initWithNibName:@"InvanzViewController" bundle:nil];
            //
            //            CATransition* transition = [CATransition animation];
            //            transition.removedOnCompletion = YES;
            //            transition.duration = 0.4;
            //            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            //            transition.type = kCATransitionPush;
            //            transition.subtype = kCATransitionFromTop;
            //            [self.window.layer addAnimation:transition forKey:nil];
            //            self.window.rootViewController = viewController;
            //
            //            break;
        }
            
        case 2101: // open cancidas VC
        {
            // show Cancidas
            //            CancidasViewController *viewController = [[CancidasViewController alloc] initWithNibName:@"CancidasViewController" bundle:nil];
            //
            //            CATransition* transition = [CATransition animation];
            //            transition.removedOnCompletion = YES;
            //            transition.duration = 0.4;
            //            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            //            transition.type = kCATransitionPush;
            //            transition.subtype = kCATransitionFromTop;
            //            [self.window.layer addAnimation:transition forKey:nil];
            //            self.window.rootViewController = viewController;
            //
            //            // goto page 1
            //            [viewController setPage:0 animate:NO];
            //
            //            break;
            
        }
            
        case 2102: // open noxafil VC
        {
            // show Noxafil
            //            NoxafilViewController *viewController = [[NoxafilViewController alloc] initWithNibName:@"NoxafilViewController" bundle:nil];
            //
            //            CATransition* transition = [CATransition animation];
            //            transition.removedOnCompletion = YES;
            //            transition.duration = 0.4;
            //            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            //            transition.type = kCATransitionPush;
            //            transition.subtype = kCATransitionFromTop;
            //            [self.window.layer addAnimation:transition forKey:nil];
            //            self.window.rootViewController = viewController;
            //
            //            // goto page 1
            //            [viewController setPage:0 animate:NO];
            //
            break;
        }
            
            
        default:
        {
            [self showPdfMenu:APPLICATION_BRIDION section:menuTag statisticId:-1 animate:YES];
        }
            break;
            
    }
}

-(void) btnEmailActionClick:(int)menuTag
{
    if(self.pdfMail != nil) return;
    
    switch (menuTag) {
        case 1:
        {
            self.pdfMail = [[GMEmailController alloc] initWithNibName:@"GMEmailController" bundle:nil];
            self.pdfMail.delegate = self;
            self.pdfMail.link = @"http://medical.msd.co.il";
            self.pdfMail.view.hidden = YES;
            [self.view addSubview:self.pdfMail.view];
            [self.pdfMail show];
        }
            break;
    }
}

-(void) GMEmailCloseMe:(GMEmailController*)sender
{
    [self.pdfMail hide];
    self.pdfMail = nil;
}


@end
