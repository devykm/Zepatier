//
//  Dosage_02.m
//  
//
//  Created by iOS Developer on 17/12/2015.
//
//

#import "Dosage_02.h"

@implementation Dosage_02

{
    UIImageView *referenceView;
    UIImageView *graph;
    UIImageView *bubble1_9;
    UIImageView *bubble_1;
    UIImageView *bubble66;
    UIImageView *bubble24;
    UIImageView *bubble34;
    UIImageView *bubble34000;
    UIImageView *bubble87;
    UIImageView *bubble10;
    UIImageView *bubble4;
    UIImageView *bubble94540;

    UIButton *infoButton;
}
- (id)initWithPageNumber:(int)page size:(CGSize)size
{
    if (self = [super initWithPageNumber:page size:size]) {
        self.statisticId = ArcoxiaStatistictPageDosage02;
    }
    return self;
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) return;
    self.isLoaded = YES;
    
    [self.container setAlpha:0];
    [self.imgTitle setImage:[UIImage imageNamed:@"dosage02_tittle.png"]];
    [self.imgTitle setContentMode:UIViewContentModeCenter];
    
    graph = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    [graph setImage:[UIImage imageNamed:@"dosage02_slide.png"]];
    [graph setContentMode:UIViewContentModeScaleAspectFit];
    [self.container addSubview:graph];
    
    bubble1_9 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble1_9.image = [UIImage imageNamed:@"dosage02_1_9.png"];
    [bubble1_9 setAlpha:0.0];
    [self.container addSubview:bubble1_9];
    
    bubble_1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble_1.image = [UIImage imageNamed:@"dosage02_1.png"];
    [bubble_1 setAlpha:0.0];
    
    [self.container addSubview:bubble_1];
    
    bubble66 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble66.image = [UIImage imageNamed:@"dosage02_66.png"];
    [bubble66 setAlpha:0.0];
    [self.container addSubview:bubble66];

    bubble34 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble34.image = [UIImage imageNamed:@"dosage02_34.png"];
    [bubble34 setAlpha:0.0];
    [self.container addSubview:bubble34];
    
    bubble4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble4.image = [UIImage imageNamed:@"dosage02_4.png"];
    [bubble4 setAlpha:0.0];
    [self.container addSubview:bubble4];

    
    bubble10 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble10.image = [UIImage imageNamed:@"dosage02_10.png"];
    [bubble10 setAlpha:0.0];
    [self.container addSubview:bubble10];
    
    bubble34000 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble34000.image = [UIImage imageNamed:@"dosage02_34000.png"];
    [bubble34000 setAlpha:0.0];
    [self.container addSubview:bubble34000];

    
    bubble24 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble24.image = [UIImage imageNamed:@"dosage02_24.png"];
    [bubble24 setAlpha:0.0];
    [self.container addSubview:bubble24];
    
    bubble94540 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble94540.image = [UIImage imageNamed:@"dosage02_94540.png"];
    [bubble94540 setAlpha:0.0];
    [self.container addSubview:bubble94540];
    
    bubble87 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.container.bounds.size.width, self.container.bounds.size.height)];
    bubble87.image = [UIImage imageNamed:@"dosage02_87.png"];
    [bubble87 setAlpha:0.0];
    [self.container addSubview:bubble87];


    //    summary = [[UIImageView alloc] initWithFrame:CGRectMake(30, - 179, 880, 750)];
    //    [summary setImage:[UIImage imageNamed:@"efficiency12_text.png"]];
    //    [summary setContentMode:UIViewContentModeScaleAspectFit];
    //    summary.alpha = 0.0;
    //    [self.container addSubview:summary];
    
    //safety01_nsaid
    
    UIView * view_1_9 = [[UIView alloc]initWithFrame:CGRectMake(800, 310, 90, 80)];
    //view_1_9.backgroundColor = [UIColor blackColor];
    [self addSubview:view_1_9];
    
    UIView * view66 = [[UIView alloc]initWithFrame:CGRectMake(720, 190, 90, 80)];
    //view66.backgroundColor = [UIColor blackColor];
    [self addSubview:view66];
    
    UIView * view24 = [[UIView alloc]initWithFrame:CGRectMake(620, 120, 60, 60)];
    //view24.backgroundColor = [UIColor blackColor];
    [self addSubview:view24];
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(475, 90, 60, 60)];
    //view1.backgroundColor = [UIColor blackColor];
    [self addSubview:view1];
    
    UIView * view34 = [[UIView alloc]initWithFrame:CGRectMake(345, 110, 75, 80)];
    //view34.backgroundColor = [UIColor blackColor];
    [self addSubview:view34];
    
    UIView * view34000 = [[UIView alloc]initWithFrame:CGRectMake(240, 200, 85, 90)];
    //view34000.backgroundColor = [UIColor blackColor];
    [self addSubview:view34000];
    
    UIView * view87 = [[UIView alloc]initWithFrame:CGRectMake(150, 345, 70, 70)];
    //view87.backgroundColor = [UIColor blackColor];
    [self addSubview:view87];
    
    UIView * view10 = [[UIView alloc]initWithFrame:CGRectMake(320, 375, 90, 90)];
    //view10.backgroundColor = [UIColor blackColor];
    [self addSubview:view10];
    
    UIView * view4 = [[UIView alloc]initWithFrame:CGRectMake(490, 415, 70, 70)];
    //view4.backgroundColor = [UIColor blackColor];
    [self addSubview:view4];

    UIView * view94540 = [[UIView alloc]initWithFrame:CGRectMake(630, 370, 110, 100)];
    //view94540.backgroundColor = [UIColor blackColor];
    [self addSubview:view94540];
    
    UITapGestureRecognizer *tap94540 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show94540)];
    [view94540 addGestureRecognizer:tap94540];

    
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show4)];
    [view4 addGestureRecognizer:tap4];
    
    UITapGestureRecognizer *tap10 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show10)];
    [view10 addGestureRecognizer:tap10];


    UITapGestureRecognizer *tap87 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show87)];
    [view87 addGestureRecognizer:tap87];

    
    UITapGestureRecognizer *tap34000 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show34000)];
    [view34000 addGestureRecognizer:tap34000];

    UITapGestureRecognizer *tap34 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show34)];
    [view34 addGestureRecognizer:tap34];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show1)];
    [view1 addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap1_9 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show1_9)];
    [view_1_9 addGestureRecognizer:tap1_9];
    
    UITapGestureRecognizer *tap66 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show66)];
    [view66 addGestureRecognizer:tap66];

    UITapGestureRecognizer *tap24 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(show24)];
    [view24 addGestureRecognizer:tap24];
    
    

    infoButton = [[UIButton alloc]initWithFrame:CGRectMake(25, 433, 50, 50)];
    [infoButton setImage:[UIImage imageNamed:@"arc_info_btn.png" ]forState:UIControlStateNormal];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:infoButton];
    [UIView animateWithDuration:0.4 animations:^(void) {
        [self.container setAlpha:1.0];
        
    }];
    
    
}
-(void)show94540{
    
    [UIView animateWithDuration:0.4 animations:^{
        [bubble66 setAlpha:0.0];
        [bubble24 setAlpha:0.0];
        [bubble1_9 setAlpha:0.0];
        [bubble_1 setAlpha:0.0];
        [bubble34 setAlpha:0.0];
        [bubble34000 setAlpha:0.0];
        [bubble87 setAlpha:0.0];
        [bubble10 setAlpha:0.0];
        [bubble4 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble94540 setAlpha:1.0];
        }];
    }];
}

