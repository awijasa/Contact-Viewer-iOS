//
//  NewContactViewController.m
//  ContactViewerIos
//
//  Created by Adrian Wijasa on 3/12/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "NewContactViewController.h"
#import "AppDelegate.h"
#import "ContactEntity.h"
#import "DetailViewController.h"

@implementation NewContactViewController

@synthesize scrollView;
@synthesize activeField;
@synthesize nameTextField;
@synthesize titleTextField;
@synthesize phoneTextField;
@synthesize emailTextField;
@synthesize twitterIdTextField;
@synthesize controlView;
@synthesize managedObjectContext;
@synthesize detailViewController;
@synthesize contact = _contact;
@synthesize isEdit;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)addContactEntity {

    // Create and configure a new instance of the Contact entity.
    if (managedObjectContext == nil) 
    { 
        managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    }
    
    _contact = (ContactEntity *)[NSEntityDescription insertNewObjectForEntityForName:@"ContactEntity" inManagedObjectContext:managedObjectContext];
    
    [_contact setName: [nameTextField text]];
    [_contact setTitle: [titleTextField text]];
    [_contact setPhone: [phoneTextField text]];
    [_contact setEmail: [emailTextField text]];
    [_contact setTwitterId: [twitterIdTextField text]];
    
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        // Handle the error.
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"NewContactToDetail"])
    {
        // Get reference to the destination view controller
        detailViewController = [segue destinationViewController];
    }
    if(isEdit!=true)
    {
        [self addContactEntity];
    }
    else {
        [self editContactEntity];
    }
    self.detailViewController.detailItem = _contact;
}

-(void) editContactEntity
{
    // Create and configure a new instance of the Contact entity.
    if (managedObjectContext == nil) 
    { 
        managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    }
    
    [_contact setName: [nameTextField text]];
    [_contact setTitle: [titleTextField text]];
    [_contact setPhone: [phoneTextField text]];
    [_contact setEmail: [emailTextField text]];
    [_contact setTwitterId: [twitterIdTextField text]];
    
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        // Handle the error.
    }
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, aRect.size.height - activeField.frame.size.height);
        [scrollView setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}
- (IBAction)textFieldDidBeginEditing:(id)sender {
    activeField = sender;
}

- (IBAction)textFieldDIdEndEditing:(id)sender {
    activeField = nil;
}

- (IBAction)tapOnScreen:(id)sender {
    [activeField resignFirstResponder];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    if(self.contact!=nil)
    {
        self.nameTextField.text = self.contact.name;
        self.titleTextField.text = [NSString stringWithFormat: @"%@ ", self.contact.title];
        self.phoneTextField.text = self.contact.phone;
        self.emailTextField.text = self.contact.email;
        self.twitterIdTextField.text = self.contact.twitterId;
    }
    [self registerForKeyboardNotifications];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
