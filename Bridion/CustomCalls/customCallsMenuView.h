//
//  customCallsMenuView.h
//  msdAllInOne
//
//  Created by iOS Developer on 10/18/15.
//
//

#import <UIKit/UIKit.h>
#import "GMMainMenuView.h"
#import "GMEmailController.h"

@interface customCallsMenuView : GMMainMenuView <GMEmailControllerDelegate,DataManagerDelegate>

-(id) initWithFrame:(CGRect)frame appID:(int)app plist:(NSString*)plist;

@property(nonatomic,retain) GMEmailController *pdfMail;
@property(nonatomic,retain) NSString *plist;

+(customCallsMenuView *)getInstance;
@end



