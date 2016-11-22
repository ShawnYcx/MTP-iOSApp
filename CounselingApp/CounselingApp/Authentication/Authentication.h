//
//  Authentication.h
//  CounselingApp
//
//  Created by shawn yap on 11/15/16.
//  Copyright © 2016 ACU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Authentication : NSObject

-(BOOL)checkLogin;
-(BOOL)checkPasswordwithID:(NSString*)user pass:(NSString*)Password;

@end
