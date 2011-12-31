//
//  PRPViewController.m
//  PRPFirstProjectTweeter
//
//  Created by David Loeffler on 12/18/11.
//  Copyright (c) 2011 e-tuitive. All rights reserved.
//

#import "PRPViewController.h"
#import <Twitter/Twitter.h>

@implementation PRPViewController

@synthesize twitterWebView = _twitterWebView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Actions

- (IBAction)handleTwitterButtonTapped:(id)sender {
    if ([TWTweetComposeViewController canSendTweet]) {
        TWTweetComposeViewController *tweetVC = [[TWTweetComposeViewController alloc] init];
        [tweetVC setInitialText:
           NSLocalizedString(@"I just finished the first project in iOS SDK Development. #pragsios", nil)];
        [self presentModalViewController:tweetVC animated:YES];
    } else {
        NSLog(@"Can't send tweet");
    }
}

- (IBAction)showMyTweetsTapped:(id)sender {
    [self.twitterWebView loadRequest:[NSURLRequest requestWithURL:
                                      [NSURL URLWithString:@"http://www.twitter.com/loeffler"]]];
}  

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
