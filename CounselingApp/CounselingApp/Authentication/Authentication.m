//
//  Authentication.m
//  CounselingApp
//
//  Created by shawn yap on 11/15/16.
//  Copyright © 2016 ACU. All rights reserved.
//

#import "Authentication.h"

@implementation Authentication
/*
    This function checks if the user has logged in before
    if YES then admin functionalities are enabled at application start
    if No then prompts for credentials
*/
-(id)init {
    self = [super init];

    return self;
}

-(BOOL)checkLogin{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Test.plist"];

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    if (!([[dict objectForKey:@"Login"]objectForKey:@"Admin"][0]))
        return NO;
    return YES;
}
/*
    This function authenticates user for admin log in
*/
-(BOOL)checkPasswordwithID:(NSString*)user pass:(NSString*)Password{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Test.plist"];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    NSString *u_id = [[dict objectForKey:@"Login"] objectForKey:@"Admin"][1];
    NSString *u_pass = [[dict objectForKey:@"Login"] objectForKey:@"Admin"][2];
    
    if ((u_id == user) && (u_pass == Password)){
        // Set value to 1 because user logged in
        NSLog(@"Logged in");
        [[dict objectForKey:@"Login"] objectForKey:@"Admin"][0] = @"1";
        return YES;
    }
    else
        return NO;
    
}

@end
