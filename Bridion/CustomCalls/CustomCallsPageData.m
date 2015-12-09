//
//  CustomCallsPageData.m
//  msdAllInOne
//
//  Created by iOS Developer on 10/19/15.
//
//

#import "CustomCallsPageData.h"

@implementation CustomCallsPageData

-(id) initWithDictionary:(NSDictionary*) dictionary
{
    if(self = [super init]) {
        self.hideTopMenu = [[dictionary objectForKey:@"hideTopMenu"] boolValue];
        self.headerJanuviaLogo = [[dictionary objectForKey:@"headerJanuviaLogo"] boolValue];
        self.headerJanuetLogo = [[dictionary objectForKey:@"headerJanuetLogo"] boolValue];
        self.headerAllLogo = [[dictionary objectForKey:@"headerAllLogo"] boolValue];
        self.isLobi = [[dictionary objectForKey:@"isLobi"] boolValue];
        self.chapter = [[dictionary objectForKey:@"chapter"] intValue];
        self.ignoreMenu = [[dictionary objectForKey:@"ignoreMenu"] boolValue];
        self.previewImage = [dictionary objectForKey:@"previewImage"];
        self.className = [dictionary objectForKey:@"className"];
        self.title = [dictionary objectForKey:@"title"];
        self.synopsis = [dictionary objectForKey:@"synopsis"];
        self.materialID = [[dictionary objectForKey:@"materialID"] intValue];
        self.prodId = [[dictionary objectForKey:@"prodId"]intValue];
        self.slideTypeId = [[dictionary objectForKey:@"slideTypeId"]intValue];
        self.materialSection = [[dictionary objectForKey:@"materialSection"]intValue];
    }
    return self;
}


@end
