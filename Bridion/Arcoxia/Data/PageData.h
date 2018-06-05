//
//  PageData.h
//  Victrelis
//
//  Created by YKM Company on 4/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageData : NSObject

@property(nonatomic,copy) NSString *className;
@property(nonatomic,copy) NSString *previewImage;

-(id) initWithDictionary:(NSDictionary*) dictionary;

@end
