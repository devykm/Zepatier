//
//  ArcGMMainMenuView.m
//  Arcoxia
//
//  Created by ykm dev on 1/24/13.
//
//

#import "NoxafilGMMainMenuView.h"
#import "GMMenuItemData.h"
#import "AppDelegate.h"
#import "GMPageData.h"
#import "Constants.h"
#import "UserStatistics.h"
#import "NoxafilChapterData.h"
#import "EmendViewController.h"
#import "InvanzViewController.h"
#import "CancidasViewController.h"


@implementation NoxafilGMMainMenuView

-(id) initWithFrame:(CGRect)frame
{
    NSMutableArray *items = [GMMenuItemData readPlistFile:@"NoxafilGMMainMenu.plist" applicationId:APPLICATION_NOXAFIL];
    self = [super initWithFrame:frame items:items];
    if (self) {
        
    }
    return self;
}

-(void)openQuestion{
    [self btnActionClick:1 animate:YES];
}

-(void) btnActionClick:(int)menuTag animate:(BOOL)animate
{
    switch (menuTag)
    {
        case 0:
        {
            NSMutableArray *pagesArray = [[NSMutableArray alloc] init];
            NSMutableArray *chapters = [NoxafilChapterData loadData:@"NoxafilChapters.plist"];
            
            int index = 0;
            for(NoxafilChapterData *c in chapters) {
                for(NoxafilPageData *p in c.pages) {
                    GMPageData *gmp = [[GMPageData alloc] init];
                    gmp.previewImage = p.previewImage;
                    gmp.number = index;
                    gmp.chapter = c.number;
                    [pagesArray addObject:gmp];
                    index++;
                }
            }
			[self showHomeMenu:pagesArray statisticId:InvanzStatistictMenuHome];

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
        // emend application
        case 2100:
        {
            // show emend
            EmendViewController *viewController = [[EmendViewController alloc] initWithNibName:@"EmendViewController" bundle:nil];
            
            CATransition* transition = [CATransition animation];
            transition.removedOnCompletion = YES;
            transition.duration = 0.4;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromTop;
            [self.window.layer addAnimation:transition forKey:nil];
            self.window.rootViewController = viewController;
            
            // goto page 1
            [viewController setPage:1 animate:NO];
            
            break;
        }
        case 2101: // open noxafil VC
        {
            // show Invanz
            CancidasViewController *viewController = [[CancidasViewController alloc] initWithNibName:@"CancidasViewController" bundle:nil];
            
            CATransition* transition = [CATransition animation];
            transition.removedOnCompletion = YES;
            transition.duration = 0.4;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromTop;
            [self.window.layer addAnimation:transition forKey:nil];
            self.window.rootViewController = viewController;
            
            // goto page 1
            [viewController setPage:0 animate:NO];
            
            break;
            
        }
            
        case 2102: // open invanze VC
        {
            // show Invanz
            InvanzViewController *viewController = [[InvanzViewController alloc] initWithNibName:@"InvanzViewController" bundle:nil];
            
            CATransition* transition = [CATransition animation];
            transition.removedOnCompletion = YES;
            transition.duration = 0.4;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionPush;
            transition.subtype = kCATransitionFromTop;
            [self.window.layer addAnimation:transition forKey:nil];
            self.window.rootViewController = viewController;
            
            // goto page 1
            [viewController setPage:0 animate:NO];
            
            break;
        }

        default:
        {
            [self showPdfMenu:APPLICATION_NOXAFIL section:menuTag statisticId:-1 animate:animate];
        }
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
