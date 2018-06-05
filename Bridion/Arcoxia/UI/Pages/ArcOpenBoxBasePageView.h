//
//  ArcOpenBoxBasePageView.h
//  Arcoxia
//
//  Created by ykm dev on 12/3/12.
//
//

#import <UIKit/UIKit.h>
#import "ArcBasePageView.h"
#import "InfoControl.h"

@protocol ArcOpenBoxBasePageViewDelegate <NSObject>
@required
-(UIImage*) getBackImage1;
-(UIImage*) getBackImage2;
-(NSString*) getInfo1;
-(NSString*) getInfo2;
@end

@interface ArcOpenBoxBasePageView : ArcBasePageView <ArcOpenBoxBasePageViewDelegate> {
    BOOL _isOpen;
    BOOL _isAnimating;
    UIImageView *imgBack1;
    UIImageView *imgBack2;
    UIButton *imgBox;
}


@property(nonatomic,retain) InfoControl *info;

@end
