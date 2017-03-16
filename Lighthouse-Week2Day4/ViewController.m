//
//  ViewController.m
//  Lighthouse-Week2Day4
//
//  Created by Kareem Sabri on 2017-03-16.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"
#import "User.h"

@interface ViewController ()
@property User *user;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = [[User alloc]init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"didUpdateUser:") name:self.user.updateEventName object:nil];
    self.user.name = @"Joe";
    self.nameLabel.text = self.user.name;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.nameLabel.text = self.user.name;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SettingsViewController *vc = segue.destinationViewController;
    vc.user = self.user;
}

- (void) didUpdateUser:(NSNotification*)notification {
    User *updatedUser = notification.object;
    self.user.name = updatedUser.name;
}


@end
