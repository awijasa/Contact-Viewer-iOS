//
//  NewContactViewController.h
//  ContactViewerIos
//
//  Created by Adrian Wijasa on 3/12/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactEntity.h"

@class DetailViewController;

@interface NewContactViewController : UIViewController

@property (nonatomic, retain) UITextField* activeField;

@property (nonatomic, retain) IBOutlet UITextField* nameTextField;

@property (nonatomic, retain) IBOutlet UITextField* titleTextField;

@property (nonatomic, retain) IBOutlet UITextField* phoneTextField;

@property (nonatomic, retain) IBOutlet UITextField* emailTextField;

@property (nonatomic, retain) IBOutlet UITextField* twitterIdTextField;

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) IBOutlet UIControl *controlView;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) ContactEntity *contact;

@property (strong, nonatomic) DetailViewController *detailViewController;

@property BOOL isEdit;

@end
