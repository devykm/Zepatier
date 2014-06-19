//
//  EZZoomItem.h
//  msdAllInOne
//
//  Created by ykm dev on 1/16/13.
//
//

#import <UIKit/UIKit.h>
#import "NoxafilInfoControl.h"

@protocol NoxafilZoomItemDelegate;

@interface NoxafilZoomItem : UIView {
    BOOL _isOpen;
    CGRect _realPosition;
    BOOL _isAnimation;
}

@property(nonatomic,weak) id<NoxafilZoomItemDelegate> delegate;
@property(nonatomic,assign) float topMargin;
@property(nonatomic,assign) float zoomScale;
@property(nonatomic,weak) UIView *realSuperView;
@property(nonatomic,retain) UIImageView *imageBack;
@property(nonatomic,retain) UIImageView *imageShadow;
@property(nonatomic,retain) NoxafilInfoControl *infoPlus;
@property(nonatomic,retain) NoxafilInfoControl *infoR;

-(void) setPlusInfo:(NSString*)image;
-(void) setRInfo:(NSString*)image;

@end

@protocol NoxafilZoomItemDelegate <NSObject>
-(void) InvanzZoomItemWillOpen:(NoxafilZoomItem*)sender;
@end
