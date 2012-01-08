//
//  PRPViewController.m
//  PRPFirstProjectTweeter
//
//  Created by David Loeffler on 12/18/11.
//  Copyright (c) 2011 e-tuitive. All rights reserved.
//

#import "PRPViewController.h"
#import <Twitter/Twitter.h>

@interface PRPViewController() 
-(void) reloadTweets;
-(void) handleTwitterData: (NSData*) data
              urlResponse: (NSHTTPURLResponse*) urlResponse
                    error: (NSError*) error;
@end

@implementation PRPViewController

@synthesize twitterTextView = _twitterTextView;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Actions

- (IBAction)handleTwitterButtonTapped:(id)sender {
    if ([TWTweetComposeViewController canSendTweet]) {
        TWTweetComposeViewController *tweetVC = [[TWTweetComposeViewController alloc]
                                                 init];
        [tweetVC setInitialText: NSLocalizedString (
                                                    @"I just finished the first project in iOS SDK Development. #pragsios",
                                                    nil)];
        tweetVC.completionHandler = ^(TWTweetComposeViewControllerResult result) {
            [self dismissModalViewControllerAnimated:YES];
            if (result == TWTweetComposeViewControllerResultDone) { 
                [self reloadTweets];  
            }
        };
        [self presentModalViewController:tweetVC animated:YES];
    }
}

- (IBAction)showMyTweetsTapped:(id)sender {
    [self reloadTweets];
}  

- (void)reloadTweets {
    NSURL *twitterAPIURL = [NSURL URLWithString: @"https://api.twitter.com/1/statuses/user_timeline.json"];
    NSDictionary *twitterParams = [NSDictionary dictionaryWithObjectsAndKeys:@"loeffler", @"screen_name", nil];
    TWRequest *request = [[TWRequest alloc] initWithURL:twitterAPIURL 
                                             parameters:twitterParams 
                                          requestMethod:TWRequestMethodGET];
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        [self handleTwitterData:responseData urlResponse:urlResponse error:error];
    }];
}

- (void) handleTwitterData:(NSData *)data 
               urlResponse:(NSHTTPURLResponse *)urlResponse 
                     error:(NSError *)error {
    NSError *jsonError = nil;
    NSJSONSerialization *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    if(!jsonError && [jsonResponse isKindOfClass:[NSArray class]]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSArray *tweets = (NSArray*) jsonResponse;
            // Sort tweets by text in tweet.  This is just for illustration of how to use
            // block to be the comparator.
            tweets = [tweets sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
                NSString *tweet1 = [obj1 valueForKey:@"text"];
                NSString *tweet2 = [obj2 valueForKey:@"text"];
                return [tweet1 compare: tweet2];
            } ];
            for (NSDictionary *tweetDict in tweets) {
                NSString *tweetText = [NSString stringWithFormat:@"%@ (%@)", [tweetDict valueForKey:@"text"], [tweetDict valueForKey:@"created_at"]];
                self.twitterTextView.text = [NSString stringWithFormat:@"%@%@\n\n", self.twitterTextView.text, tweetText];
            }
        });
    }
}

#pragma mark - View lifecycle;
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
