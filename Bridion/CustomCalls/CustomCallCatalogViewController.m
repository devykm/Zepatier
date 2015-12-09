//
//  CustomCallCatalogViewController.m
//  msdAllInOne
//
//  Created by iOS Developer on 10/14/15.
//
//
#import "GMHomeMenu.h"
#import "UIImage+Extra.h"
#import "GMPageData.h"
#import "CustomCallsView.h"
#import "CustomCallsPageData.h"
#import "CustomCallsChapterData.h"
#import "CustomCallCatalogViewController.h"
#import "GMCustomPageData.h"
#import "GMCustomChapterData.h"
#import "GMMainMenuView.h"
#import "customCallsMenuView.h"
#import "GMCustomPageData.h"
#import "GMCustomChapterData.h"
#import "CustomCallsPageDataView.h"
#import "PdfFileData.h"
#import "BridionViewController.h"
#import "BaseMainAppViewController.h"
#import "ASIAsyncImageView.h"
#define CUSTOM_WIDTH 689
#define CUSTOM_HEIGHT 663

#define CUSTOM_ITEM_MARGIN 52
#define CUSTOM_ITEM_WIDTH 256
#define CUSTOM_ITEM_HEIGHT 256
#define CUSTOM_PAGEITEM_WIDTH 263
#define CUSTOM_PAGEITEM_HEIGHT 250
#define CUSTOM_PAGEITEM_MARGIN 15
static GMMainMenuView * instance;

@interface CustomCallCatalogViewController ()
@property (nonatomic, weak) IBOutlet CustomCallsView *customView;
@end

@implementation CustomCallCatalogViewController

-(id) initWithFrame:(CGRect)frame pagesArray:(NSMutableArray*)pagesArray
{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = YES;
        self.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
        self.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 50, 0);

        [self setUserInteractionEnabled:YES];
        [self setBackgroundColor:[UIColor clearColor]];
        [self initItems:pagesArray];
    }
    return self;
}

+(GMMainMenuView *)getInstance{
    return instance;
}

