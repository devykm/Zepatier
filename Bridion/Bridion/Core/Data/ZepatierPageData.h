//
//  ZepatierPageData.h
//  Zepatier
//
//  Created by iOS Developer on 18/01/2016.
//  Copyright © 2016 YKM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZepatierPageData : NSObject
{
int pageNumber;
int chapter;
BOOL isLobi;
BOOL ignoreMenu;
NSString *previewImage;
NSString *className;
int number;
}

@property(nonatomic, retain) NSString *className;
@property(nonatomic, retain) NSString *previewImage;
@property(nonatomic, assign) int chapter;
@property(nonatomic, assign) BOOL isLobi;
@property(nonatomic, assign) int pageNumber;
@property(nonatomic, assign) int number;
@property(nonatomic, assign) BOOL ignoreMenu;

-(id) initWithDictionary:(NSDictionary*) dictionary;



@end
