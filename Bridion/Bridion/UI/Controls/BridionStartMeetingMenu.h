//
//  StartMeetingMenu.h
//  Victrelis
//
//  Created by ykm dev on 5/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BridionStartMeetingMenuDelegate <NSObject>
-(void) startMeetingMenuStart;
-(void) startMeetingMenuEnd;
@end

@interface BridionStartMeetingMenu : UIView {
    id<BridionStartMeetingMenuDelegate> _delegate;
    BOOL isOpen;
    BOOL isToggleDisable;
}

@property(nonatomic,strong) id<BridionStartMeetingMenuDelegate> delegate;
@property(nonatomic,assign) BOOL isToggleDisable;
-(void) initControl;
-(void) showStartMode:(BOOL)animate;
-(void) showFullCloseMode:(BOOL)animate;
-(void) showCloseMode:(BOOL)animate;
-(void) showOpenMode:(BOOL)animate;

@end
