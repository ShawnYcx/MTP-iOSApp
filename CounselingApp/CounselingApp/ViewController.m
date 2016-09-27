//
//  ViewController.m
//  CounselingApp
//
//  Created by shawn yap on 9/23/16.
//  Copyright © 2016 ACU. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "MSDynamicsDrawerViewController.h"

@interface ViewController ()
{
    MSDynamicsDrawerViewController *Drawer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Open"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(openDrawer)];
    self.navigationItem.leftBarButtonItem = leftButton;
//    TableViewController *tableView;
    UIViewController *paneViewController = [[UIViewController alloc]init];
    Drawer.paneViewController = paneViewController;
    UIViewController *drawerViewController = [[UIViewController alloc]init];
    
    
    [Drawer setDrawerViewController:drawerViewController forDirection:MSDynamicsDrawerDirectionRight];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openDrawer {
   Drawer.paneState = MSDynamicsDrawerPaneStateOpen;
}

@end
