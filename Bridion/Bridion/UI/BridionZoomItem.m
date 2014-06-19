//
//  EZZoomItem.m
//  msdAllInOne
//
//  Created by ykm dev on 1/16/13.
//
//

#import "BridionZoomItem.h"
#import "UIView-Extensions.h"
#import "AppDelegate.h"
#import "BridionInfoControl.h"

@implementation BridionZoomItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _realPosition = frame;
        self.zoomScale = 1.3;
        self.autoresizesSubviews = YES;
        
        self.imageBack = [[UIImageView alloc] initWithFrame:self.bounds] ;
        [self.imageBack setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self.imageBack setContentMode:UIViewContentModeScaleToFill];
        [self addSubview:self.imageBack];
        
        self.imageShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)] ;
        [self.imageShadow setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
        [self.imageShadow setUserInteractionEnabled:YES];
        [self.imageShadow setImage:[UIImage imageNamed:@"elonva_page_zoom_back.png"]];
        [self.imageShadow setContentMode:UIViewContentModeScaleToFill];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [tap setNumberOfTapsRequired:1];
        [self addGestureRecognizer:tap];

    }
    return self;
}

-(void) setRInfo:(NSString*)image
{
    self.infoPlus = [[BridionInfoControl alloc] initWithFrame:CGRectMake(255, 610, 52, 52) textImageName:image imageToPress:@"elonva_r.png"];
    [self addSubview:self.infoPlus];
}

-(void) setPlusInfo:(NSString*)image
{
    self.infoPlus = [[BridionInfoControl alloc] initWithFrame:CGRectMake(170, 610, 52, 52) textImageName:image imageToPress:@"elonva_+.png"];
    [self addSubview:self.infoPlus];
}

-(void) tapGesture:(UITapGestureRecognizer*)gesture
{
    if(_isOpen) {
        [self close];
    }
    else {
        [self open];
    }
}

-(void) open
{
    if(_isAnimation) return;
    _isAnimation = YES;
    
    //[self.infoPlus setAlpha:0];
    //[self.infoR setAlpha:0];
    _isOpen = YES;
    [self.delegate EmendZoomItemWillOpen:self];
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    //shadow
    [self.imageShadow setAlpha:0];
    [app.window.rootViewController.view addSubview:self.imageShadow];
    //content
    CGPoint point = [app.window.rootViewController.view convertPoint:self.frame.origin fromView:self.superview];
    [self setOrigin:point];
    [app.window.rootViewController.view addSubview:self];
    
    //CGRect rect = self.frame;
    //rect.size.width = self.width*1.3;
    //rect.size.height = self.height*1.3;
    //rect.origin.x = self.superview.bounds.size.width/2.0 - rect.size.width/2.0;
    //rect.origin.y = self.superview.bounds.size.height/2.0 - rect.size.height/2.0 + self.topMargin;
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [self setCenter:CGPointMake(self.imageShadow.center.x, self.imageShadow.center.y + self.topMargin)];
        //self.frame = rect;
        self.transform = CGAffineTransformMakeScale(self.zoomScale, self.zoomScale);
        [self.imageShadow setAlpha:1];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
            [self.infoPlus setAlpha:1];
            [self.infoR setAlpha:1];
        } completion:^(BOOL finished) {
            _isAnimation = NO;
        }];
    }];
}

-(void) didMoveToSuperview
{
    if(self.realSuperView == nil && self.superview != nil) {
        self.realSuperView = self.superview;
    }
}

-(void) close
{
    if(_isAnimation) return;
    _isAnimation = YES;
    
    _isOpen = NO;
    //[self.infoPlus setAlpha:0];
    //[self.infoR setAlpha:0];
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    CGPoint point = [app.window.rootViewController.view convertPoint:_realPosition.origin fromView:self.realSuperView];
    
    CGRect rect = self.frame;
    //rect.size.width = _realPosition.size.width;
    //rect.size.height = _realPosition.size.height;
    rect.origin.x = point.x;
    rect.origin.y = point.y;
    
    [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        self.transform = CGAffineTransformIdentity;
        [self setOrigin:CGPointMake(point.x, point.y)];
        
        [self.imageShadow setAlpha:0];
    } completion:^(BOOL finished) {
        self.frame = _realPosition;
        [self.realSuperView addSubview:self];
        [self.imageShadow removeFromSuperview];
        _isAnimation = NO;
    }];
}



@end
