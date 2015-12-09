//
//  CustomCallsChapterData.m
//  msdAllInOne
//
//  Created by iOS Developer on 10/19/15.
//
//

#import "CustomCallsChapterData.h"
#import "CustomCallsPageData.h"
@implementation CustomCallsChapterData

-(id) initWithDictionary:(NSDictionary*) dictionary
{
    if(self = [super init]) {
        self.chapterId = [[dictionary objectForKey:@"chapterId"]intValue];
        //self.hideFromNavigation = [[dictionary objectForKey:@"hideFromNavigation"] boolValue];
        self.title = [dictionary objectForKey:@"title"];
        self.ID = [[dictionary objectForKey:@"id"] intValue];
        self.synopsis =[dictionary objectForKey:@"synopsis"];
        self.thumb = [dictionary objectForKey:@"thumb"];
        self.pages = [[NSMutableArray alloc] init];
        NSDictionary *pagesDic = [dictionary objectForKey:@"Materials"];
        if(((NSNull*)pagesDic) != [NSNull null]) {
            for (NSDictionary *data in pagesDic) {
                CustomCallsPageData *page = [[CustomCallsPageData alloc] initWithDictionary:data];
                [self.pages addObject:page];
                
            }
        }
    }
    return self;
}

+(NSMutableArray*) loadCustomCallData:(NSString*)plist
{
    if (TARGET_IPHONE_SIMULATOR){
        
        NSMutableArray *chaptersData = [[NSMutableArray alloc] init];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"customCallList.plist" ofType:nil];
        NSMutableArray * dataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        int pageIndex = 0;
        for (int i=0; i<[dataArray count]; i++) {
            NSDictionary *dic = [dataArray objectAtIndex:i];
            CustomCallsChapterData *chapter = [[CustomCallsChapterData alloc] initWithDictionary:dic];
            //chapter.chapterId = i;
            [chaptersData addObject:chapter];
            for(int j=0; j<[chapter.pages count]; j++,pageIndex++) {
                CustomCallsPageData *page = [chapter.pages objectAtIndex:j];
                page.number = pageIndex;
                page.chapter = chapter.chapterId;
            }
        }
        return chaptersData;


    }else{
    NSMutableArray *chaptersData = [[NSMutableArray alloc] init];
    NSString *path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"msdCustom"];
    path = [path stringByAppendingPathComponent:@"customCallList.plist"];
        
        NSString *filePath = path; //[[NSBundle mainBundle] pathForResource:plist ofType:nil];
        NSMutableArray * dataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        int pageIndex = 0;
        for (int i=0; i<[dataArray count]; i++) {
            NSDictionary *dic = [dataArray objectAtIndex:i];
            CustomCallsChapterData *chapter = [[CustomCallsChapterData alloc] initWithDictionary:dic];
            //chapter.chapterId = i;
            [chaptersData addObject:chapter];
            for(int j=0; j<[chapter.pages count]; j++,pageIndex++) {
                CustomCallsPageData *page = [chapter.pages objectAtIndex:j];
                page.number = pageIndex;
                page.chapter = chapter.chapterId;

    }

    
           }
        return chaptersData;

    }

}

+(NSMutableArray*) loadCustomCallPagesData:(NSString*)plist
{
    NSMutableArray *chaptersData = [CustomCallsChapterData loadCustomCallData:plist];
    NSMutableArray *pagesData = [[NSMutableArray alloc] init];
    for (int i=0; i<[chaptersData count]; i++) {
        CustomCallsChapterData *chapter = [chaptersData objectAtIndex:i];
        for(CustomCallsPageData *page in chapter.pages) {
            [pagesData addObject:page];
        }
    }
    
    return pagesData;
}


+(NSMutableArray*) loadData:(NSString*)plist
{
    NSMutableArray *chaptersData = [[NSMutableArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:plist ofType:nil];
    NSMutableArray * dataArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    int pageIndex = 0;
    for (int i=0; i<[dataArray count]; i++) {
        NSDictionary *dic = [dataArray objectAtIndex:i];
        CustomCallsChapterData *chapter = [[CustomCallsChapterData alloc] initWithDictionary:dic];
        chapter.chapterId = i;
        [chaptersData addObject:chapter];
        for(int j=0; j<[chapter.pages count]; j++,pageIndex++) {
            CustomCallsPageData *page = [chapter.pages objectAtIndex:j];
            page.number = pageIndex;
            page.chapter = chapter.chapterId;
        }
        
        
    }
    
    return chaptersData;
}

+(NSMutableArray*) loadPagesData:(NSString*)plist
{
    NSMutableArray *chaptersData = [CustomCallsChapterData loadData:plist];
    NSMutableArray *pagesData = [[NSMutableArray alloc] init];
    for (int i=0; i<[chaptersData count]; i++) {
        CustomCallsChapterData *chapter = [chaptersData objectAtIndex:i];
        for(CustomCallsPageData *page in chapter.pages) {
            [pagesData addObject:page];
        }
    }
    return pagesData;
}

+(CustomCallsChapterData*) getChapter:(NSMutableArray*)chaptersData forPageIndex:(int)pageIndex
{
    for (int i=0; i<[chaptersData count]; i++) {
        CustomCallsChapterData *chapter = [chaptersData objectAtIndex:i];
        for(CustomCallsPageData *page in chapter.pages) {
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
    NSMutableArray *chaptersArray = [CustomCallsChapterData loadData:@"JanChapters.plist"];
    CustomCallsChapterData *chapter = [chaptersArray objectAtIndex:chapterNumber];
    /*for (int i=6; i<10; i++) {
     JanuviaPageData *data = [chapter.pages objectAtIndex:i];
     //if(!data.isLobi && !data.ignoreMenu) {//filter non pages
     [thumbnailArray addObject:data];
     //}
     }*/
    
    CustomCallsPageData *data = [chapter.pages objectAtIndex:6];
    [thumbnailArray addObject:data];
    data = [chapter.pages objectAtIndex:7];
    [thumbnailArray addObject:data];
    data = [chapter.pages objectAtIndex:11];
    [thumbnailArray addObject:data];
    data = [chapter.pages objectAtIndex:13];
    [thumbnailArray addObject:data];
    
    return thumbnailArray;
}




@end
