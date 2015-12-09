//
//  CustomCallsChapterData.h
//  msdAllInOne
//
//  Created by iOS Developer on 10/19/15.
//
//

#import <Foundation/Foundation.h>

@interface CustomCallsChapterData : NSObject

@property(nonatomic,retain) NSMutableArray *pages;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) int ID;
//@property(nonatomic,assign) BOOL hideFromNavigation;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *synopsis;
@property(nonatomic, retain) NSString *thumb;
@property(nonatomic,assign) int chapterId;

+(NSMutableArray*) getPagesThumbnail:(int)chapterNumber;
+(NSMutableArray*) loadData:(NSString*)plist;
+(NSMutableArray*) loadPagesData:(NSString*)plist;
+(CustomCallsChapterData*) getChapter:(NSMutableArray*)chaptersData forPageIndex:(int)pageIndex;
+(NSMutableArray*) loadCustomCallData:(NSString*)plist;
+(NSMutableArray*) loadCustomCallPagesData:(NSString*)plist;



@end
