//
//  ArcGMMainMenuView.h
//  Arcoxia
//
//  Created by ykm dev on 1/24/13.
//
//

#import <UIKit/UIKit.h>
#import "GMMainMenuView.h"
#import "GMEmailController.h"

@interface ArcGMMainMenuView : GMMainMenuView <GMEmailControllerDelegate>

@property(nonatomic,retain) GMEmailController *pdfMail;
+(ArcGMMainMenuView *)getInstance;

@end
