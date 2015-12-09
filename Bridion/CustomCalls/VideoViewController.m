//
//  VideoViewController.m
//  
//
//  Created by iOS Developer on 26/11/2015.
//
//

#import "VideoViewController.h"
#import "PdfFileData.h"
#import "GMCatalogFileHelper.h"
#import "ZoomingPDFViewerViewController.h"
#import "BridionViewController.h"
#import "BaseMovieViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
PdfFileData* rpdfData;
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self performSelector:@selector(showPDF:) withObject:nil afterDelay:1.0];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UIImage * image = [UIImage imageNamed:@"Apps-Player-Video-icon.png"];
    UIImageView *imageVIew = [[UIImageView alloc]initWithImage:image];
    imageVIew.frame = CGRectMake(0, 0, 300, 300);
    imageVIew.center = CGPointMake(500, 300);
    imageVIew.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageVIew];
    
    //if (isJanuvia){
    //[self showPDF:self];
    //}else{
    //[self performSelector:@selector(showPDFEZ:) withObject:nil afterDelay:0.1];
    
    //}
    
    
}

-(void)pageDidAppear{
    
}
-(void)pagewillDisapear{
    [self.moviePlayer.moviePlayer stop];
    
}
-(void)pageDidDissapear{
    [self.moviePlayer.moviePlayer stop];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    CGPoint location = [touch locationInView:self.view];
//
//    if (CGRectContainsPoint(self.view.frame, location)) {
//         [[msdIpadViewController getInstance] openPdf:rpdfData];
//        return NO;
//    }
//    return YES;
//}
-(void)showPDF:(id)sender{
    //[[GardasilViewController getInstance] openPdf:rpdfData];
}
//-(void)showPDFEZ:(id)sender{
//    [[EzetrolNViewController getInstance] openPdf:rpdfData];
//}


-(void) openPdf:(PdfFileData*)pdfData
{
    rpdfData = pdfData;
    int applicationId = self.applicationId;
    
    if ([[[pdfData.file pathExtension] lowercaseString] isEqualToString:@"mov"] ||
        [[[pdfData.file pathExtension] lowercaseString] isEqualToString:@"mp4"]){
        NSURL *videoURL = nil;
        if([GMCatalogFileHelper isCatalogFile:pdfData.file]) {
            NSString *filePath = [GMCatalogFileHelper getCatalogItemPath:pdfData.file];
            if(filePath == nil) {
                return;
            }
            videoURL = [NSURL fileURLWithPath:filePath];
        }
        else {
            NSString *moviePath = [[NSBundle mainBundle] pathForResource:pdfData.file ofType:nil];
            videoURL = [NSURL URLWithString:moviePath];
        }
        
        self.moviePlayer = [[BaseMovieViewController alloc] initWithContentURL:videoURL];
        [self presentMoviePlayerViewControllerAnimated:self.moviePlayer];
        self.moviePlayer.fileData = pdfData;
        self.moviePlayer.currentApplicationId = applicationId;
        [self.moviePlayer.moviePlayer play];
        
        //theMovie.delegate = self;
        self.moviePlayer.currentApplicationId = self.applicationId;
        
        // [theMovie.view setUserInteractionEnabled:NO];
        [self.view addSubview:self.moviePlayer.view];
        //            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPDF:)];
        //
        //            [self.view addGestureRecognizer:tapGesture];
        //            self.btnOpenPDF = [[UIButton alloc] initWithFrame:CGRectMake(500, 0, 80, 80)];
        //            self.btnOpenPDF.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        //            [self.btnOpenPDF setImage:[UIImage imageNamed:@"close_small.png"] forState:UIControlStateNormal];
        //            [self.btnOpenPDF addTarget:self action:@selector(showPDF:) forControlEvents:UIControlEventTouchUpInside];
        //            //[self.view addSubview:self.btnOpenPDF];
        //            [self.view bringSubviewToFront:self.btnOpenPDF];
        //            [self.view setUserInteractionEnabled:YES];
        //
        //
        //
        //theMovie.btnClose.hidden = true;
        
        //            UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(nextPage:)];
        //            swipe.direction = UISwipeGestureRecognizerDirectionRight;
        //            [self.view addGestureRecognizer:swipe];
        
    }
    
    
    
    
}
-(void) zoomPdfControllerCloseMe
{
    //  [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end


