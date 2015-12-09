//
//  VideoViewController.h
//  
//
//  Created by iOS Developer on 26/11/2015.
//
//

#import <UIKit/UIKit.h>
#import "ZoomingPDFViewerViewController.h"
#import "BaseMovieViewController.h"
@protocol PageDelegate <NSObject>
-(void) hideHeader;
-(void) showHeader;
-(void) PageBaseShowPage:(int)pageNumber chapter:(int)chapter;
@end

@interface VideoViewController : UIViewController <ZoomingPDFViewControllerDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, assign) BOOL isLoaded;
@property (nonatomic, weak) id<PageDelegate> delegate;
@property (nonatomic, assign) int pageNumber;
@property (nonatomic, assign) int chapterNumber;
@property (nonatomic, assign) int applicationId;
@property (nonatomic, retain) UIButton * btnOpenPDF;
@property (nonatomic, assign) BOOL isJanuvia;
@property (nonatomic, retain) BaseMovieViewController * moviePlayer;

@property(nonatomic, strong)NSString*mediaType;
@property(nonatomic, strong)NSString*mediaId;
-(VideoViewController * ) init:(PdfFileData*)pdfData;
-(void) pageDidAppear;
-(void) pagewillDisapear;
-(void) openPdf:(PdfFileData*)pdfData; //show pdf Tamir
-(void)showPDF:(id)sender;

@end
