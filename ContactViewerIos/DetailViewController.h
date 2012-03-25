//
//  DetailViewController.h
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactEntity.h"
#import "NewContactViewController.h"
@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) ContactEntity* detailItem;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UITextField *cellTextField;

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;

@property (strong, nonatomic) IBOutlet UITextField *twitterIDTextField;

@property (nonatomic,retain) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@property (strong, nonatomic) NewContactViewController *editContactViewController;

//@property (nonatomic, retain) UIStoryboard *storyBoard;

- (void)configureView;

@end
