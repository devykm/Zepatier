//
//  EmendPage4.m
//  bridion
//
//  Created by YKM_MACMINI on 11/11/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "EmendPage4.h"
#import "UIView-Extensions.h"
#import "UIImage+Extra.h"
#import "BridionZoomItem.h"

@implementation EmendPage4
{
    UIView *viewGraphSmall1, *viewGraphSmall2, *viewGraphSmall3;
    UIView *viewGraphBig;
    
    UIImageView *img;
    
    UIImageView *imgGraph1, *imgGraph2, *imgGraph3;
    UIImageView *imgGraph1adapted, *imgGraph2adapted, *imgGraph3adapted;
    UIImageView *imgGraphText1, *imgGraphText2, *imgGraphText3;
    
    GRAPH_TYPE_PRESSED graphTypePressed;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:EmendStatistictPage4 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) EmendZoomItemWillOpen:(BridionZoomItem*)sender
{
    
}

-(void) buildPage
{
    [self.imgBack setImage:[UIImage imageNamed:@"emend_04.jpg"]];
    
    graphTypePressed = NONE;
    
    // disable multiple touch
    self.multipleTouchEnabled = NO;
    
    // adding images
    imgGraph1 = [[UIImageView alloc] initWithFrame:CGRectMake(770, 273, 225, 107)];
    [imgGraph1 setImage:[UIImage imageNamed:@"emend_04_graph1big.png"]];
    [self addSubview:imgGraph1];
    
    imgGraph2 = [[UIImageView alloc] initWithFrame:CGRectMake(525, 273, 225, 107)];
    [imgGraph2 setImage:[UIImage imageNamed:@"emend_04_graph2big.png"]];
    [self addSubview:imgGraph2];
    
    imgGraph3 = [[UIImageView alloc] initWithFrame:CGRectMake(280, 273, 225, 107)];
    [imgGraph3 setImage:[UIImage imageNamed:@"emend_04_graph3big.png"]];
    [self addSubview:imgGraph3];
    
    imgGraph1adapted = [[UIImageView alloc] initWithFrame:CGRectMake(785, 390, 125, 29)];
    [imgGraph1adapted setImage:[UIImage imageNamed:@"emend_04_adapted.png"]];
    [self addSubview:imgGraph1adapted];
    
    imgGraph2adapted = [[UIImageView alloc] initWithFrame:CGRectMake(540, 390, 125, 29)];
    [imgGraph2adapted setImage:[UIImage imageNamed:@"emend_04_adapted.png"]];
    [self addSubview:imgGraph2adapted];
    
    imgGraph3adapted = [[UIImageView alloc] initWithFrame:CGRectMake(295, 390, 125, 29)];
    [imgGraph3adapted setImage:[UIImage imageNamed:@"emend_04_adapted.png"]];
    [self addSubview:imgGraph3adapted];
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(880, 470, 99, 19)];
    [img setImage:[UIImage imageNamed:@"emend_04_tozaot.png"]];
    [self addSubview:img];
    
    imgGraphText1 = [[UIImageView alloc] initWithFrame:CGRectMake(793, 500, 185, 74)];
    [imgGraphText1 setImage:[UIImage imageNamed:@"emend_04_graph1text.png"]];
    [self addSubview:imgGraphText1];
    
    imgGraphText2 = [[UIImageView alloc] initWithFrame:CGRectMake(530, 500, 207, 103)];
    [imgGraphText2 setImage:[UIImage imageNamed:@"emend_04_graph2text.png"]];
    [self addSubview:imgGraphText2];
    
    imgGraphText3 = [[UIImageView alloc] initWithFrame:CGRectMake(310, 500, 177, 157)];
    [imgGraphText3 setImage:[UIImage imageNamed:@"emend_04_graph3text.png"]];
    [self addSubview:imgGraphText3];
    
    // adding transparent touching views
    viewGraphSmall1=[[UIView alloc]initWithFrame:CGRectMake(770, 273, 225, 107)];
    
    [self addSubview:viewGraphSmall1];
    
    viewGraphSmall2=[[UIView alloc]initWithFrame:CGRectMake(525, 273, 225, 107)];
    
    [self addSubview:viewGraphSmall2];
    
    viewGraphSmall3=[[UIView alloc]initWithFrame:CGRectMake(280, 273, 225, 107)];
    
    [self addSubview:viewGraphSmall3];
    
    
    viewGraphBig = [[UIView alloc]initWithFrame:CGRectMake(278, 105, 719, 331)];
    
    [viewGraphBig setHidden:YES];
    
    [self addSubview:viewGraphBig];
    
    // adding gestures
    UIGestureRecognizer *tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                                      :self action:@selector(viewGraphSmall1Tap:)];
    [viewGraphSmall1 addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                                      :self action:@selector(viewGraphSmall2Tap:)];
    [viewGraphSmall2 addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                                      :self action:@selector(viewGraphSmall3Tap:)];
    [viewGraphSmall3 addGestureRecognizer:tapParent];
    
    tapParent = [[UITapGestureRecognizer alloc]initWithTarget
                 :self action:@selector(viewGraphBigTap:)];
    [viewGraphBig addGestureRecognizer:tapParent];


    
    
    [self setRInfo:@"emend_screen04_r.png"];
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    // disable multiple touch
    self.multipleTouchEnabled = NO;
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
}

