//
//  signup_vc.h
//  MyTravelExperienceApp
//
//  Created by jigar on 19/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SWRevealViewController.h"
@interface signup_vc : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *aSignupName;
@property (weak, nonatomic) IBOutlet UITextField *aSignupEmail;
@property (weak, nonatomic) IBOutlet UITextField *aSignupPassword;
@property (weak, nonatomic) IBOutlet UITextField *aSignupCity;
@property (weak, nonatomic) IBOutlet UISegmentedControl *aSignupGender;
@property (weak, nonatomic) IBOutlet UIButton *aSignuBbtn;
- (IBAction)signupAct:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *aProfileOptionSelection;
@property (weak, nonatomic) IBOutlet UIImageView *aProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *aProfilePicLabel;




@end
