//
//  NewContactViewController.h
//  ContactViewerIos
//
//  Created by Adrian Wijasa on 3/12/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewContactViewController : UIViewController

@property (nonatomic, retain) UITextField* activeField;

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) IBOutlet UIControl *controlView;

@end