-(void) viewGraphSmall1Tap:(UIGestureRecognizer*)gesture
{
    [imgGraphText1 setImage:[UIImage imageNamed:@"emend_04_graph1text_press.png"]];
    [imgGraphText2 setImage:[UIImage imageNamed:@"emend_04_graph2text.png"]];
    [imgGraphText3 setImage:[UIImage imageNamed:@"emend_04_graph3text.png"]];
    
    [self bringSubviewToFront:imgGraph1];
    [viewGraphSmall2 setUserInteractionEnabled:NO];
    [viewGraphSmall3 setUserInteractionEnabled:NO];
    
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         imgGraph1.frame = CGRectMake(273, 105, 729, 331);
                     }
                     completion:^(BOOL finished){
                         [viewGraphBig setHidden:NO];
                         graphTypePressed = GRAPH1;
                     }];
}

-(void) viewGraphSmall2Tap:(UIGestureRecognizer*)gesture
{
    [imgGraphText1 setImage:[UIImage imageNamed:@"emend_04_graph1text.png"]];
    [imgGraphText2 setImage:[UIImage imageNamed:@"emend_04_graph2text_press.png"]];
    [imgGraphText3 setImage:[UIImage imageNamed:@"emend_04_graph3text.png"]];
    
    [self bringSubviewToFront:imgGraph2];
    [viewGraphSmall1 setUserInteractionEnabled:NO];
    [viewGraphSmall3 setUserInteractionEnabled:NO];
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         imgGraph2.frame = CGRectMake(273, 105, 729, 331);
                     }
                     completion:^(BOOL finished){
                         [viewGraphBig setHidden:NO];
                         graphTypePressed = GRAPH2;
                     }];

}

-(void) viewGraphSmall3Tap:(UIGestureRecognizer*)gesture
{
    [imgGraphText1 setImage:[UIImage imageNamed:@"emend_04_graph1text.png"]];
    [imgGraphText2 setImage:[UIImage imageNamed:@"emend_04_graph2text.png"]];
    [imgGraphText3 setImage:[UIImage imageNamed:@"emend_04_graph3text_press.png"]];
    
    [self bringSubviewToFront:imgGraph3];
    [viewGraphSmall1 setUserInteractionEnabled:NO];
    [viewGraphSmall2 setUserInteractionEnabled:NO];
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         imgGraph3.frame = CGRectMake(273, 105, 729, 331);
                     }
                     completion:^(BOOL finished){
                         [viewGraphBig setHidden:NO];
                         graphTypePressed = GRAPH3;
                     }];

}

-(void) viewGraphBigTap:(UIGestureRecognizer*)gesture
{
    [viewGraphSmall1 setUserInteractionEnabled:YES];
    [viewGraphSmall2 setUserInteractionEnabled:YES];
    [viewGraphSmall3 setUserInteractionEnabled:YES];
    
    [UIView animateWithDuration:0.5f
                     animations:^{
        if(graphTypePressed == GRAPH1)
        {
            imgGraph1.frame = CGRectMake(770, 273, 225, 107);
        }
        else if(graphTypePressed == GRAPH2)
        {
            imgGraph2.frame = CGRectMake(525, 273, 225, 107);
        }
        else if(graphTypePressed == GRAPH3)
        {
            imgGraph3.frame = CGRectMake(280, 273, 225, 107);
        }
    }
    completion:^(BOOL finished){
        [viewGraphBig setHidden:YES];
        graphTypePressed = NONE;
    }];


}




@end
