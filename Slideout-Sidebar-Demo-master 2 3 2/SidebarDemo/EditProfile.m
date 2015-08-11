//
//  EditProfile.m
//  SidebarDemo
//
//  Created by indianic on 12/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "EditProfile.h"

@interface EditProfile ()

@end

@implementation EditProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.auSerEditName.enabled=NO;
    self.aUserEditCity.enabled=NO;
    self.aUserEditEmail.enabled=NO;
    
    
    PFUser *user=[PFUser currentUser];
    NSLog(@"%@",user);
    self.auSerEditName.text=user.username;
    self.aUserEditEmail.text=user.email;
    self.aUserEditPassword.text=user.password;
    self.aUserEditCity.text=user[@"City"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)aSaveProfile:(UIButton *)sender {
    PFUser *user=[PFUser currentUser];
    [user setObject:self.aUserEditCity.text forKey:@"City"];
    [user setEmail:self.aUserEditEmail.text];
    [user setUsername:self.auSerEditName.text];
    
    [user saveInBackground];
    
}

- (IBAction)editNameBtn:(UIButton *)sender {
    self.auSerEditName.enabled=YES;
    
    
}

- (IBAction)editEmailBtn:(UIButton *)sender {
    
    self.aUserEditEmail.enabled=YES;
}

- (IBAction)editCityBtn:(UIButton *)sender {
    
    self.aUserEditCity.enabled=YES;
 
}
@end
