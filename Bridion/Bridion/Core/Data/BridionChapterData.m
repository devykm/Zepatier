//
//  ChapterData.m
//  Victrelis
//
//  Created by ykm dev on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BridionChapterData.h"

@implementation BridionChapterData

@synthesize name,number,pages,hideFromNavigation;

-(id) initWithDictionary:(NSDictionary*) dictionary
{
	if(self = [super init]) {
        self.hideFromNavigation = [[dictionary objectForKey:@"hideFromNavigation"] boolValue];
		self.name = [dictionary objectForKey:@"name"];
        self.number = [[dictionary objectForKey:@"name"] intValue];
        self.pages = [[NSMutableArray alloc] init];
		NSDictionary *pagesDic = [dictionary objectForKey:@"pages"];
        if(((NSNull*)pagesDic) != [NSNull null]) {
            for (NSDictionary *data in pagesDic) {
                BridionPageData *page = [[BridionPageData alloc] initWithDictionary:data];
                [self.pages addObject:page];
            }
        }
	}
	return self;
}

+(NSMutableArray*) loadData:(NSString*)plist
{
    NSMutableArray *chaptersData = [[NSMutableArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:plist ofType:nil];
    NSMutableArray * dataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    int pageIndex = 0;
    for (int i=0; i<[dataArray count]; i++) {
        NSDictionary *dic = [dataArray objectAtIndex:i];
        BridionChapterData *chapter = [[BridionChapterData alloc] initWithDictionary:dic];
        chapter.number = i;
        [chaptersData addObject:chapter];
        for(int j=0; j<[chapter.pages count]; j++,pageIndex++) {
            BridionPageData *page = [chapter.pages objectAtIndex:j];
            page.number = pageIndex;
            page.chapter = chapter.number;
        }
    }
    return chaptersData;
}

+(NSMutableArray*) loadPagesData:(NSString*)plist
{
    NSMutableArray *chaptersData = [BridionChapterData loadData:plist];
    NSMutableArray *pagesData = [[NSMutableArray alloc] init];
    for (int i=0; i<[chaptersData count]; i++) {
        BridionChapterData *chapter = [chaptersData objectAtIndex:i];
        for(BridionPageData *page in chapter.pages) {
            [pagesData addObject:page];
        }
    }
    return pagesData;
}

+(BridionChapterData*) getChapter:(NSMutableArray*)chaptersData forPageIndex:(int)pageIndex
{
    for (int i=0; i<[chaptersData count]; i++) {
        BridionChapterData *chapter = [chaptersData objectAtIndex:i];
        for(BridionPageData *page in chapter.pages) {
            if(page.number == pageIndex) {
                return chapter;
            }
        }
    }
    return nil;
}

+(NSMutableArray*) getPagesThumbnail:(int)chapterNumber
{
	NSMutableArray *thumbnailArray = [[NSMutableArray alloc] init];
	NSMutableArray *chaptersArray = [BridionChapterData loadData:@"JanChapters.plist"];
    BridionChapterData *chapter = [chaptersArray objectAtIndex:chapterNumber];
	for (int i=0; i<[chapter.pages count]; i++) {
		BridionPageData *data = [chapter.pages objectAtIndex:i];
		if(!data.isLobi && !data.ignoreMenu) {//filter non pages
			[thumbnailArray addObject:data];
		}
	}
	return thumbnailArray;
}


@end
