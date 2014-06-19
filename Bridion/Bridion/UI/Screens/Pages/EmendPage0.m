//
//  ZostavaxPage1.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//
#import "AppDelegate.h"
#import "EmendPage0.h"

#import "BridionViewController.h"



@implementation EmendPage0
{
    UIImageView *img;
    QuestionViewController *finalQuestionController;

}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:EmendStatistictPageSelect size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
//    [self.imgBack setImage:[UIImage imageNamed:@"choose-Emend_Invanz.jpg"]];
    
    [self.imgBack setImage:[UIImage imageNamed:@"choose-hospitals.png"]];
    [self.imgBack setContentMode:UIViewContentModeScaleAspectFill];
    
//    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(65, 140, 270, 360)];
//    [btn1 addTarget:self action:@selector(openInvanz:) forControlEvents:UIControlEventTouchUpInside];
//  //  btn1.backgroundColor=[UIColor redColor];
//    [self addSubview:btn1];
//    
//    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(380, 140, 270, 360)];
//    [btn2 addTarget:self action:@selector(openEmend:) forControlEvents:UIControlEventTouchUpInside];
////        btn2.backgroundColor=[UIColor greenColor];
//    [self addSubview:btn2];
//
//    // noxafil button
//    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(680, 140, 270, 120)];
//    [btn3 addTarget:self action:@selector(openNoxafil:) forControlEvents:UIControlEventTouchUpInside];
////    btn3.backgroundColor=[UIColor orangeColor]; //up
//    [self addSubview:btn3];
// 
//    // cancidas button
//    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(680, 310, 270, 200)];
//    [btn4 addTarget:self action:@selector(openCancidas:) forControlEvents:UIControlEventTouchUpInside];
////    btn4.backgroundColor=[UIColor yellowColor];// down
//    [self addSubview:btn4];
    
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
}

-(void) openInvanz:(id)sender
{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app showInvanz:UIViewAnimationOptionTransitionNone];
}

-(void) openNoxafil:(id)sender
{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app showNoxafil:UIViewAnimationOptionTransitionNone];
}
-(void) openCancidas:(id)sender
{
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app showCancidas:UIViewAnimationOptionTransitionNone];
}

//-(void) openNoxafilQuestion{
//    [self showQuestionView];
//
//}

//EmendViewController *EmendVC;
//-(void) showQuestionView
//{
//    if(finalQuestionController == nil) {
//        finalQuestionController = [[QuestionViewController alloc] initWithNibName:@"QuestionViewController" bundle:[NSBundle mainBundle]];
//        finalQuestionController.dataFileName = @"invanz_question.plist";
//        finalQuestionController.delegateQ = self;
//        finalQuestionController.applicationId = APPLICATION_NOXAFIL;
//        finalQuestionController.answersData = [Test activeTest].answers;
//        finalQuestionController.statisticId = NoxafilStatistictQuestionScreen;
//        
//      //  [self presentViewController:finalQuestionController animated:YES completion:nil];
//  //      self.window.rootViewController.presentedViewController.view
//    //    [self.window.rootViewController.parentViewController presentViewController:finalQuestionController animated:YES completion:nil ];
//        
//      //  [self addSubview:finalQuestionController.view];
//    EmendVC= (EmendViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;
//        [EmendVC presentViewController:finalQuestionController animated:YES completion:nil];
//    }
//}

-(void) openEmend:(id)sender
{
    [self.delegate emendBaseMoveToPage:1];
}

#pragma mark questionViewController DELEGATE

//-(void) questionViewControllerCloseMe{
//    
//    [EmendVC dismissViewControllerAnimated:YES completion:nil];
//
//	finalQuestionController = nil;
//}

@end
