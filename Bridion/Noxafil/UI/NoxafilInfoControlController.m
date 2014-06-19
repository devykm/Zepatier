    //
//  InfoControlController.m
//  lior
//
//  Created by ykm dev on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoxafilInfoControlController.h"
#import "UIImage+Extra.h"

#define POP_BORDER_TOP 0
#define POP_BORDER_BOTTOM 0
#define POP_BORDER_LEFT 0
#define POP_BORDER_RIGHT 0

@implementation NoxafilInfoControlController

-(id) init:(UIImage*)textImage
{
	if(self = [super init]) {
		self.textImage = _textImage;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view setUserInteractionEnabled:YES];
	[self.view setBackgroundColor:[UIColor clearColor]];
	
	UIImageView *textView = [[UIImageView alloc] initWithImage:self.textImage];
    [textView setContentMode:UIViewContentModeBottomLeft];
	[textView setFrame:CGRectMake(POP_BORDER_LEFT, POP_BORDER_TOP, self.textImage.size.width, self.textImage.size.height)];
	[self.view addSubview:textView];
	
	CGRect rect = self.view.frame;
	rect.size.width = textView.frame.size.width;
	rect.size.height = textView.frame.size.height;
	self.view.frame = rect;
}

-(void)sendMail
{
    
}


@end
