//
//  StartMeetingMenu.h
//  Victrelis
//
//  Created by ykm dev on 5/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoxafilStartMeetingMenuDelegate <NSObject>
-(void) startMeetingMenuStart;
-(void) startMeetingMenuEnd;
@end

@interface NoxafilStartMeetingMenu : UIView {
    BOOL isOpen;
}

@property(nonatomic,weak) id<NoxafilStartMeetingMenuDelegate> delegate;
@property(nonatomic,assign) BOOL isToggleDisable;

-(void) initControl;
-(void) showStartMode:(BOOL)animate;
-(void) showFullCloseMode:(BOOL)animate;
-(void) showCloseMode:(BOOL)animate;
-(void) showOpenMode:(BOOL)animate;

@end
