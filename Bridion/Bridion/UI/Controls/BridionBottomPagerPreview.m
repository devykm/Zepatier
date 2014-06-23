//
//  JanBottomPagerPreview.m
//  Victrelis
//
//  Created by YKM Company on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BridionBottomPagerPreview.h"
#import "UIImage+Extra.h"
#import "UIView-Extensions.h"

@interface BridionBottomPagerPreview (PRIVATE)
-(void) clearPreviewViews;
@end

@implementation BridionBottomPagerPreview

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

-(void) moveToPoint:(CGPoint)point andInitItems:(BridionChapterData*)data
{
    if(self.currentChapterData == data) return;
    
    self.currentChapterData = data;
    float topGap = 90;
    float bHeight = 140;
    int tagc = 1000;
    UIScrollView *oldContainer = (UIScrollView*)[self viewWithTag:tagc];
    UIScrollView *container = [[UIScrollView alloc] init];
    [container setBackgroundColor:[UIColor clearColor]];
    [container setFrame:self.bounds];
    [container setPagingEnabled:NO];
    [container setBounces:YES];
    [container setAlpha:0];
    //container.clipsToBounds = YES;
    container.showsHorizontalScrollIndicator = NO;
    container.showsVerticalScrollIndicator = NO;
    container.tag = tagc;
    
    float xPos = 0;
    float yPos = MAX(self.bounds.size.height - bHeight - topGap, bHeight*([data.pages count]-1)) + topGap;
    for (int i=0; i<[data.pages count]; i++) {
		BridionPageData *pdata = (BridionPageData*)[data.pages objectAtIndex:i];
        if(pdata.isLobi) {
            continue;
        }
        
		UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(xPos, yPos, self.bounds.size.width, 128)];
		btn.tag = pdata.number;
        //[btn setImage:[UIImage imageNamed:@"mainmenu_preview.png"] forState:UIControlStateNormal];
		[btn setBackgroundImage:[UIImage imageFromMainBundleFile:pdata.previewImage] forState:UIControlStateNormal];
		[btn setContentMode:UIViewContentModeTopLeft];
		[btn addTarget:self action:@selector(btnPageOpenClick:) forControlEvents:UIControlEventTouchUpInside];
        [container addSubview:btn];
		yPos -= bHeight;
	}

    //set content size and offset
    [container setContentSize:CGSizeMake(self.bounds.size.width, bHeight*([data.pages count]) + topGap)];
    if(container.contentSize.height > self.bounds.size.height) {
        float offset = container.contentSize.height - self.bounds.size.height;
        [container setContentOffset:CGPointMake(0, offset) animated:NO];
    }
    [self addSubview:container];
    
    [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState animations:^(void){
        [self setX:point.x];
    } completion:^(BOOL finished){
    }];
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState animations:^(void){
        [container setAlpha:1];
        oldContainer.tag = 2000;
        [oldContainer setAlpha:0];
    } completion:^(BOOL finished){
        [oldContainer removeFromSuperview];
        [self clearPreviewViews];
    }];
}

-(void) clearPreviewViews 
{
	for(UIView *mView in self.subviews) {
        if([mView isKindOfClass:[UIScrollView class]]) {
            if(mView.tag == 2000)
            [mView removeFromSuperview];
        }
	}
}

-(void) btnPageOpenClick:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    [_delegate bridionBottomPagerPreviewSelected:self.currentChapterData.number page:btn.tag];
}



@end
