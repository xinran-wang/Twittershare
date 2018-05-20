//
//  ViewController.m
//  Twittershare
//
//  Created by u586 on 5/19/18.
//  Copyright © 2018 u586. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *twittTextView;

@end

@implementation ViewController


- (void) showAlertMessage:(NSString*) msg {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showShare:(id)sender {
    if ([self.twittTextView isFirstResponder]) {
        [self.twittTextView resignFirstResponder];
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Test Title" message:@"hello Xinran" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *twittAction = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            SLComposeViewController *twitterController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [twitterController setInitialText:[self.twittTextView.text substringToIndex:140]];
            [self presentViewController:twitterController animated:YES completion:nil];
        } else {
            [self showAlertMessage:@"Please signin twitter"];
        }
    }];
    
    [alertController addAction:cancelAction];
    
    [alertController addAction:twittAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
