//
//  ZostavaxPage1.h
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BridionBase.h"
#import "KAProgressLabel.h"

@interface BridionPage3 : BridionBase

@property(nonatomic,strong) IBOutlet UIView *view;

@property(nonatomic,strong) IBOutlet UIView *containerModerate;
@property(nonatomic,strong) IBOutlet UIView *containerDeep;
@property(nonatomic,strong) IBOutlet UIButton *btnModerate;
@property(nonatomic,strong) IBOutlet UIButton *btnDeep;
@property(nonatomic,strong) IBOutlet UIButton *btnModerateTime;
@property(nonatomic,strong) IBOutlet UIButton *btnDeepTime;

@property(nonatomic,strong) IBOutlet UIImageView *deep2_7;
@property(nonatomic,strong) IBOutlet UIImageView *moderate1_4;

@property(nonatomic,strong) IBOutlet UILabel *lblModerateTime;
@property(nonatomic,strong) IBOutlet UILabel *lblDeepTime;

@property(nonatomic,strong) IBOutlet UIImageView *moderateText1;
@property(nonatomic,strong) IBOutlet UIImageView *moderateText2;
@property(nonatomic,strong) IBOutlet UIImageView *moderateText3;
@property(nonatomic,strong) IBOutlet UIImageView *deepText1;
@property(nonatomic,strong) IBOutlet UIImageView *deepText2;
@property(nonatomic,strong) IBOutlet UIImageView *deepText3;

@property (weak,nonatomic) IBOutlet KAProgressLabel *moderateCircleFast;
@property (weak,nonatomic) IBOutlet KAProgressLabel *moderateCircle;

@property (weak,nonatomic) IBOutlet KAProgressLabel *deepCircleFast;
@property (weak,nonatomic) IBOutlet KAProgressLabel *deepCircle;

@end
