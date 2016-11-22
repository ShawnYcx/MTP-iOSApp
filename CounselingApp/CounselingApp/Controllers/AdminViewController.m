//
//  AdminViewController.m
//  CounselingApp
//
//  Created by shawn yap on 11/20/16.
//  Copyright © 2016 ACU. All rights reserved.
//

#import "AdminViewController.h"
#import "AdminCell.h"

@interface AdminViewController (){
    AppDelegate *_delgeate;
}
@end

@implementation AdminViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submit:(id)sender {
    Authentication *checker = [[Authentication alloc] init];
    NSLog(@"Logged in");
    NSString* userID = self.userName.text;
    NSString* userPass = self.passWord.text;
    BOOL S = [checker checkPasswordwithID:userID pass:userPass];
    if ([checker checkPasswordwithID:userID pass:userPass]){
        NSLog(@"Logged in");
    }
        // Alert user logged in
//    else
//            Pop Some alert
}
@end
