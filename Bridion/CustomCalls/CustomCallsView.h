//
//  CustomCallsView.h
//  msdAllInOne
//
//  Created by iOS Developer on 10/14/15.
//
//

#import <UIKit/UIKit.h>

@interface CustomCallsView : UIView


@property (strong, nonatomic) IBOutlet UIView *customCallView;
    
@property (weak, nonatomic) IBOutlet UIButton *menuOpenerButton;

@property (weak, nonatomic) IBOutlet UIImageView *CustomCallImageView;

@property (weak, nonatomic) IBOutlet UILabel *CustomCallChapterName;

@property (weak, nonatomic) IBOutlet UILabel *CustomCallChapterDescription;

@property(nonatomic,assign) int chapterID;

@property(nonatomic,assign) int chapter;
@property(nonatomic,assign) int page;
@property(nonatomic,retain) NSMutableArray *pages;


@end
