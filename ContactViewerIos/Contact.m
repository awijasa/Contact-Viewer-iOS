//
//  Contact.m
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize name, title, email, phone, twitterId;

-(id)initWithName:(NSString*)newName 
        andPhone:(NSString*)newPhone
        andTitle:(NSString*)newTitle 
        andEmail:(NSString*)newEmail
        andTwitterId:(NSString*)newTwitterId {
    
    self = [super init];
    
    self.name = newName;
    self.phone = newPhone;
    self.title = newTitle;
    self.email = newEmail;
    self.twitterId = newTwitterId;
    
    return self;
}

@end
