//
//  ZostavaxPage1.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//
#import "BridionPage3.h"
#import "SelectionViewController.h"
#import "JWGCircleCounter.h"
#import "InfoControl.h"
#import "FTAnimation+UIView.h"
#import "NSObject+Extension.h"

@implementation BridionPage3
{
    SelectionViewController *_timeModeratePicker;
    UIPopoverController *_timeModeratePickerPopover;
    
    SelectionViewController *_timeDeepPicker;
    UIPopoverController *_timeDeepPickerPopover;
    
    JWGCircleCounter *_circleModerateCounter;
    JWGCircleCounter *_circleModerateFastCounter;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:BridionStatistictPage3 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [[NSBundle mainBundle] loadNibNamed:@"BridionPage3" owner:self options:nil];
    [self.view setFrame:self.bounds];
    [self addSubview:self.view];
    
    [self.moderateCircle setStartDegree:0];
    [self.moderateCircle setEndDegree:360];
    [self.moderateCircle setBackBorderWidth: 15.0];
    [self.moderateCircle setFrontBorderWidth: 14.8];
    [self.moderateCircle setColorTable: @{
                                  NSStringFromProgressLabelColorTableKey(ProgressLabelTrackColor):[UIColor colorWithRed:98/255.0 green:98/255.0 blue:98/255.0 alpha:1.0],
                                  NSStringFromProgressLabelColorTableKey(ProgressLabelProgressColor):[UIColor colorWithRed:165/255.0 green:165/255.0 blue:165/255.0 alpha:1.0]
                                  }];
    
    [self.moderateCircleFast setStartDegree:0];
    [self.moderateCircleFast setEndDegree:360];
    [self.moderateCircleFast setBackBorderWidth: 15.0];
    [self.moderateCircleFast setFrontBorderWidth: 14.8];
    [self.moderateCircleFast setColorTable: @{
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelTrackColor):[UIColor colorWithRed:237/255.0 green:134/255.0 blue:21/255.0 alpha:1.0],
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelProgressColor):[UIColor colorWithRed:232/255.0 green:197/255.0 blue:157/255.0 alpha:1.0]
                                          }];
    
    
    [self.deepCircle setStartDegree:0];
    [self.deepCircle setEndDegree:360];
    [self.deepCircle setBackBorderWidth: 15.0];
    [self.deepCircle setFrontBorderWidth: 14.8];
    [self.deepCircle setColorTable: @{
                                      NSStringFromProgressLabelColorTableKey(ProgressLabelTrackColor):[UIColor colorWithRed:98/255.0 green:98/255.0 blue:98/255.0 alpha:1.0],
                                      NSStringFromProgressLabelColorTableKey(ProgressLabelProgressColor):[UIColor colorWithRed:165/255.0 green:165/255.0 blue:165/255.0 alpha:1.0]
                                      }];
    
    [self.deepCircleFast setStartDegree:0];
    [self.deepCircleFast setEndDegree:360];
    [self.deepCircleFast setBackBorderWidth: 15.0];
    [self.deepCircleFast setFrontBorderWidth: 14.8];
    [self.deepCircleFast setColorTable: @{
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelTrackColor):[UIColor colorWithRed:237/255.0 green:134/255.0 blue:21/255.0 alpha:1.0],
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelProgressColor):[UIColor colorWithRed:232/255.0 green:197/255.0 blue:157/255.0 alpha:1.0]
                                          }];
    
    InfoControl *info = [[InfoControl alloc] initWithFrame:CGRectMake(20, 600, 42, 42) BgImageName:@"bridion_R.png" textImageName:@"bridion_PCR3_reference.png" WithOrientation:InfoControlOrientationRIGHTTOP] ;
    info.arrowSideMargin = 0;
    [self addSubview:info];
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
    
    [self showTabModarate];
}

- (void) showTabModarate
{
    [self.containerDeep setHidden:YES];
    [self.containerModerate setHidden:NO];
    [self.moderateCircle setProgress:0
                              timing:TPPropertyAnimationTimingEaseOut
                            duration:5*60
                               delay:0.0];
}

- (void) showTabDeep
{
    [self.containerDeep setHidden:NO];
    [self.containerModerate setHidden:YES];
    [self.deepCircle setProgress:0
                              timing:TPPropertyAnimationTimingEaseOut
                            duration:5*60
                               delay:0.0];
}

