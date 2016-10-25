//
//  ResourcesViewController.m
//  CounselingApp
//
//  Created by shawn yap on 10/20/16.
//  Copyright © 2016 ACU. All rights reserved.
//

#import "ResourcesViewController.h"
#import "SWRevealViewController.h"

@interface ResourcesViewController ()

@end

@implementation ResourcesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Resource", nil);
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    self.pageTitle.text = [dict objectForKey:@"Title"][2];
    self.thumbImg.image = [UIImage imageNamed:[dict objectForKey:@"Thumbnail"][2]];
    self.contentLabel.text = [dict objectForKey:@"Content"][2];
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

@end
