//
//  ZostavaxPage1.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "NoxafilPage1.h"
#import "GMMenuItemData.h"

#define PAGE_RETHINK 1
#define PAGE_ECOLOGY 14
#define PAGE_UTI 37
#define PAGE_DFI 47
#define PAGE_IAI 24
#define PAGE_SUMMARY 56

@implementation NoxafilPage1
{
    UIView *viewRethink, *viewUTI, *viewDFI, *viewIAI, *viewPI, *viewRef, *viewSummary, *viewEcology;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:InvanzStatistictPage1 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
  //  [self.imgBack setImage:[UIImage imageNamed:@"invanz_page1.png"]];
    
    // adding transparent touching views
    viewRethink = [[UIView alloc]initWithFrame:CGRectMake(290, 140, 440, 420)];
    [self addSubview:viewRethink];
    
    viewEcology = [[UIView alloc]initWithFrame:CGRectMake(63, 140, 155, 140)];
    [self addSubview:viewEcology];
    
    viewUTI = [[UIView alloc]initWithFrame:CGRectMake(812, 140, 155, 140)];
    [self addSubview:viewUTI];
    
    viewDFI = [[UIView alloc]initWithFrame:CGRectMake(812, 402, 155, 140)];
    [self addSubview:viewDFI];
    
    viewIAI = [[UIView alloc]initWithFrame:CGRectMake(63, 402, 155, 140)];
    [self addSubview:viewIAI];
    
    viewPI = [[UIView alloc]initWithFrame:CGRectMake(248, 590, 157, 60)];
    [self addSubview:viewPI];
    
    viewRef = [[UIView alloc]initWithFrame:CGRectMake(440, 590, 157, 60)];
    [self addSubview:viewRef];
    
    viewSummary = [[UIView alloc]initWithFrame:CGRectMake(630, 590, 157, 60)];
    [self addSubview:viewSummary];

    // adding gestures
    UIGestureRecognizer *tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                                      :self action:@selector(viewRethinkTap:)];
    [viewRethink addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                                      :self action:@selector(viewEcologyTap:)];
    [viewEcology addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewUTITap:)];
    [viewUTI addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewDFITap:)];
    [viewDFI addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewIAITap:)];
    [viewIAI addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewPITap:)];
    [viewPI addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewRefTap:)];
    [viewRef addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewSummaryTap:)];
    [viewSummary addGestureRecognizer:tapParent];
    
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
}

-(void) viewRethinkTap:(UIGestureRecognizer*)gesture
{
    [self.delegate invanzBaseMoveToPage:PAGE_RETHINK];
}

-(void) viewEcologyTap:(UIGestureRecognizer*)gesture
{
    [self.delegate invanzBaseMoveToPage:PAGE_ECOLOGY];
}

-(void) viewUTITap:(UIGestureRecognizer*)gesture
{
    [self.delegate invanzBaseMoveToPage:PAGE_UTI];
}

-(void) viewDFITap:(UIGestureRecognizer*)gesture
{
    [self.delegate invanzBaseMoveToPage:PAGE_DFI];
}

-(void) viewIAITap:(UIGestureRecognizer*)gesture
{
     [self.delegate invanzBaseMoveToPage:PAGE_IAI];
}

-(void) viewPITap:(UIGestureRecognizer*)gesture
{
    [self.delegate invanzBaseOpenMenu:GMSectionDoctor];
}

-(void) viewRefTap:(UIGestureRecognizer*)gesture
{
    [self.delegate invanzBaseOpenMenu:GMSectionReferrals];
}

-(void) viewSummaryTap:(UIGestureRecognizer*)gesture
{
    [self.delegate invanzBaseMoveToPage:PAGE_SUMMARY];
}

@end
