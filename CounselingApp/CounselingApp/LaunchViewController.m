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
    
    
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(showHomeScreen:)];
    [self.view addGestureRecognizer:singleFingerTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)testBtn:(id)sender {
    [_delegate call];
}

- (void)showHomeScreen:(id)sender {
    [_delegate showHomeScreen];
}
@end
