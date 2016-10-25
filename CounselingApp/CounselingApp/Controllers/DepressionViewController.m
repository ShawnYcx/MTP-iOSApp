//
//  DepressionViewController.m
//  CounselingApp
//
//  Created by shawn yap on 10/20/16.
//  Copyright © 2016 ACU. All rights reserved.
//

#import "DepressionViewController.h"
#import "SWRevealViewController.h"
#import "EditViewController.h"

@interface DepressionViewController (){
    NSArray *_paths;
    NSString *_documentsDirectory;
    NSString *_path;
}

@end

@implementation DepressionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Depression", nil);
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    _paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _documentsDirectory = [_paths objectAtIndex:0];
    _path = [_documentsDirectory stringByAppendingPathComponent:@"Test.plist"];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:_path];
    
    self.pageTitle.text = [dict objectForKey:@"Title"][1];
    self.thumbImg.image = [UIImage imageNamed:[dict objectForKey:@"Thumbnail"][1]];
    self.contentLabel.text = [dict objectForKey:@"Content"][1];
}

-(void)viewDidAppear:(BOOL)animated{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:_path];
    // Load the file content and read the data into arrays
    
    self.pageTitle.text = [dict objectForKey:@"Title"][1];
    self.thumbImg.image = [UIImage imageNamed:[dict objectForKey:@"Thumbnail"][1]];
    self.contentLabel.text = [dict objectForKey:@"Content"][1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     EditViewController *destViewController = segue.destinationViewController;
     destViewController.content = self.contentLabel.text;
     destViewController.toEdit = 1;
 }

@end