-(void)show4{
    
    [UIView animateWithDuration:0.4 animations:^{
        [bubble66 setAlpha:0.0];
        [bubble24 setAlpha:0.0];
        [bubble1_9 setAlpha:0.0];
        [bubble_1 setAlpha:0.0];
        [bubble34 setAlpha:0.0];
        [bubble34000 setAlpha:0.0];
        [bubble87 setAlpha:0.0];
        [bubble10 setAlpha:0.0];
        [bubble94540 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble4 setAlpha:1.0];
        }];
    }];
}

-(void)show10{
    
    [UIView animateWithDuration:0.4 animations:^{
        [bubble66 setAlpha:0.0];
        [bubble24 setAlpha:0.0];
        [bubble1_9 setAlpha:0.0];
        [bubble_1 setAlpha:0.0];
        [bubble34 setAlpha:0.0];
        [bubble34000 setAlpha:0.0];
        [bubble87 setAlpha:0.0];
        [bubble4 setAlpha:0.0];
        [bubble94540 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble10 setAlpha:1.0];
        }];
    }];
}

-(void)show87{
    
    [UIView animateWithDuration:0.4 animations:^{
        [bubble66 setAlpha:0.0];
        [bubble24 setAlpha:0.0];
        [bubble1_9 setAlpha:0.0];
        [bubble_1 setAlpha:0.0];
        [bubble34 setAlpha:0.0];
        [bubble34000 setAlpha:0.0];
        [bubble10 setAlpha:0.0];
        [bubble4 setAlpha:0.0];
        [bubble94540 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble87 setAlpha:1.0];
        }];
    }];
}
-(void)show34000{
    
    [UIView animateWithDuration:0.4 animations:^{
        [bubble66 setAlpha:0.0];
        [bubble24 setAlpha:0.0];
        [bubble1_9 setAlpha:0.0];
        [bubble_1 setAlpha:0.0];
        [bubble34 setAlpha:0.0];
        [bubble87 setAlpha:0.0];
        [bubble10 setAlpha:0.0];
        [bubble4 setAlpha:0.0];
        [bubble94540 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble34000 setAlpha:1.0];
        }];
    }];
}

