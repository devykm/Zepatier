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


@protocol BridionBaseDelegate <NSObject>
-(void) bridionBaseMoveToPage:(int)page;
-(void) bridionBaseChangeHeaderTitle:(NSString*)title;
-(void)bridionBaseViewOpenPage:(int)page animated:(BOOL)animated;

@end


@interface BridionBase : BasePageTimer <BridionZoomItemDelegate>

- (id)initWithPageNumber:(int)page size:(CGSize)size;


- (void) addAndDelayAnimateImageWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file delay:(float)delay;
- (void) addAndAnimateDownImageWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file;
- (void) addAndAnimateGraphWithOffsetX:(int)offsetX withOffsetY:(int)offsetY withWidth:(int)width withHeight:(int)height withFile:(NSString*)file;

-(void) setRInfo:(NSString*)image;
-(void) setPlusInfo:(NSString*)image;

@property(nonatomic,retain) BridionInfoControl *infoPlus;
@property(nonatomic,retain) BridionInfoControl *infoR;
@property(nonatomic,strong) UIImageView *imgBack;
@property(nonatomic,weak) id<BridionBaseDelegate> delegate;

@property(nonatomic,assign) BOOL isLoaded;



@end
