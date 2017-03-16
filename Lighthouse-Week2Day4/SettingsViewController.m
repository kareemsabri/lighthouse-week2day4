//
//  SettingsViewController.m
//  Lighthouse-Week2Day4
//
//  Created by Kareem Sabri on 2017-03-16.
//  Copyright © 2017 Kareem Sabri. All rights reserved.
//

#import "SettingsViewController.h"
#import "User.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *increaseButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@end

@implementation SettingsViewController
int number = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.saveButton addTarget:self action:@selector(didTapSaveUserButton:) forControlEvents:UIControlEventTouchUpInside];
    self.nameTextField.text = self.user.name;
    
    UILongPressGestureRecognizer *gr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(didPressIncreaseButton)];
    [self.increaseButton addGestureRecognizer:gr];
}

- (void)didTapSaveUserButton:(UIButton *)sender {
    self.user.name = self.nameTextField.text;
    [[NSNotificationCenter defaultCenter] postNotificationName:self.user.updateEventName object:self.user];
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didPressIncreaseButton {
    number++;
    self.numberLabel.text = [NSString stringWithFormat: @"%d",number];
}


@end
