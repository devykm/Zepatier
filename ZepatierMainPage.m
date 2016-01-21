//
//  ZepatierMainPage.m
//  Zepatier
//
//  Created by iOS Developer on 17/01/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierMainPage.h"
#import <QuartzCore/QuartzCore.h>
#import "ZepatierPageData.h"
#import "ZepatierChapterData.h"
@implementation ZepatierMainPage
{
    CGRect w8Rect;
    CGRect tnRect;
    CGRect cirhosisRect;
    CGRect g1bRect;
    CGRect g1aRect;
    CGRect lungsRect;
    CGRect ribbonRect;
    CGRect teRect;
    CGRect oatRect;

}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ZepatierStatisticsHomePage;
        
        [[NSBundle mainBundle] loadNibNamed:@"ZepatierMainPage" owner:self options:nil];
        [self addSubview:self.view];
    }
        self.prSmall.alpha = 0.0;
        self.piSmall.alpha = 0.0;
        self.cirrhosis.alpha = 0.0;
        self.g1a.alpha = 0.0;
        self.g1b.alpha = 0.0;
        self.oat.alpha = 0.0;
        self.w8.alpha = 0.0;
        self.lungs.alpha = 0.0;
        self.tn.alpha = 0.0;
        self.te.alpha = 0.0;
        self.ribbon.alpha = 0.0;
        self.zepatierLogo.alpha = 0.0;

    
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];

    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
   
    [self performSelector:@selector(animate) withObject:nil afterDelay:1.0];
    

}

- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


-(void)animate
{
    
    [self runSpinAnimationOnView:self.cirrhosis duration:5.0 rotations:1.0 repeat:0];
    [self runSpinAnimationOnView:self.w8 duration:5.0 rotations:1.0 repeat:0];
    [self runSpinAnimationOnView:self.g1a duration:5.0 rotations:1.0 repeat:0];
    [self runSpinAnimationOnView:self.g1b duration:5.0 rotations:1.0 repeat:0];
    [self runSpinAnimationOnView:self.te duration:5.0 rotations:1.0 repeat:0];
    [self runSpinAnimationOnView:self.tn duration:5.0 rotations:1.0 repeat:0];
    [self runSpinAnimationOnView:self.oat duration:5.0 rotations:1.0 repeat:0];
    [self runSpinAnimationOnView:self.ribbon duration:5.0 rotations:1.0 repeat:0];
    [self runSpinAnimationOnView:self.lungs duration:5.0 rotations:1.0 repeat:0];
    
    [self runSpinAnimationOnView:self.circleView duration:30.0 rotations:0.2 repeat:55];
    [UIView animateWithDuration:2.5 animations:^{
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:4.0 delay:2.0 usingSpringWithDamping:1.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            self.cirrhosis.layer.frame = CGRectMake(173, 490, 110, 105);
            self.cirrhosis.alpha = 1.0;
            
            self.w8.frame = CGRectMake(457, 138, 111, 94);
            self.w8.alpha = 1.0;
            
            self.g1b.frame = CGRectMake(443, 524, 105, 95);
            self.g1b.alpha = 1.0;
            
            self.tn.frame = CGRectMake(162, 138, 111, 101);
            self.tn.alpha = 1.0;
            
            self.oat.frame = CGRectMake(559, 240, 114, 116);
            self.oat.alpha = 1.0;
            
            self.te.frame = CGRectMake(60, 240, 114, 107);
            self.te.alpha = 1.0;
            
            self.g1a.frame = CGRectMake(330, 498, 105, 95);
            self.g1a.alpha = 1.0;
            
            self.lungs.frame = CGRectMake(316, 55, 104, 99);
            self.lungs.alpha = 1.0;
            
            self.ribbon.frame = CGRectMake(122, 383, 114, 107);
            self.ribbon.alpha = 1.0;
            
            
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
                self.zepatierLogo.alpha = 1.0;
                
                
            } completion:^(BOOL finished) {
                [self saveOriginalCoords];
                //[self setOriginalCoords];
            }];
            
        }];
        
    }];
 
    
}


- (IBAction)oatAction:(UIButton *)sender {
}



