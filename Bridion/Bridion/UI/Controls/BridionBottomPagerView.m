//
//  JanBottomPagerView.m
//  Victrelis
//
//  Created by ykm dev on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BridionBottomPagerView.h"
#import "BridionChapterData.h"
#import "UIView-Extensions.h"

#define BOX_W 148

@interface BridionBottomPagerView ()
@end

@implementation BridionBottomPagerView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        self.fadeView = [[UIView alloc] initWithFrame:self.bounds];
        [self.fadeView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
        [self.fadeView setAlpha:0];
        [self addSubview:self.fadeView];
        
        UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnClose setFrame:self.bounds];
        [btnClose setBackgroundColor:[UIColor clearColor]];
        [btnClose addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnClose];
        
        self.barContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 75.0)];
        [self.barContainer setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin];
        [self addSubview:self.barContainer];
        [self.barContainer setY:self.bounds.size.height];
    }
    return self;
}

-(void) show
{
    if(isAnimating) return;
    
    isAnimating = YES;
    [self.delegate bridionBottomPagerPreviewOpen];
    [self setHidden:NO];
    [UIView animateWithDuration:0.4 animations:^(void){
        [self.barContainer setY:self.bounds.size.height - self.barContainer.height];
        self.fadeView.alpha = 1;
    } completion:^(BOOL finished){
        isAnimating = NO;
    }];
}

-(void) hide
{
    if(isAnimating) return;
    
    isAnimating = YES;
    [self.delegate bridionBottomPagerPreviewClose];
    [UIView animateWithDuration:0.4 animations:^(void){
        [self.barContainer setY:self.bounds.size.height];
        self.fadeView.alpha = 0;
        self.previewView.alpha = 0;
    } completion:^(BOOL finished){
        [self setHidden:YES];
        self.previewView = nil;
        isAnimating = NO;
    }];
}

- (void)initChapters:(NSMutableArray*)chapters
{
    self.chaptersData = chapters;
    self.boxes = [[NSMutableDictionary alloc] init];
    float xPos = 0.0;
    float yPos = 0.0;
    
    int totalChapters = 0;
    for (int i=0; i<[chapters count]; i++) {
        BridionChapterData *data = (BridionChapterData*)[chapters objectAtIndex:i];
        if(!data.hideFromNavigation) {
            totalChapters++;
        }
    }
    
    float w = self.width / totalChapters;
    for (int i=0; i<[chapters count]; i++) {
        BridionChapterData *data = (BridionChapterData*)[chapters objectAtIndex:i];
        if(data.hideFromNavigation) { 
            continue; 
        }
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(xPos, yPos, w, self.barContainer.height)];
        [btn setBackgroundImage:[[UIImage imageNamed:@"bridion_footer.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:0] forState:UIControlStateNormal];
        [btn setBackgroundImage:[[UIImage imageNamed:@"bridion_footer_press.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:0] forState:UIControlStateSelected];
        [btn setBackgroundImage:[[UIImage imageNamed:@"bridion_footer_press.png"] stretchableImageWithLeftCapWidth:20 topCapHeight:0] forState:UIControlStateSelected | UIControlStateHighlighted];
        [btn setAdjustsImageWhenHighlighted:NO];
        [btn setTitle:data.name forState:UIControlStateNormal];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(20, 0, 0, 0)];
        [btn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [btn.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [btn.titleLabel setNumberOfLines:1];
        [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        btn.titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
        [btn setTitleColor:[UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:1.0f] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [btn setContentMode:UIViewContentModeCenter];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = data.number;
        [self.barContainer addSubview:btn];
        [self.boxes setValue:btn forKey:[NSString stringWithFormat:@"%d",data.number]];
        xPos += w;
    }
}

-(BOOL) isOpen
{
    return self.height > self.barContainer.height;
}

-(void) btnClick:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    if(![self isOpen]) {
        [self show];
    }
    
    [self showPreview:btn.tag];
    [self setChapterSelected:btn.tag];
    lastBtn = btn;
}

-(void) setChapterSelected:(int)chapter
{
    UIButton *btnToSelect = (UIButton*)[self.boxes objectForKey:[NSString stringWithFormat:@"%d",chapter]];
    for (NSString* key in self.boxes) {
        id btn = [self.boxes objectForKey:key];
        [btn setSelected:NO];
    }
    [btnToSelect setSelected:YES];;
}

-(void) showPreview:(int)tag
{
    float previewW = 200.0;
    UIButton *box = (UIButton*)[self.boxes objectForKey:[NSString stringWithFormat:@"%d",tag]];
    BridionChapterData *chapter = [self.chaptersData objectAtIndex:tag];
    float xPos = box.center.x - (previewW/2);
    xPos = MIN(xPos, self.bounds.size.width - previewW - 10);
    xPos = MAX(xPos, 10);
    if(self.previewView == nil) {
        self.previewView = [[BridionBottomPagerPreview alloc] initWithFrame:CGRectMake(xPos - 30.0, 0, previewW, 660)];
        self.previewView.delegate = self;
        [self.previewView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.previewView];
        [self bringSubviewToFront:self.barContainer];
    }
    
    [self.previewView moveToPoint:CGPointMake(xPos, 0) andInitItems:chapter];
}

-(void) hidePreview
{
    if(self.previewView != nil) {
        [UIView animateWithDuration:0.3 animations:^(void) {
            [self.previewView setAlpha:0];
        } completion:^(BOOL finished) {
            [self.previewView removeFromSuperview];
            self.previewView = nil;
        }];
    }
}

#pragma --------------
#pragma BridionBottomPagerPreviewDelegate

-(void) bridionBottomPagerPreviewSelected:(int)chapter page:(int)page
{
    [self.delegate bridionBottomPagerPreviewSelected:chapter page:page];
    [self performSelector:@selector(hide) withObject:nil afterDelay:0.3];
}

@end
