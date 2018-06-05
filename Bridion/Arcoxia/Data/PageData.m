//
//  PageData.m
//  Victrelis
//
//  Created by YKM Company on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageData.h"

@implementation PageData

-(id) initWithDictionary:(NSDictionary*) dictionary {
	if(self = [super init]) {
		self.previewImage = [dictionary objectForKey:@"previewImage"];
        self.className = [dictionary objectForKey:@"className"];
	}
	return self;
}



@end
