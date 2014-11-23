//
//  ProgressViewController.h
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircleProgressView;

@interface ProgressViewController : UIViewController

@property (strong, nonatomic) IBOutlet CircleProgressView *circleProgressView;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;


@end