-(void) initItems:(NSMutableArray*)pagesArray
{
    //self.customAnimateArray = pagesArray;
    float yPos = 80.0;
    float itemsHeight = 0.0;
    
    self.btnArray = [[NSMutableArray alloc] init];
    int index = 0;
    for (int j=0; j<[pagesArray count]; j++) {
       
        if ([[pagesArray objectAtIndex:j] isKindOfClass:[GMCustomPageData class]]){
            
            float x = 30.0 + CUSTOM_PAGEITEM_MARGIN -35  + ((index % 4) * CUSTOM_PAGEITEM_WIDTH + (index % 4) * (CUSTOM_PAGEITEM_MARGIN -35));
            float y = (index / 4) * 190 + yPos ;
            GMCustomPageData *pageData = (GMCustomPageData*)[pagesArray objectAtIndex:j];
            CustomCallsPageDataView* childView = [[CustomCallsPageDataView alloc]initWithFrame:CGRectMake(0, 0, 263, 250)] ;
            childView.alpha = 0.0;
            [UIView animateWithDuration:1.0 animations:^{
                childView.frame = CGRectMake(x, y, 263, 250);
                childView.alpha = 1.0;

            }];
            childView.tag = pageData.number;
            childView.chapter = pageData.chapter;
            childView.page = pageData.number;
            childView.pages = pageData.pages;
            childView.customTextView.text = pageData.title;
            childView.customTextView.textAlignment = NSTextAlignmentCenter;
            //[childView.CustomCallpageDescription sizeToFit];
            //[childView.CustomCallpageDescription setNeedsDisplay];
            //childView.CustomCallChapterDescription.text = pageData.synopsis;
            if([pageData.previewImage hasPrefix:@"http://"]){
                NSURL *imageUrl = [NSURL URLWithString:pageData.previewImage];
                [self downloadImageWithURL:imageUrl completionBlock:^(BOOL succeeded, UIImage *image) {
                    if (image == nil){
                        UIImage *img = [UIImage imageNamed:@"file16.png"];
                        if (img != nil){
                            childView.CustomCallImageView.image = img;
                            [childView.CustomCallImageView setNeedsDisplay];
                            
                        }else{
                            //childView.CustomCallImageView.image = nil;
                        }
                    }else{
                        
                        
                        childView.CustomCallImageView.image = image;
                        if (childView.CustomCallImageView.image ==nil){
                            UIImage *img = [UIImage imageNamed:@"file16.png"];
                            childView.CustomCallImageView.image = img;
                            
                        }
                    }
                    
                }];            }else{
                    childView.CustomCallImageView.image = [UIImage imageNamed:pageData.previewImage];
                }
            childView.userInteractionEnabled = YES;
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnClick:)];
            [childView addGestureRecognizer:recognizer];
            [self.btnArray addObject:childView];
            [self addSubview:childView];
            
            yPos += ((index % 4) == 3 ? CUSTOM_PAGEITEM_MARGIN : 0);//new line
            itemsHeight = y;
            index++;

        }else if([[pagesArray objectAtIndex:j] isKindOfClass:[GMCustomChapterData class]]){
            float x = 10.0 + CUSTOM_ITEM_MARGIN + ((index % 3) * CUSTOM_ITEM_WIDTH + (index % 3) * (CUSTOM_ITEM_MARGIN+10));
            float y = (index / 3) * CUSTOM_ITEM_HEIGHT + yPos;
        GMCustomChapterData *pageData = (GMCustomChapterData*)[pagesArray objectAtIndex:j];
        
        CustomCallsView* childView = [[CustomCallsView alloc]initWithFrame:CGRectMake(0, 0, 256, 256)] ;
            childView.alpha = 0.0;
            [UIView animateWithDuration:1.0 animations:^{
                childView.frame = CGRectMake(x, y, 256, 256);
                childView.alpha = 1.0;
                
            }];
            childView.chapterID = pageData.ChapterID;
  
        childView.tag = pageData.number;
        childView.chapter = pageData.chapter;
        childView.page = pageData.number;
        childView.pages = pageData.pages;
        childView.menuOpenerButton.tag = pageData.number;
        childView.CustomCallChapterName.text = pageData.title;
            //[childView.CustomCallpageDescription sizeToFit];

        childView.CustomCallChapterDescription.text = pageData.synopsis;
            childView.CustomCallChapterDescription.textAlignment = NSTextAlignmentCenter;

            if([pageData.previewImage hasPrefix:@"http://"]){
                NSURL *imageUrl = [NSURL URLWithString:pageData.previewImage];
                [self downloadImageWithURL:imageUrl completionBlock:^(BOOL succeeded, UIImage *image) {
                    if (image == nil)return ;
                    childView.CustomCallImageView.image = image;
                    
                }];
            }else{
                UIImage *thumb = [UIImage imageNamed:pageData.previewImage];
                if (thumb == nil){
                    NSString *str = @"http://msdipad.dev/Data/Catalog/Thumb/";
                    NSString *strURL = [str stringByAppendingString:pageData.previewImage];
                    NSURL *imageUrl = [NSURL URLWithString:strURL];
                    [self downloadImageWithURL:imageUrl completionBlock:^(BOOL succeeded, UIImage *image) {
                        if (image == nil)return ;
                        childView.CustomCallImageView.image = image;
                        
                    }];
                    
                    
                    
                    
                }else{
                    childView.CustomCallImageView.image = thumb;
                }
            }
            
            
        [childView.menuOpenerButton addTarget:self action:@selector(openCustomCall:) forControlEvents:UIControlEventTouchUpInside];
        childView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        childView.layer.borderWidth = 1.0f;
        childView.layer.cornerRadius = 2.0f;
        childView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnClick:)];
        [childView addGestureRecognizer:recognizer];
        [self.btnArray addObject:childView];
        [self addSubview:childView];
        
        yPos += ((index % 3) == 2 ? CUSTOM_ITEM_MARGIN : 0);//new line
        itemsHeight = y;
        index++;
        }else if([[pagesArray objectAtIndex:j] isKindOfClass:[PdfFileData class]]){
            
            
            
            
            
            
        }
    }
    
    itemsHeight += CUSTOM_ITEM_MARGIN + CUSTOM_ITEM_HEIGHT;
    self.contentSize = CGSizeMake(CUSTOM_WIDTH, itemsHeight);
}


-(void) animateBoxes
{
    float time = 0.1;
    for(UIButton* img in self.btnArray) {
        [UIView animateWithDuration:0.3 delay:time options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
            [img setAlpha:1];
        } completion:^(BOOL finished){}];
        time +=0.08;
    }
}

