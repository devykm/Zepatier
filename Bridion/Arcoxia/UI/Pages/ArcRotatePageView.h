//
//  ArcRotatePageView.h
//  Arcoxia
//
//  Created by ykm dev on 12/2/12.
//
//

#import <UIKit/UIKit.h>
#import "InfoControl.h"
#import "BasePageTimerController.h"

@protocol ArcRotatePageViewDelegate;

@interface ArcRotatePageView : BasePageTimerController

@property(nonatomic,weak) id<ArcRotatePageViewDelegate> delegate;
@property(nonatomic,retain) InfoControl *info;

- (id)init:(UIImage*)image info:(NSString*)infoText;

@end


@protocol ArcRotatePageViewDelegate <NSObject>
-(void) arcRotatePageViewClose;
@end
