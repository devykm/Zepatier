//
//  ZostavaxPage1.h
//  Zostavax
//
//  Created by YKM Company on 8/25/13.
//  Copyright (c) 2013 YKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BridionBase.h"

@interface BridionPage1 : BridionBase

@property(nonatomic,strong) IBOutlet UIView *view;
@property(nonatomic,strong) IBOutlet UIImageView *graph;
@property(nonatomic,strong) IBOutlet UIImageView *graphOrange;

@property(nonatomic,strong) IBOutlet UIImageView *lineOrange;
@property(nonatomic,strong) IBOutlet UIImageView *lineGray;
@property(nonatomic,strong) IBOutlet UIImageView *circleLineOrange;
@property(nonatomic,strong) IBOutlet UIImageView *circleLineGray;

@property(nonatomic,strong) IBOutlet UIImageView *circleOrange;
@property(nonatomic,strong) IBOutlet UIImageView *circleGray;

@end
