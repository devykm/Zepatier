//
//  ZepatierChapterData.h
//  Zepatier
//
//  Created by iOS Developer on 18/01/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZepatierChapterData : NSObject{
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
+(ZepatierChapterData*) getChapter:(NSMutableArray*)chaptersData forPageIndex:(int)pageIndex;
+(int) getChapterPageRealIndex:(int)chapterIndex pageIndex:(int)pageIndex;



@end
