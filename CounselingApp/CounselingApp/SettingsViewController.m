//
//  SettingsViewController.m
//  CounselingApp
//
//  Created by shawn yap on 11/9/16.
//  Copyright © 2016 ACU. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#import "AdminCell.h"

@interface SettingsViewController ()
{
    NSArray *_settingsItems;
}
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Cells setup
    static NSString *simpleTableIdentifier = @"cell";
    AdminCell *cell = (AdminCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (indexPath.section == 0){
        if (indexPath.row == 0){
            cell.Label.text = @"About Us";
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0){
            cell.Label.text = @"Admin Login";
            
        }
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"Know more about us", @"");
            break;
        case 1:
            sectionName = NSLocalizedString(@"Login for admin priviledges", @"");
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = nil;
    
    if (indexPath.section == 0){
        if (indexPath.row == 0){
            viewController = [storyboard instantiateViewControllerWithIdentifier:@"AboutUs"];
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0){
            viewController = [storyboard instantiateViewControllerWithIdentifier:@"AdminViewController"];
        }
    }
    
    [[self navigationController] pushViewController:viewController animated:YES];
    
}

#pragma mark - Navigation
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}
*/
@end
