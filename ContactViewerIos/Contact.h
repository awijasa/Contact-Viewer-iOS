//
//  Contact.h
//  ContactViewerIos
//
//  Created by ANDY SELVIG on 3/7/12.
//  Copyright (c) 2012 Tiny Mission. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property(retain) NSString* name;
@property(retain) NSString* phone;
@property(retain) NSString* title;
@property(retain) NSString* email;
@property(retain) NSString* twitterId;


-(id)initWithName:(NSString*)name 
        andPhone:(NSString*)phone
        andTitle:(NSString*)title 
        andEmail:(NSString*)email
        andTwitterId:(NSString*)twitterId;

@end
