//
//  PDFJanViewController.h
//  msdAllInOne
//
//  Created by Tamir Konor on 11/12/15.
//
//

#import <UIKit/UIKit.h>
#import "ZoomingPDFViewerViewController.h"

@protocol PageDelegate <NSObject>
-(void) hideHeader;
-(void) showHeader;
-(void) PageBaseShowPage:(int)pageNumber chapter:(int)chapter;
@end

@interface PDFJanViewController : UIViewController <ZoomingPDFViewControllerDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, assign) BOOL isLoaded;
@property (nonatomic, weak) id<PageDelegate> delegate;
@property (nonatomic, assign) int pageNumber;
@property (nonatomic, assign) int chapterNumber;
@property (nonatomic, assign) int applicationId;
@property (nonatomic, retain) UIButton * btnOpenPDF;
@property (nonatomic, assign) BOOL isJanuvia;

@property(nonatomic, strong)NSString*mediaType;
@property(nonatomic, strong)NSString*mediaId;
-(PDFJanViewController * ) init:(PdfFileData*)pdfData;
-(void) pageDidAppear;
-(void) pagewillDisapear;
-(void) openPdf:(PdfFileData*)pdfData; //show pdf Tamir
@end
