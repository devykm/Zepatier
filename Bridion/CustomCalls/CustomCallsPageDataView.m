//
//  CustomCallsPageDataView.m
//  msdAllInOne
//
//  Created by iOS Developer on 10/25/15.
//
//

#import "CustomCallsPageDataView.h"

@implementation CustomCallsPageDataView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    [self initalizeSubviews];
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self == nil) return nil;
    [self initalizeSubviews];
    return self;
}

-(void)initalizeSubviews
{
    NSString *nibName = @"CustomCallsPageDataView";
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    [self addSubview:self.customCallView];
}



@end
