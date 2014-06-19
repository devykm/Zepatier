//
//  JanuviaPageData.h
//  msdAllInOne
//
//  Created by ykm dev on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoxafilPageData : NSObject

@property(nonatomic, retain) NSString *className;
@property(nonatomic, retain) NSString *previewImage;
@property(nonatomic, assign) int chapter;
@property(nonatomic, assign) BOOL isLobi;
@property(nonatomic, assign) int pageNumber;
@property(nonatomic, assign) int number;
@property(nonatomic, assign) BOOL ignoreMenu;

-(id) initWithDictionary:(NSDictionary*) dictionary;

@end
