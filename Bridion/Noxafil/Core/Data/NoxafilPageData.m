//
//  JanuviaPageData.m
//  msdAllInOne
//
//  Created by ykm dev on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NoxafilPageData.h"

@implementation NoxafilPageData

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
