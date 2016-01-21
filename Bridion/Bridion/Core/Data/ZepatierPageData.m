//
//  ZepatierPageData.m
//  Zepatier
//
//  Created by iOS Developer on 18/01/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierPageData.h"

@implementation ZepatierPageData

@synthesize pageNumber,
chapter,
isLobi,
previewImage,
ignoreMenu,
className,
number;

-(id) initWithDictionary:(NSDictionary*) dictionary
{
    if(self = [super init]) {
        self.isLobi = [[dictionary objectForKey:@"isLobi"] boolValue];
        self.chapter = [[dictionary objectForKey:@"chapter"] intValue];
        self.ignoreMenu = [[dictionary objectForKey:@"ignoreMenu"] boolValue];
        self.previewImage = [dictionary objectForKey:@"previewImage"];
        self.className = [dictionary objectForKey:@"className"];
    }
    return self;
}



@end
