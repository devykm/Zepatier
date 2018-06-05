//
//  ArcRotatePageView.m
//  Arcoxia
//
//  Created by ykm dev on 12/2/12.
//
//

#import "ArcRotatePageView.h"
#import "AppDelegate.h"
#import "InfoControl.h"

@implementation ArcRotatePageView

- (id)init:(UIImage*)image info:(NSString*)infoText
{
    self = [super init];
    if (self) {
        [self.view setFrame:CGRectMake(0, 0, 768, 1024)];
        
        UIImageView *back = [[UIImageView alloc] initWithFrame:self.view.bounds];
        [back setImage:[UIImage imageNamed:@"arc_rotate_back.png"]];
        [self.view addSubview:back];

        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        [imageView setImage:image];
        [self.view addSubview:imageView];

        
        self.info = [[InfoControl alloc] initWithFrame:CGRectMake(675, 126, 40, 40) BgImageName:@"arc_info_btn.png" textImageName:infoText WithOrientation:InfoControlOrientationLEFT];
        [self.view addSubview:self.info];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRotate:) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}

-(void) didRotate:(NSNotification*)notity
{
	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
	if(orientation == UIDeviceOrientationLandscapeLeft) {
        [self closeRotateView];
	}
	else if(orientation == UIDeviceOrientationLandscapeRight) {
        [self closeRotateView];
	}
	else if(orientation == UIDeviceOrientationPortrait) {
	}
	else if(orientation == UIDeviceOrientationPortraitUpsideDown) {
	}
}

-(void) closeRotateView
{
    [self.delegate arcRotatePageViewClose];
}



#pragma ------------------
#pragma Life

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if(interfaceOrientation == UIInterfaceOrientationPortrait ||
       interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        return YES;
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
