//
//  ChapterData.h
//  Victrelis
//
//  Created by ykm dev on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageData.h"

@interface ChapterData : NSObject

@property(nonatomic,copy) NSString *color;
@property(nonatomic,copy) NSString *previewImage;
@property(nonatomic,retain) NSMutableArray *pages;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) int number;
@property(nonatomic,assign) BOOL hideFromNavigation;
@property(nonatomic,copy) NSString *pressedImage;

+(NSMutableArray*) loadData:(NSString*)pathChapters;

@end
