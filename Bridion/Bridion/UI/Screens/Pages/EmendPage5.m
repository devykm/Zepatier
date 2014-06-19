//
//  EmendPage5.m
//  bridion
//
//  Created by YKM_MACMINI on 11/11/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "EmendPage5.h"

@implementation EmendPage5
{
    UIView *viewWomanA, *viewManA, *viewPotentionA;
    UIView *viewWomanB, *viewManB, *viewPotentionB;
    
    UIImageView *img;
    
    UIImageView *imgArrowWomanA, *imgArrowManA, *imgArrowPotentionA;
    UIImageView *imgArrowWomanB, *imgArrowManB, *imgArrowPotentionB;
    UIImageView *imgWomanText, *imgManText, *imgPotentionText;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:EmendStatistictPage5 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"emend_05.jpg"]];
    
    // adding images
    imgArrowWomanA = [[UIImageView alloc] initWithFrame:CGRectMake(460, 270, 50, 42)];
    [imgArrowWomanA setImage:[UIImage imageNamed:@"emend_05_arrow1.png"]];
    [self addSubview:imgArrowWomanA];
    
    imgArrowWomanB = [[UIImageView alloc] initWithFrame:CGRectMake(460, 272, 50, 58)];
    [imgArrowWomanB setImage:[UIImage imageNamed:@"emend_05_arrow1press.png"]];
    [self addSubview:imgArrowWomanB];
    
    [imgArrowWomanB setHidden:YES];
    
    imgArrowManA = [[UIImageView alloc] initWithFrame:CGRectMake(825, 270, 50, 42)];
    [imgArrowManA setImage:[UIImage imageNamed:@"emend_05_arrow1.png"]];
    [self addSubview:imgArrowManA];
    
    imgArrowManB = [[UIImageView alloc] initWithFrame:CGRectMake(825, 272, 50, 58)];
    [imgArrowManB setImage:[UIImage imageNamed:@"emend_05_arrow1press.png"]];
    [self addSubview:imgArrowManB];
    
    [imgArrowManB setHidden:YES];
    
    imgArrowPotentionA = [[UIImageView alloc] initWithFrame:CGRectMake(660, 550, 73, 50)];
    [imgArrowPotentionA setImage:[UIImage imageNamed:@"emend_05_arrow2.png"]];
    [self addSubview:imgArrowPotentionA];
    
    imgArrowPotentionB = [[UIImageView alloc] initWithFrame:CGRectMake(640, 550, 93, 50)];
    [imgArrowPotentionB setImage:[UIImage imageNamed:@"emend_05_arrow2press.png"]];
    [self addSubview:imgArrowPotentionB];
    
    [imgArrowPotentionB setHidden:YES];
    
    imgManText = [[UIImageView alloc] initWithFrame:CGRectMake(700, 330, 256, 135)];
    [imgManText setImage:[UIImage imageNamed:@"emend_05_man_text.png"]];
    [self addSubview:imgManText];
    
    [imgManText setHidden:YES];
    
    imgWomanText = [[UIImageView alloc] initWithFrame:CGRectMake(340, 330, 259, 90)];
    [imgWomanText setImage:[UIImage imageNamed:@"emend_05_woman_text.png"]];
    [self addSubview:imgWomanText];
    
    [imgWomanText setHidden:YES];
    
    imgPotentionText = [[UIImageView alloc] initWithFrame:CGRectMake(340, 514, 276, 119)];
    [imgPotentionText setImage:[UIImage imageNamed:@"emend_05_potention_text.png"]];
    [self addSubview:imgPotentionText];
    
    [imgPotentionText setHidden:YES];
    
    
    // adding transparent touching views
    viewWomanA=[[UIView alloc]initWithFrame:CGRectMake(360, 92, 250, 170)];
    
    [self addSubview:viewWomanA];
    
    viewManA=[[UIView alloc]initWithFrame:CGRectMake(723, 92, 250, 170)];
    
    [self addSubview:viewManA];
    
    viewPotentionA=[[UIView alloc]initWithFrame:CGRectMake(723, 500, 250, 160)];
    
    [self addSubview:viewPotentionA];
    
    viewWomanB=[[UIView alloc]initWithFrame:CGRectMake(330, 315, 280, 125)];
    
    [self addSubview:viewWomanB];
    
    viewManB=[[UIView alloc]initWithFrame:CGRectMake(690, 315, 280, 165)];
    
    [self addSubview:viewManB];
    
    viewPotentionB=[[UIView alloc]initWithFrame:CGRectMake(330, 500, 295, 160)];
    
    [self addSubview:viewPotentionB];
    
    // adding gestures
    UIGestureRecognizer *tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                                      :self action:@selector(viewWomanATap:)];
    [viewWomanA addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewWomanBTap:)];
    [viewWomanB addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewManATap:)];
    [viewManA addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewManBTap:)];
    [viewManB addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewPotentionATap:)];
    [viewPotentionA addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewPotentionBTap:)];
    [viewPotentionB addGestureRecognizer:tapParent];
    
    
    [self setRInfo:@"emend_screen05_r.png"];
    
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
}

-(void) viewWomanATap:(UIGestureRecognizer*)gesture
{
    [imgWomanText setHidden:NO];
    [imgArrowWomanA setHidden:YES];
    [imgArrowWomanB setHidden:NO];
}

-(void) viewWomanBTap:(UIGestureRecognizer*)gesture
{
    [imgWomanText setHidden:YES];
    [imgArrowWomanA setHidden:NO];
    [imgArrowWomanB setHidden:YES];
}


-(void) viewManATap:(UIGestureRecognizer*)gesture
{
    [imgManText setHidden:NO];
    [imgArrowManA setHidden:YES];
    [imgArrowManB setHidden:NO];
}

-(void) viewManBTap:(UIGestureRecognizer*)gesture
{
    [imgManText setHidden:YES];
    [imgArrowManA setHidden:NO];
    [imgArrowManB setHidden:YES];
}

-(void) viewPotentionATap:(UIGestureRecognizer*)gesture
{
    [imgPotentionText setHidden:NO];
    [imgArrowPotentionA setHidden:YES];
    [imgArrowPotentionB setHidden:NO];
}

-(void) viewPotentionBTap:(UIGestureRecognizer*)gesture
{
    [imgPotentionText setHidden:YES];
    [imgArrowPotentionA setHidden:NO];
    [imgArrowPotentionB setHidden:YES];
}



@end
