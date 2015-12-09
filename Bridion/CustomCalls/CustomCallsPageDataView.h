//
//  CustomCallsPageDataView.h
//  msdAllInOne
//
//  Created by iOS Developer on 10/25/15.
//
//

#import <UIKit/UIKit.h>

@interface CustomCallsPageDataView : UIView

@property (strong, nonatomic) IBOutlet UIView *customCallView;

@property (weak, nonatomic) IBOutlet UIImageView *CustomCallImageView;

@property (weak, nonatomic) IBOutlet UITextView *customTextView;


@property (weak, nonatomic) IBOutlet UILabel *CustomCallpageDescription;


@property(nonatomic,assign) int chapter;
@property(nonatomic,assign) int page;
@property(nonatomic,retain) NSMutableArray *pages;

@end
