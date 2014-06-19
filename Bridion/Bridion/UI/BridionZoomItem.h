//
//  EZZoomItem.h
//  msdAllInOne
//
//  Created by ykm dev on 1/16/13.
//
//

#import <UIKit/UIKit.h>
#import "BridionInfoControl.h"

@protocol BridionZoomItemDelegate;

@interface BridionZoomItem : UIView {
    BOOL _isOpen;
    CGRect _realPosition;
    BOOL _isAnimation;
}

@property(nonatomic,weak) id<BridionZoomItemDelegate> delegate;
@property(nonatomic,assign) float topMargin;
@property(nonatomic,assign) float zoomScale;
@property(nonatomic,retain) UIView *realSuperView;
@property(nonatomic,retain) UIImageView *imageBack;
@property(nonatomic,retain) UIImageView *imageShadow;

@property(nonatomic,retain) BridionInfoControl *infoPlus;
@property(nonatomic,retain) BridionInfoControl *infoR;

-(void) setPlusInfo:(NSString*)image;
-(void) setRInfo:(NSString*)image;

@end

@protocol BridionZoomItemDelegate <NSObject>
-(void) EmendZoomItemWillOpen:(BridionZoomItem*)sender;
@end
