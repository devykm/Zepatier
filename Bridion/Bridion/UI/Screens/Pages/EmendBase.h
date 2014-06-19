//
//  ZostavaxBase.h
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePageTimer.h"
#import "Bridion.h"
#import "BridionZoomItem.h"


@protocol EmendBaseDelegate <NSObject>
-(void) emendBaseMoveToPage:(int)page;
-(void) emendBaseChangeHeaderTitle:(NSString*)title;
@end


@interface EmendBase : BasePageTimer <BridionZoomItemDelegate>

- (id)initWithPageNumber:(int)page size:(CGSize)size;


- (void) addAndDelayAnimateImageWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file delay:(float)delay;
- (void) addAndAnimateDownImageWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file;
- (void) addAndAnimateGraphWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file;

-(void) setRInfo:(NSString*)image;
-(void) setPlusInfo:(NSString*)image;

@property(nonatomic,retain) BridionInfoControl *infoPlus;
@property(nonatomic,retain) BridionInfoControl *infoR;
@property(nonatomic,strong) UIImageView *imgBack;
@property(nonatomic,weak) id<EmendBaseDelegate> delegate;

@property(nonatomic,assign) BOOL isLoaded;



@end
