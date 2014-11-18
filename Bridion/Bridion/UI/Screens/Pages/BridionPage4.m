//
//  ZostavaxPage1.m
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import "BridionPage4.h"
#import "AppDelegate.h"
#import "BridionViewController.h"
#import "GMCatalogManager.h"
#import "UIAlertViewHelper.h"

@implementation BridionPage4
{
    UIImageView *img;
}

- (id)initWithPageNumber:(int)page size:(CGSize)size
{
	if (self = [super initWithPageNumber:BridionStatistictPage4 size:size]) {
        [self buildPage];
    }
    return self;
}

-(void) buildPage
{
    [[NSBundle mainBundle] loadNibNamed:@"BridionPage4" owner:self options:nil];
    [self.view setFrame:self.bounds];
    [self addSubview:self.view];
}

-(void) pageDidAppear
{
    [super pageDidAppear];
    
    if(self.isLoaded) {
        return;
    }
    self.isLoaded = YES;
}

- (IBAction)btnPlayVideoClick:(id)sender
{
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    BridionViewController *controller = (BridionViewController*)delegate.window.rootViewController;
    
    PdfFileData *data = [[GMCatalogManager getCatalog] getApplicationCatalogItem:APPLICATION_BRIDION itemId:10726];
    if(data != nil) {
        [controller openPdf:data];
    }
    else {
        [UIAlertView presentAlertViewWithTitle:@"Movie" message:@"File not found" delegate:nil];
    }
}

@end
