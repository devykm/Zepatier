//
//  ZepatierChapterData.m
//  Zepatier
//
//  Created by iOS Developer on 18/01/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import "ZepatierChapterData.h"
#import "ZepatierPageData.h"
@implementation ZepatierChapterData

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
                ZepatierPageData *page = [[ZepatierPageData alloc] initWithDictionary:data];
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
        ZepatierChapterData *chapter = [[ZepatierChapterData alloc] initWithDictionary:dic];
        chapter.number = i;
        [chaptersData addObject:chapter];
        for(int j=0; j<[chapter.pages count]; j++,pageIndex++) {
            ZepatierPageData *page = [chapter.pages objectAtIndex:j];
            page.number = pageIndex;
            page.chapter = chapter.number;
        }
    }
    return chaptersData;
}

+(NSMutableArray*) loadPagesData:(NSString*)plist
{
    NSMutableArray *chaptersData = [ZepatierChapterData loadData:plist];
    NSMutableArray *pagesData = [[NSMutableArray alloc] init];
    for (int i=0; i<[chaptersData count]; i++) {
        ZepatierChapterData *chapter = [chaptersData objectAtIndex:i];
        for(ZepatierPageData *page in chapter.pages) {
            [pagesData addObject:page];
        }
    }
    return pagesData;
}

+(ZepatierChapterData*) getChapter:(NSMutableArray*)chaptersData forPageIndex:(int)pageIndex
{
    for (int i=0; i<[chaptersData count]; i++) {
        ZepatierChapterData *chapter = [chaptersData objectAtIndex:i];
        for(ZepatierPageData *page in chapter.pages) {
            if(page.number == pageIndex) {
                return chapter;
            }
        }
    }
    return nil;
}

+(int) getChapterPageRealIndex:(int)chapterIndex pageIndex:(int)pageIndex
{
    int realIndex = 0;
    NSMutableArray *chaptersData = [ZepatierChapterData loadData:@"ZepatierChapters.plist"];
    for (int i=0; i<[chaptersData count]; i++) {
        ZepatierChapterData *chapter = [chaptersData objectAtIndex:i];
        for (int j=0; j<[chapter.pages count]; j++) {
            if(j == pageIndex && chapterIndex == i) {
                return realIndex;
            }
            realIndex++;
        }
    }
    return 0;
}


+(NSMutableArray*) getPagesThumbnail:(int)chapterNumber
{
    NSMutableArray *thumbnailArray = [[NSMutableArray alloc] init];
    NSMutableArray *chaptersArray = [ZepatierChapterData loadData:@"JanChapters.plist"];
    ZepatierChapterData *chapter = [chaptersArray objectAtIndex:chapterNumber];
    for (int i=0; i<[chapter.pages count]; i++) {
        ZepatierPageData *data = [chapter.pages objectAtIndex:i];
        if(!data.isLobi && !data.ignoreMenu) {//filter non pages
            [thumbnailArray addObject:data];
        }
    }
    return thumbnailArray;
}




@end
