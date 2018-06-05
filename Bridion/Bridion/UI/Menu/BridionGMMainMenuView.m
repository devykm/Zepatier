//
//  ArcGMMainMenuView.m
//  Arcoxia
//
//  Created by ykm dev on 1/24/13.
//
//

#import "BridionGMMainMenuView.h"
#import "GMMenuItemData.h"
#import "AppDelegate.h"
#import "GMPageData.h"
#import "Constants.h"
#import "UserStatistics.h"
#import "BridionChapterData.h"


@implementation BridionGMMainMenuView
static BridionGMMainMenuView * instance;

-(id) initWithFrame:(CGRect)frame
{
    NSMutableArray *items = [GMMenuItemData readPlistFile:@"BridionGMMainMenu.plist" applicationId:APPLICATION_ZEPATIER];
    self = [super initWithFrame:frame items:items];
    if (self) {
        
    }
    instance = self;

    return self;
}
+(BridionGMMainMenuView*)getInstance{
    return instance;
}
-(void) btnActionClick:(int)menuTag animate:(BOOL)animate
{
    switch (menuTag)
    {
        case 0:
        {
            NSMutableArray *pagesArray = [[NSMutableArray alloc] init];
            NSMutableArray *chapters = [BridionChapterData loadData:@"ZepatierChapters.plist"];
            
            int index = 0;
            for(BridionChapterData *c in chapters) {
                for(BridionPageData *p in c.pages) {
                    GMPageData *gmp = [[GMPageData alloc] init];
                    gmp.previewImage = p.previewImage;
                    gmp.number = index;
                    gmp.chapter = c.number;
                    [pagesArray addObject:gmp];
                    index++;
                }
            }
			[self showHomeMenu:pagesArray statisticId:ZepatierStatisticsHomePage];

            break;
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
        // Arcoxia application
        case 201:
        {
            
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [app showArcoxia:UIViewAnimationOptionTransitionNone];

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
            [self showPdfMenu:APPLICATION_ZEPATIER section:menuTag statisticId:-1 animate:YES];
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
