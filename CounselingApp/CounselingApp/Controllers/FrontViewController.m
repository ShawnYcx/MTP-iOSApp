//
//  FrontViewController.m
//  CounselingApp
//
//  Created by shawn yap on 9/29/16.
//  Copyright © 2016 ACU. All rights reserved.
//

#import "FrontViewController.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"

@interface FrontViewController (){
    AppDelegate *_delegate;
}

@end

@implementation FrontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"Main Menu", nil);
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self initBtnCorners];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callEmergency:(id)sender {
    [_delegate call];
}

-(void)initBtnCorners{
    for (int i = 1; i <= 3; i++) {
        [self.btnContainer1.layer setCornerRadius:8.0f];
        [self.btnContainer2.layer setCornerRadius:8.0f];
        [self.btnContainer3.layer setCornerRadius:8.0f];
        
        [self.btnContainer1.layer setMasksToBounds:YES];
        [self.btnContainer2.layer setMasksToBounds:YES];
        [self.btnContainer3.layer setMasksToBounds:YES];
    }
}
@end
