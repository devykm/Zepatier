//
//  CustomCallsPageData.h
//  msdAllInOne
//
//  Created by iOS Developer on 10/19/15.
//
//

#import <Foundation/Foundation.h>

@interface CustomCallsPageData : NSObject

@property(nonatomic, retain) NSString *className;
@property(nonatomic, retain) NSString *previewImage;
@property(nonatomic, assign) int chapter;
@property(nonatomic, assign) BOOL isLobi;
@property(nonatomic, assign) int pageNumber;
@property(nonatomic, assign) int number;
@property(nonatomic, assign) int materialSection;
@property(nonatomic, assign) int materialID;
@property(nonatomic, assign) int prodId;
@property(nonatomic, assign) int slideTypeId;
@property(nonatomic,retain) NSMutableArray *pages;


@property(nonatomic, assign) BOOL ignoreMenu;
@property(nonatomic, assign) BOOL hideTopMenu;
@property(nonatomic, assign) BOOL headerJanuviaLogo;
@property(nonatomic, assign) BOOL headerJanuetLogo;
@property(nonatomic, assign) BOOL headerAllLogo;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *synopsis;
@property(nonatomic, strong)NSString*mediaType;
@property(nonatomic, strong)NSString*mediaUrl;
-(id) initWithDictionary:(NSDictionary*) dictionary;

@end