-(void)show34{
    
    [UIView animateWithDuration:0.4 animations:^{
        [bubble66 setAlpha:0.0];
        [bubble24 setAlpha:0.0];
        [bubble1_9 setAlpha:0.0];
        [bubble_1 setAlpha:0.0];
        [bubble34000 setAlpha:0.0];
        [bubble87 setAlpha:0.0];
        [bubble10 setAlpha:0.0];
        [bubble4 setAlpha:0.0];
        [bubble94540 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble34 setAlpha:1.0];
        }];
    }];
}
-(void)show1{
    
    [UIView animateWithDuration:0.4 animations:^{
        [bubble66 setAlpha:0.0];
        [bubble24 setAlpha:0.0];
        [bubble1_9 setAlpha:0.0];
        [bubble34 setAlpha:0.0];
        [bubble34000 setAlpha:0.0];
        [bubble87 setAlpha:0.0];
        [bubble10 setAlpha:0.0];
        [bubble4 setAlpha:0.0];
        [bubble94540 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble_1 setAlpha:1.0];
        }];
    }];
}

-(void)show1_9{
    
    [UIView animateWithDuration:0.4 animations:^{
        [bubble66 setAlpha:0.0];
        [bubble24 setAlpha:0.0];
        [bubble_1 setAlpha:0.0];
        [bubble34 setAlpha:0.0];
        [bubble34000 setAlpha:0.0];
        [bubble87 setAlpha:0.0];
        [bubble10 setAlpha:0.0];
        [bubble4 setAlpha:0.0];
        [bubble94540 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble1_9 setAlpha:1.0];
        }];
    }];
}
-(void)show66{
    
    [UIView animateWithDuration:0.4 animations:^{
        [bubble1_9 setAlpha:0.0];
        [bubble24 setAlpha:0.0];
        [bubble_1 setAlpha:0.0];
        [bubble34 setAlpha:0.0];
        [bubble34000 setAlpha:0.0];
        [bubble87 setAlpha:0.0];
        [bubble10 setAlpha:0.0];
        [bubble4 setAlpha:0.0];
        [bubble94540 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble66 setAlpha:1.0];
        }];
    }];
}
-(void)show24{
    [UIView animateWithDuration:0.4 animations:^{
        [bubble1_9 setAlpha:0.0];
        [bubble66 setAlpha:0.0];
        [bubble_1 setAlpha:0.0];
        [bubble34 setAlpha:0.0];
        [bubble34000 setAlpha:0.0];
        [bubble87 setAlpha:0.0];
        [bubble10 setAlpha:0.0];
        [bubble4 setAlpha:0.0];
        [bubble94540 setAlpha:0.0];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [bubble24 setAlpha:1.0];
        }];
    }];
}
-(void)showInfo{
    
    if (referenceView == nil || referenceView.alpha == 0.0f){
        referenceView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dosage02_ref.png"]];
        [referenceView setFrame:CGRectMake(70, 210, 800, 300)];
        //referenceView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:referenceView];
        [referenceView setAlpha:0.0f];
        
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:1.0f];
            
        } completion:^(BOOL finished) {
            
            
        }];
    }else{
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [referenceView setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [referenceView removeFromSuperview];
        }];
        
    }
}


@end
