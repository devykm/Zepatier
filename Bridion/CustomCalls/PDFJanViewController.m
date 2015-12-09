//
//  PDFJanViewController.m
//  msdAllInOne
//
//  Created by Tamir Konor on 11/12/15.
//
//

#import "PDFJanViewController.h"
#import "PdfFileData.h"
#import "GMCatalogFileHelper.h"
#import "ZoomingPDFViewerViewController.h"
#import "BridionViewController.h"
@interface PDFJanViewController ()

@end

@implementation PDFJanViewController
@synthesize applicationId,btnOpenPDF;
PdfFileData* rpdfData;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    //if (isJanuvia){
    [self performSelector:@selector(showPDF:) withObject:nil afterDelay:0.5];
    //}else{
        //[self performSelector:@selector(showPDFEZ:) withObject:nil afterDelay:0.1];

    //}
    

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
    [[BridionViewController getInstance] openPdf:rpdfData];
}
//-(void)showPDFEZ:(id)sender{
//    [[EzetrolNViewController getInstance] openPdf:rpdfData];
//}
-(void)pageDidAppear{
    
}
-(void)pagewillDisapear{
    //[self.view removeFromSuperview];
}
-(void)pageDidDissapear{
    [self.view removeFromSuperview];
    
}


-(void) openPdf:(PdfFileData*)pdfData
{
    rpdfData = pdfData;
        int applicationId = self.applicationId;

        if ([[[pdfData.file pathExtension] lowercaseString] isEqualToString:@"pdf"]){
        if([GMCatalogFileHelper isCatalogFile:pdfData.file]) {
            NSString *filePath = [GMCatalogFileHelper getCatalogItemPath:pdfData.file];
            if(filePath == nil) {
                return;
            }
        }
            
         
            
        
        ZoomingPDFViewerViewController *pdfViewer = [[ZoomingPDFViewerViewController alloc] initWithPdf:pdfData];
        pdfViewer.delegate = self;
        pdfViewer.currentApplicationId = self.applicationId;
     
            [pdfViewer.view setUserInteractionEnabled:NO];
        [self.view addSubview:pdfViewer.view];
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
        pdfViewer.btnClose.hidden = true;
        
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
