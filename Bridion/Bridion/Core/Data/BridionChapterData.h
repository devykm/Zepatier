//
//  ChapterData.h
//  Victrelis
//
//  Created by ykm dev on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BridionPageData.h"

@interface BridionChapterData : NSObject {
    int number;
    NSString *name;
    NSMutableArray *pages;
    BOOL hideFromNavigation;
}

@property(nonatomic,retain) NSMutableArray *pages;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) int number;
@property(nonatomic,assign) BOOL hideFromNavigation;

+(NSMutableArray*) getPagesThumbnail:(int)chapterNumber;
+(NSMutableArray*) loadData:(NSString*)plist;
+(NSMutableArray*) loadPagesData:(NSString*)plist;
+(BridionChapterData*) getChapter:(NSMutableArray*)chaptersData forPageIndex:(int)pageIndex;

@end
