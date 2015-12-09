//
//  CustomCallCatalogViewController.h
//  msdAllInOne
//
//  Created by iOS Developer on 10/14/15.
//
//

#import <UIKit/UIKit.h>
#import "BasePageScrollTimer.h"
#import "GMMainMenuView.h"

@interface CustomCallCatalogViewController : BasePageScrollTimer<GMMainMenuViewDelegate,DataManagerDelegate>

@property(nonatomic,strong) NSMutableArray *btnArray;
@property(nonatomic,retain) DataManager *customCallManager;

@property(nonatomic,weak) id<GMHomeMenuDelegate> delegateB;
@property(nonatomic,weak) id<GMMainMenuViewDelegate> delegateMenu;
-(id) initWithFrame:(CGRect)frame pagesArray:(NSMutableArray*)pagesArray;
-(void) initItems:(NSMutableArray*)pagesArray;
-(void) animateBoxes;

@end


@interface GMUIcButtonMenu : UIButton

@property(nonatomic,assign) int chapter;
@property(nonatomic,assign) int page;

@end



