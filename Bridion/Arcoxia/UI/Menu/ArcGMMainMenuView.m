//
//  ArcGMMainMenuView.m
//  Arcoxia
//
//  Created by ykm dev on 1/24/13.
//
//

#import "ArcGMMainMenuView.h"
#import "GMMenuItemData.h"
#import "AppDelegate.h"
#import "ChapterData.h"
#import "GMPageData.h"
#import "Constants.h"

@implementation ArcGMMainMenuView
static ArcGMMainMenuView * instance;

-(id) initWithFrame:(CGRect)frame
{
    NSMutableArray *items = [GMMenuItemData readPlistFile:@"ArcGMMainMenu.plist" applicationId:APPLICATION_ARCOXIA];
#if defined(TARGET_APPLICATION_MSS)
    items = [GMMenuItemData readPlistFile:@"ArcGMMainMenuMss.plist" applicationId:APPLICATION_ARCOXIA];
#endif
    self = [super initWithFrame:frame items:items];
    if (self) {
        
    }
    instance = self;

    return self;
}
+(ArcGMMainMenuView *)getInstance{
    return instance;
}
-(void) btnActionClick:(int)menuTag animate:(BOOL)animate
{
	switch (menuTag) {
        case 0:
        {
#if defined(TARGET_APPLICATION_ARCOXIA)
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [app showFosavance:UIViewAnimationOptionTransitionNone];
#elif defined(TARGET_APPLICATION_MSS)
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [app showEzetrol:UIViewAnimationOptionTransitionNone];
#endif
        }
            break;
        case 1:
        {
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [app showBridion:UIViewAnimationOptionTransitionNone];
        }
            break;
        case 2:
        {
            NSMutableArray *pagesArray = [[NSMutableArray alloc] init];
            //NSMutableArray *profileArray = [ChapterData loadData:@"profileChapters.plist"];
            NSMutableArray *chapters = [ChapterData loadData:@"ArcAll.plist"];
            //[chapters addObjectsFromArray:profileArray];
            for(ChapterData *c in chapters) {
                int index = 0;
                for(PageData *p in c.pages) {
                    GMPageData *gmp = [[GMPageData alloc] init];
                    gmp.previewImage = p.previewImage;
                    gmp.number = index;
                    gmp.chapter = c.number;
                    [pagesArray addObject:gmp];

                    index++;
                }
            }
			[self showHomeMenu:pagesArray statisticId:ArcoxiaStatistictMenuHome];
        }
			break;
        case 3:
			[self showQuestion];
			break;
        case 4:
			[self showUnivadis];
			break;
        case 12:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://medical.msd.co.il"]];
			break;
        case 100:  //januvia
        {
#if defined(TARGET_APPLICATION_MSS)
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [app showJanuvia:UIViewAnimationOptionTransitionNone];
            break;
#endif
        }
        case 200: //ezetrol
        {
#if defined(TARGET_APPLICATION_MSS)
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [app showEzetrol:UIViewAnimationOptionTransitionNone];
            break;
#endif
        }
            
        case 500: //arcoxia
        {
#if defined(TARGET_APPLICATION_MSS)
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [app showArcoxia:UIViewAnimationOptionTransitionNone];
            break;
#endif
        }
        case 800:
        {
#if defined(TARGET_APPLICATION_MSS)
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [app showOcsaar:UIViewAnimationOptionTransitionNone];
            break;
#endif
        }
        default:
        {
            [self showPdfMenu:APPLICATION_ARCOXIA section:menuTag statisticId:-1 animate:YES];
        }
            break;
            /*
        case 200:
        {
#if defined(TARGET_APPLICATION_MSS)
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            [app showOcsaar:UIViewAnimationOptionTransitionNone];
#endif
        }
            break;
             */
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