-(void) openCustomCall:(UIButton*)sender{
    NSLog(@"Selected button tag is %d", sender.tag);
    UIView *parent = [sender superview];
    if ([parent isKindOfClass:[UIView class]]){
        parent = parent.superview;
    }
    CustomCallsView *myView = (CustomCallsView *)parent;
    NSString *chapterName = myView.CustomCallChapterName.text;
    self.customCallManager = [[DataManager alloc] initWithDelegate:(id<DataManagerDelegate>)self];
    
    
    NSString * prodID = [NSString stringWithFormat:@"%d", myView.chapterID];
    NSString *username = [Test activeUser].userName;
    [self.customCallManager sendCustomCallsStatistics:prodID userID:username];
    
    [self chapterDidSelected:myView.pages chapterName:chapterName];
    
}

-(void) chapterDidSelected:(NSMutableArray*)pagesArray chapterName:(NSString*)chapterName;

{
    
    
    NSMutableArray *pages = [[NSMutableArray alloc] init];
//    NSMutableArray *pages = [CustomCallsChapterData loadData:@"customcallsplist.plist"];
    int index = 0;
    for(CustomCallsPageData *p in pagesArray) {
        //if(!p.isLobi) {
        GMCustomPageData *gmp = [[GMCustomPageData alloc] init];
        gmp.previewImage = p.previewImage;
        gmp.number = index;
        gmp.chapter = p.chapter;
        gmp.synopsis = p.synopsis;
        gmp.title = p.title;
        gmp.className = p.className;
        gmp.pages = pagesArray;
        [pages addObject:gmp];
        
        //}
        index++;
    }
    [self removeFromSuperview];

    [[customCallsMenuView getInstance] showCustomCallsMenu:pages statisticId:StatistictMenuHome chapterName:chapterName];

    NSLog(@":%@",pages);


}

-(void) pdfOpen:(UITapGestureRecognizer*)sender
{
    
//    CustomCallsView *btn = sender.view;
//    [self.delegateMenu GMMainMenuShowPdf:self pdf:pdf];
}

-(void) transitionToViewController:(UIViewController*)viewController withTransition:(UIViewAnimationOptions)option
{
    CATransition* transition = [CATransition animation];
    transition.removedOnCompletion = YES;
    transition.duration = 0.4;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    [self.window.layer addAnimation:transition forKey:nil];
    self.window.rootViewController = viewController;
}



-(void) btnClick:(UITapGestureRecognizer*)sender
{
    BaseMainAppViewController *mainApp = (BaseMainAppViewController*)self.window.rootViewController;
    int appId = mainApp.applicationId;
    CustomCallsView *btn = sender.view;
    if ([btn isKindOfClass:[CustomCallsPageDataView class]]){
        CustomCallsPageDataView *pageView = btn;
        [[BridionViewController getInstance]setCustomCallsFromPage:pageView.pages page:pageView.page];


    }else if ([btn isKindOfClass:[CustomCallsView class]]){
        CustomCallsView *pageView = btn;

        self.customCallManager = [[DataManager alloc] initWithDelegate:(id<DataManagerDelegate>)self];
        
        
        NSString * prodID = [NSString stringWithFormat:@"%d", pageView.chapterID];
        NSString *username = [Test activeUser].userName;
        [self.customCallManager sendCustomCallsStatistics:prodID userID:username];
    [[BridionViewController getInstance] setCustomCallsScrollView:btn.pages appID:appId];
        

                
        
    }

 }

-(void) dataManager:(DataManager *)manager dataDidFailed:(NSString *)error forType:(int)type
{
    NSLog(error);
}
-(void) dataManager:(DataManager*)manager dataDidReceived:(id)data forType:(int)type
{
    
    if(type == REQUEST_GET_CUSTOM_CALLS_FILES){
        NSError *error;
        
        //        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cc.plist" ofType:nil];
        //        [data writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }
    
    
    
}



- (void) loadFromURL: (NSURL*) url callback:(void (^)(UIImage *image))callback {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSError * error = nil;
        NSData * imageData = [NSData dataWithContentsOfURL:url options:0 error:&error];
        if (error)
            callback(nil);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:imageData];
            callback(image);
        });
    });
}
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}
-(void) dealloc
{
    self.delegateB = nil;
}

@end

@implementation GMUIcButtonMenu

@synthesize chapter,page;

@end
