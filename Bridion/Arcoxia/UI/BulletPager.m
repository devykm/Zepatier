//
//  Pager.m
//  lior
//
//  Created by ykm dev on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BulletPager.h"
#import "FTAnimation+UIView.h"

#define HEIGHT 25
#define BTN_WIDTH 25
#define BTN_HEIGHT 25
#define BTN_MARGIN_RIGHT 2
#define Y_POS 95
#define TAG_FROM 200

@implementation BulletPager

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		currentChapter = -1;
		currentIndex = 0;
	}
    return self;
}

- (id)initWithFrame:(CGRect)frame total:(int)totalItems selected:(int)selectIndex chapter:(int)chapter {
    if ((self = [super initWithFrame:frame])) {
		currentChapter = -1;
		currentIndex = 0;
		[self bindControl:totalItems selected:selectIndex chapter:chapter];
	}
    return self;
}

-(void) bindControl:(int)totalItems selected:(int)selectIndex chapter:(int)chapter {
	if (currentChapter == chapter) {
		if(currentIndex != selectIndex) {
			UIButton* btnSelected = (UIButton*)[self viewWithTag:selectIndex + TAG_FROM];
			[btnSelected setImage:[UIImage imageNamed:@"bullet_pager_s.png"] forState:UIControlStateNormal];
			
			UIButton* btnPrev = (UIButton*)[self viewWithTag:currentIndex + TAG_FROM];
			[btnPrev setImage:[UIImage imageNamed:@"bullet_pager.png"] forState:UIControlStateNormal];
			currentIndex = selectIndex;
		}
		return;
	}
	total = totalItems;
	currentChapter = chapter;
	currentIndex = selectIndex;
	
	UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, HEIGHT)];
	backView.tag = 100;
	[backView setBackgroundColor:[UIColor clearColor]];
	float xPos = 3;
	for (int i=0; i < total; i++) {
		UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(xPos, 3, BTN_WIDTH, BTN_HEIGHT)];
		btn.tag = i + TAG_FROM;
		btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
		if (selectIndex == i) {
			[btn setImage:[UIImage imageNamed:@"bullet_pager_s.png"] forState:UIControlStateNormal];
		}
		else {
			[btn setImage:[UIImage imageNamed:@"bullet_pager.png"] forState:UIControlStateNormal];
		}
		[btn setContentMode:UIViewContentModeCenter];
		[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
		[backView addSubview:btn];

		xPos += BTN_WIDTH + BTN_MARGIN_RIGHT;
	}
	UIView *oldBackView = [self viewWithTag:100];
	[oldBackView removeFromSuperview];
	backView.hidden = YES;
	[backView setFrame:CGRectMake(0, 0, xPos, HEIGHT)];
	[self addSubview:backView];
	[backView fadeIn:0.2 delegate:nil];
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, xPos, HEIGHT)];
}

-(void)btnClick:(id)sender {
	UIButton *btn = (UIButton*)sender;
	[self.delegate pagerControlPageSelected:btn.tag - TAG_FROM chapter:currentChapter];
}


@end
