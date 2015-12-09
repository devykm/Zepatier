//
//  GMCustomChapterData.h
//  msdAllInOne
//
//  Created by iOS Developer on 10/20/15.
//
//

#import <Foundation/Foundation.h>

@interface GMCustomChapterData : NSObject

@property(nonatomic,copy) NSString *previewImage;
@property(nonatomic,assign) int number;
@property(nonatomic,assign) int chapter;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *synopsis;
@property(nonatomic,retain) NSMutableArray *pages;
@property(nonatomic,assign) int ChapterID;


@end
