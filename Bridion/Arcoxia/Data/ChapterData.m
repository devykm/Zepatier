//
//  ChapterData.m
//  Victrelis
//
//  Created by ykm dev on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChapterData.h"

@implementation ChapterData

-(id) initWithDictionary:(NSDictionary*) dictionary {
	if(self = [super init]) {
        self.hideFromNavigation = [[dictionary objectForKey:@"hideFromNavigation"] boolValue];
		self.name = [dictionary objectForKey:@"name"];
        self.number = [[dictionary objectForKey:@"name"] intValue];
        self.pages = [[NSMutableArray alloc] init];
        self.previewImage = [dictionary objectForKey:@"previewImage"];
        self.color = [dictionary objectForKey:@"color"];
        self.pressedImage = [dictionary objectForKey:@"pressedImage"];
		NSDictionary *pagesDic = [dictionary objectForKey:@"pages"];
        if(((NSNull*)pagesDic) != [NSNull null]) {
            for (NSDictionary *data in pagesDic) {
                PageData *page = [[PageData alloc] initWithDictionary:data];
                [self.pages addObject:page];

            }
        }

	}
	return self;
}



+(NSMutableArray*) loadData:(NSString*)pathChapters
{
    NSMutableArray *chaptersData = [[NSMutableArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:pathChapters ofType:nil];
    NSMutableArray * dataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    for (int i=0; i<[dataArray count]; i++) {
        NSDictionary *dic = [dataArray objectAtIndex:i];
        ChapterData *chapter = [[ChapterData alloc] initWithDictionary:dic];
        chapter.number = i;
        [chaptersData addObject:chapter];
    }
    return chaptersData;
}

@end
