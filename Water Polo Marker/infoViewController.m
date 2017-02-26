//
//  infoViewController.m
//  Water Polo ScoreBoard
//
//  Created by Daniel Medina on 1/28/14.
//  Copyright (c) 2014 Medalabs Development. All rights reserved.
//

#import "infoViewController.h"

@interface infoViewController ()

@end

@implementation infoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction) appWebsite
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.medalabsdevelopment.com"]];
}
- (IBAction) webloopeight
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.behance.com/loopeight"]];
}
- (IBAction) Donations
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://medalabsdevelopment.com/Donations.html"]];
}

- (IBAction) back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
