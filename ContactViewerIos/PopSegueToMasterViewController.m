//
//  PopSegue.m
//  ContactViewerIos
//
//  Created by Adrian Wijasa on 3/13/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "PopSegueToMasterViewController.h"

@implementation PopSegueToMasterViewController

- (void) perform {
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    [UIView transitionWithView:src.navigationController.view duration:0.5
                       options:UIViewAnimationOptionTransitionNone
                    animations:^{
                        [src.navigationController popToViewController: [[[src navigationController] viewControllers] objectAtIndex:1] animated:YES];
                    }
                    completion:NULL];
}

@end
