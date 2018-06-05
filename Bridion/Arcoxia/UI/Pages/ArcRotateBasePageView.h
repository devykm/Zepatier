//
//  ArcRotateBasePageView.h
//  Arcoxia
//
//  Created by ykm dev on 12/2/12.
//
//

#import <UIKit/UIKit.h>
#import "ArcBasePageView.h"
#import "ArcRotatePageView.h"
#import "UIView-Extensions.h"

@protocol ArcRotateBasePageViewDelegae <NSObject>
@required
-(UIImage*) getRotateImage;
-(NSString*) getRotateInfo;
@optional
-(void) rotateViewDidShow;
@end

@interface ArcRotateBasePageView : ArcBasePageView <ArcRotatePageViewDelegate,ArcRotateBasePageViewDelegae> {
    BOOL openRotate;
    ArcRotatePageView *rotateView;
}

@property(nonatomic,assign) float arrowSideMargin;

-(void) openRotateView;

@end
