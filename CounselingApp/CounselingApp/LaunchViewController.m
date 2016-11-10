//
//  LaunchViewController.m
//  CounselingApp
//
//  Created by shawn yap on 11/9/16.
//  Copyright © 2016 ACU. All rights reserved.
//

#import "LaunchViewController.h"
#import "AppDelegate.h"

@interface LaunchViewController (){
    AppDelegate *_delegate;
}
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(showHomeScreen:)];
    [self.view addGestureRecognizer:singleFingerTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)EmergencyCall:(id)sender {
    [_delegate call];
}

- (void)showHomeScreen:(id)sender {
    [_delegate showHomeScreen];
}
@end