- (IBAction)tabClick:(id)sender
{
    UIButton *btn = sender;
    if(btn.tag == 1) {
        [self.btnDeep setSelected:NO];
        [self.btnModerate setSelected:YES];
        
        [self showTabModarate];
    }
    else {
        [self.btnDeep setSelected:YES];
        [self.btnModerate setSelected:NO];
        
        [self showTabDeep];
    }
}

- (IBAction)btnTimeModerateClick:(id)sender
{
    [self initPopOverWithModerateTimes];
}

- (IBAction)btnTimeDeepClick:(id)sender
{
    [self initPopOverWithDeepTimes];
}

-(void) initPopOverWithModerateTimes
{
    NSMutableArray *arrayItems = @[].mutableCopy;
    for(int i=0; i<100;i++) {
        [arrayItems addObject:[NSString stringWithFormat:@"%d", i+1]];
    }
    
    if (_timeModeratePicker == nil) {
        _timeModeratePicker = [[SelectionViewController alloc] initWithNibName:@"SelectionViewController" bundle:nil];
        _timeModeratePicker.delegate = (id<SelectionViewControllerDelegate>)self;
        _timeModeratePicker.selectionType = EndMeetingSelectionRegular;
        _timeModeratePicker.preferredContentSize = CGSizeMake(200.0, 200.0);
        _timeModeratePickerPopover = [[UIPopoverController alloc] initWithContentViewController:_timeModeratePicker];
    }
    
    if(arrayItems != nil && [arrayItems count] > 0) {
        _timeModeratePicker.dataArray = arrayItems;
        [_timeModeratePickerPopover presentPopoverFromRect:self.btnModerateTime.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        [_timeModeratePicker.table reloadData];
    }
    else {
        [_timeModeratePickerPopover dismissPopoverAnimated:YES];
    }
}

-(void) initPopOverWithDeepTimes
{
    NSMutableArray *arrayItems = @[].mutableCopy;
    for(int i=0; i<100;i++) {
        [arrayItems addObject:[NSString stringWithFormat:@"%d", i+1]];
    }
    
    if (_timeDeepPicker == nil) {
        _timeDeepPicker = [[SelectionViewController alloc] initWithNibName:@"SelectionViewController" bundle:nil];
        _timeDeepPicker.delegate = (id<SelectionViewControllerDelegate>)self;
        _timeDeepPicker.selectionType = EndMeetingSelectionRegular;
        _timeDeepPicker.preferredContentSize = CGSizeMake(200.0, 200.0);
        _timeDeepPickerPopover = [[UIPopoverController alloc] initWithContentViewController:_timeDeepPicker];
    }
    
    if(arrayItems != nil && [arrayItems count] > 0) {
        _timeDeepPicker.dataArray = arrayItems;
        [_timeDeepPickerPopover presentPopoverFromRect:self.btnDeepTime.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        [_timeDeepPicker.table reloadData];
    }
    else {
        [_timeDeepPickerPopover dismissPopoverAnimated:YES];
    }
}

-(void)itemSelected:(SelectionViewController*)sender text:(NSString *)text
{
    NSString *trimmedString = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(sender == _timeModeratePicker) {
        self.lblModerateTime.text = trimmedString;
        
        [_timeModeratePickerPopover dismissPopoverAnimated:YES];
        [self.moderateCircleFast setProgress:0
                                  timing:TPPropertyAnimationTimingEaseOut
                                duration:3
                                   delay:1.0];
        [self performBlock:^{
            [self.moderate1_4 popIn:0.4 delegate:nil];
            
            [self.moderateText1 fadeIn:0.4 delegate:nil];
            [self.moderateText2 fadeIn:0.4 delegate:nil];
            [self.moderateText3 fadeIn:0.4 delegate:nil];
        } afterDelay:2.0];
    }
    else if(sender == _timeDeepPicker) {
        self.lblDeepTime.text = trimmedString;
        
        [_timeDeepPickerPopover dismissPopoverAnimated:YES];
        [self.deepCircleFast setProgress:0
                                      timing:TPPropertyAnimationTimingEaseOut
                                    duration:3
                                       delay:1.0];
        [self performBlock:^{
            [self.deep2_7 popIn:0.4 delegate:nil];
            
            [self.deepText1 fadeIn:0.4 delegate:nil];
            [self.deepText2 fadeIn:0.4 delegate:nil];
            [self.deepText3 fadeIn:0.4 delegate:nil];
        } afterDelay:2.0];
    }
}

-(void) itemSelected:(SelectionViewController *)sender texts:(NSMutableArray *)texts
{
    
}

@end