- (IBAction)cirhosisAction:(UIButton *)sender {

    [UIView animateWithDuration:1.0 animations:^{
        //[sender setOriginX:125];
        //[sender setOriginY:188];
        sender.layer.frame = CGRectMake(926, 584, 110, 105);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(goToCirrhosis:) withObject:[NSNumber numberWithInt:0] afterDelay:0.5];
        
        
    }];
    

    
}
- (IBAction)g1aAction:(UIButton *)sender {
    
    [UIView animateWithDuration:1.0 animations:^{
        //[sender setOriginX:125];
        //[sender setOriginY:188];
        sender.layer.frame = CGRectMake(924, 585, 105, 95);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(goTog1a:) withObject:[NSNumber numberWithInt:0] afterDelay:0.5];
        
        
    }];
    
}
- (IBAction)g1bAction:(UIButton *)sender {
    [UIView animateWithDuration:1.0 animations:^{
        //[sender setOriginX:125];
        //[sender setOriginY:188];
        sender.layer.frame = CGRectMake(930, 590, 105, 95);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(goToGb1:) withObject:[NSNumber numberWithInt:0] afterDelay:0.5];
        
        
    }];

    
}
- (IBAction)ribbonAction:(UIButton *)sender {
    
    
    
    
}
- (IBAction)teAction:(UIButton *)sender {
    
    [UIView animateWithDuration:1.0 animations:^{
        self.prSmall.frame = CGRectMake(35, 213, 61, 54);
        self.piSmall.frame = CGRectMake(10, 282, 76, 54);
        self.prSmall.alpha = 1.0;
        self.piSmall.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
    
}

- (IBAction)tnAction:(UIButton *)sender {
    
    [UIView animateWithDuration:1.0 animations:^{
        //[sender setOriginX:125];
        //[sender setOriginY:188];
        sender.layer.frame = CGRectMake(920, 590, 111, 101);
    } completion:^(BOOL finished) {
        [self performSelector:@selector(goToTn:) withObject:[NSNumber numberWithInt:0] afterDelay:0.5];
        
        
    }];

    
}
- (IBAction)lungsAction:(UIButton *)sender {
    
    
    
}
- (IBAction)piSmallAction:(UIButton *)sender {
    
    
    
}


- (IBAction)prSmallAction:(UIButton *)sender {
    
    
    
}


- (IBAction)w8Action:(UIButton *)sender {
    
    
    
}
-(void)saveOriginalCoords{
    tnRect = self.tn.frame;
    teRect = self.te.frame;
    ribbonRect = self.ribbon.frame;
    lungsRect = self.lungs.frame;
    oatRect = self.oat.frame;
    w8Rect = self.w8.frame;
    g1aRect = self.g1a.frame;
    g1bRect = self.g1b.frame;
    cirhosisRect = self.cirrhosis.frame;
    [self.view layoutIfNeeded];

}
-(void)setOriginalCoords{
    self.tn.frame = tnRect;
    self.te.frame = teRect;
    self.ribbon.frame = ribbonRect;
    self.lungs.frame = lungsRect;
    self.oat.frame = oatRect;
    self.g1a.frame = g1aRect;
    self.g1b.frame = g1bRect;
    self.cirrhosis.frame = cirhosisRect;
    self.w8.frame = w8Rect;
    [self.view layoutIfNeeded];

    
}

-(void)pagewillDisapear{
    [super pagewillDisapear];
    
    //[self setOriginalCoords];
}
-(void)goToGb1:(NSNumber*)slideNumber {
    [self.delegate bridionBaseViewOpenPage:[ZepatierChapterData getChapterPageRealIndex:5 pageIndex:[slideNumber intValue]] animated:NO];
    [self setOriginalCoords];
}
-(void)goToCirrhosis:(NSNumber*)slideNumber {
    [self.delegate bridionBaseViewOpenPage:[ZepatierChapterData getChapterPageRealIndex:3 pageIndex:[slideNumber intValue]] animated:NO];
    [self setOriginalCoords];
}
-(void)goTog1a:(NSNumber*)slideNumber {
    [self.delegate bridionBaseViewOpenPage:[ZepatierChapterData getChapterPageRealIndex:6 pageIndex:[slideNumber intValue]] animated:NO];
    [self setOriginalCoords];
}

-(void)goToTn:(NSNumber*)slideNumber {
    [self.delegate bridionBaseViewOpenPage:[ZepatierChapterData getChapterPageRealIndex:1 pageIndex:[slideNumber intValue]] animated:NO];
    [self setOriginalCoords];
}


@end
