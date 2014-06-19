//
//  ZostavaxBase.h
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePageTimer.h"
#import "NoxafilExtraImage.h"
#import "NoxafilZoomItem.h"

@protocol NoxafilBaseDelegate <NSObject>
-(void) invanzBaseOpenMenu:(int)chapter;
-(void) invanzBaseMoveToPage:(int)page;
-(void) invanzBaseChangeHeaderTitle:(NSString*)title;
@end


@interface NoxafilBase : BasePageTimer <NoxafilZoomItemDelegate>

- (id)initWithPageNumber:(int)page size:(CGSize)size;
- (void) addAndDelayAnimateImageWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file delay:(float)delay;
- (void) addAndAnimateDownImageWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file;
- (void) addAndAnimateGraphWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file;

-(void) setRInfo:(NSString*)image;
-(void) setPlusInfo:(NSString*)image;

@property(nonatomic,retain) NoxafilInfoControl *infoPlus;
@property(nonatomic,retain) NoxafilInfoControl *infoR;
@property(nonatomic,strong) UIImageView *imgBack;
@property(nonatomic,weak) id<NoxafilBaseDelegate> delegate;

@property(nonatomic,assign) BOOL isLoaded;



@end
