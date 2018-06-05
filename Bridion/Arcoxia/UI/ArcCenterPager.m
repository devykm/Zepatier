//
//  ArcCenterPager.m
//  Arcoxia
//
//  Created by ykm dev on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArcCenterPager.h"
#import "ChapterData.h"
#import "UIView-Extensions.h"
#import "NSString+extensions.h"

#define BOX_W 273
#define BOX_H 113

@interface ArcCenterPager ()
@end

@implementation ArcCenterPager

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)initChapters:(NSMutableArray*)chapters
{
    self.chaptersData = chapters;
    self.boxes = [[NSMutableArray alloc] init];
    float xPos = 0.0;
    float yPos = -10.0;
    for (int i=0; i<=4; i++) {
        ChapterData *data = (ChapterData*)[chapters objectAtIndex:i];
        if(data.hideFromNavigation) { 
            continue; 
        }
        
        ArcCenterPagerBox *box = [[ArcCenterPagerBox alloc] initWithFrame:CGRectMake(xPos, yPos, BOX_W, BOX_H) data:data];
        box.delegate = self;
        [self addSubview:box];
        [self.boxes addObject:box];

        yPos += BOX_H - 15;
    }
}

-(void) openFromChapter:(int)index
{
    [self.delegate arcCenterPagerWillClose];
    [self setHidden:NO];
    //layout boxes without animation to the proper chapter
    //and from that state start animation
    [self layoutBoxes:index closeMode:YES];
    [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^(void){
        [self layoutBoxes:index closeMode:NO];
    } completion:^(BOOL finished){
    }];
}

-(void) closeFromChapter:(int)index
{
    [self.delegate arcCenterPagerWillOpen];
    if(!_isCloseMode) {
        [UIView animateWithDuration:0.4 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^(void){
            [self layoutBoxes:index closeMode:YES];
        } completion:^(BOOL finished){
            [self.delegate arcCenterPagerChapterSelected:index];
            [self setHidden:YES];
        }];
    }
    else {
        [self.delegate arcCenterPagerChapterSelected:index];
    }
}

#pragma ---------------
#pragma ArcCenterPagerBoxDelegate

-(void) arcCenterPagerBoxBoxSelected:(ArcCenterPagerBox *)box number:(int)number
{
    int index = [self.boxes indexOfObject:box];
    [self closeFromChapter:index];
}

-(void) layoutBoxes:(int)anchorIndex closeMode:(BOOL)closeMode
{
    _isCloseMode = closeMode;
    if (anchorIndex > 4){
        ArcCenterPagerBox *box = [self.boxes objectAtIndex:1];
        float selectedBoxY = box.realPosition.origin.y;
        if(closeMode) {
            //go up
            for (int i=0; i<=1; i++) {
                ArcCenterPagerBox *cbox = [self.boxes objectAtIndex:i];
                [cbox setY:cbox.realPosition.origin.y - (selectedBoxY + cbox.height)];
                
            }
            //go down
            for (int i=1+1; i<[self.boxes count]; i++) {
                ArcCenterPagerBox *cbox = [self.boxes objectAtIndex:i];
                [cbox setY:cbox.realPosition.origin.y + (self.height - (selectedBoxY + cbox.height - 20))];
            }
        }
        else {
            //go down
            for (int i=0; i<=1; i++) {
                ArcCenterPagerBox *cbox = [self.boxes objectAtIndex:i];
                [cbox setY:cbox.realPosition.origin.y];
            }
            //go up
            for (int i=1+1; i<[self.boxes count]; i++) {
                ArcCenterPagerBox *cbox = [self.boxes objectAtIndex:i];
                [cbox setY:cbox.realPosition.origin.y];
            }
        }

    }else{
    ArcCenterPagerBox *box = [self.boxes objectAtIndex:anchorIndex];
    float selectedBoxY = box.realPosition.origin.y;
    if(closeMode) {
        //go up
        for (int i=0; i<=anchorIndex; i++) {
            ArcCenterPagerBox *cbox = [self.boxes objectAtIndex:i];
            [cbox setY:cbox.realPosition.origin.y - (selectedBoxY + cbox.height)];
    
        }
        //go down
        for (int i=anchorIndex+1; i<[self.boxes count]; i++) {
            ArcCenterPagerBox *cbox = [self.boxes objectAtIndex:i];
            [cbox setY:cbox.realPosition.origin.y + (self.height - (selectedBoxY + cbox.height - 20))];
        }
    }
    else {
        //go down
        for (int i=0; i<=anchorIndex; i++) {
            ArcCenterPagerBox *cbox = [self.boxes objectAtIndex:i];
            [cbox setY:cbox.realPosition.origin.y];
        }
        //go up
        for (int i=anchorIndex+1; i<[self.boxes count]; i++) {
            ArcCenterPagerBox *cbox = [self.boxes objectAtIndex:i];
            [cbox setY:cbox.realPosition.origin.y];
        }
    }
}

}
@end








@implementation ArcCenterPagerBox


/**
 * Init with real position and chapter data
 **/
-(id) initWithFrame:(CGRect)frame data:(ChapterData*)data
{
    if(self = [super initWithFrame:frame]) {
        self.realPosition = frame;
        
        //shadow
        self.layer.masksToBounds = NO;
        self.layer.shadowRadius = 20;
        self.layer.shadowOpacity = 0.5;
        //CGFloat indent = 10;
        //CGRect innerRect = CGRectMake(-indent,5,self.width+(2*indent),self.height-10);
        //self.layer.shadowPath = [UIBezierPath bezierPathWithRect:innerRect].CGPath;
        
        //color
        //self.backColor = [[UIView alloc] initWithFrame:CGRectMake(0, 8.0, self.width, self.height-16.0)];
        //[self.backColor setBackgroundColor:[NSString colorWithHexString:data.color]];
        //[self addSubview:self.backColor];
        
        //button
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(10.0, 0, self.width-20.0, self.height)];
        [self.button setImage:[UIImage imageNamed:data.previewImage] forState:UIControlStateNormal];
        [self.button setImage:[UIImage imageNamed:data.pressedImage] forState:UIControlStateSelected];
        [self.button setAdjustsImageWhenHighlighted:NO];
        [self.button setContentMode:UIViewContentModeScaleAspectFit];
        [self.button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.button.tag = data.number;
        [self addSubview:self.button];
    }
    return self;
}

-(void) btnClick:(id)sender
{
    UIButton *btn = (UIButton*)sender;    
    [self.delegate arcCenterPagerBoxBoxSelected:self number:btn.tag];
}


@end



