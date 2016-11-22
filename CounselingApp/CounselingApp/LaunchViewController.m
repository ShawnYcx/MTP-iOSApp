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
    NSMutableDictionary *_dict;
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

    NSString *path = [_delegate openPath];
    _dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    NSUInteger randIndex = arc4random_uniform(5);
    self.verseLabel.text = [_dict objectForKey:@"Verses"][randIndex];
    
}

- (IBAction)EmergencyCall:(id)sender {
    [_delegate call];
}

- (void)showHomeScreen:(id)sender {
    [_delegate showHomeScreen];
}
@end
