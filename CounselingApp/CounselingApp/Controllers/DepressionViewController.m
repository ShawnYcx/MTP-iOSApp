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
#import "AppDelegate.h"

@interface DepressionViewController (){
    NSMutableDictionary *_dict;
    AppDelegate *_delegate;
}
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

@end

@implementation DepressionViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.title = NSLocalizedString(@"Depression", nil);
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    NSString *path = [_delegate openPath];
    _dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    self.pageTitle.text = [_dict objectForKey:@"Title"][1];
    self.thumbImg.image = [UIImage imageNamed:[_dict objectForKey:@"Thumbnail"][1]];
    self.thumbImg.layer.cornerRadius = 8.0;
    self.thumbImg.layer.masksToBounds = YES;
    
    NSAttributedString *x = [self boldString:[_dict objectForKey:@"Content"][1]];
    self.contentLabel.attributedText = x;
    CGRect newFrame = self.contentLabel.frame;
    CGRect updateFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + newFrame.size.height - 284.5); // 284.5 is the original height of the label
    
    self.contentView.frame = updateFrame;
    self.ScrollView.frame = updateFrame;
    self.ScrollView.contentSize = CGSizeMake(updateFrame.size.width, updateFrame.size.height);
    [self.view setNeedsLayout];
}

-(void)viewDidAppear:(BOOL)animated{
    
    NSAttributedString *x = [self boldString:[_dict objectForKey:@"Content"][1]];
    self.contentLabel.attributedText = x;
    CGRect newFrame = self.contentLabel.frame;
    CGRect updateFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + newFrame.size.height - 284.5); // 284.5 is the original height of the label
    
    self.contentView.frame = updateFrame;
    self.ScrollView.frame = updateFrame;
    self.ScrollView.contentSize = CGSizeMake(updateFrame.size.width, updateFrame.size.height);

    [self.view setNeedsLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Bold string

- (NSAttributedString *)boldString:(NSString *)string {
    UIFont *boldFont = [UIFont boldSystemFontOfSize:17];
    NSMutableAttributedString *attributedDescription = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@".*?<b>(.*?)<\\/b>.*?" options:NSRegularExpressionCaseInsensitive error:NULL];
    
    NSArray *myArray = [regex matchesInString:string options:0 range:NSMakeRange(0, string.length)] ;
    for (NSTextCheckingResult *match in myArray) {
        NSRange matchRange = [match rangeAtIndex:1];
        [attributedDescription addAttribute:NSFontAttributeName value:boldFont range:matchRange];
    }
    while ([attributedDescription.string containsString:@"<b>"] || [attributedDescription.string containsString:@"</b>"]) {
        NSRange rangeOfTag = [attributedDescription.string rangeOfString:@"<b>"];
        [attributedDescription replaceCharactersInRange:rangeOfTag withString:@""];
        rangeOfTag = [attributedDescription.string rangeOfString:@"</b>"];
        [attributedDescription replaceCharactersInRange:rangeOfTag withString:@""];
    }
    return attributedDescription;
}

#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     EditViewController *destViewController = segue.destinationViewController;
     destViewController.content = self.contentLabel.text;
     destViewController.toEdit = 1;
 }

@end
