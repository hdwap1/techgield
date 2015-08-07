//
//  forgotpass_vc.m
//  MyTravelExperienceApp
//
//  Created by indianic on 20/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "forgotpass_vc.h"

@interface forgotpass_vc ()<UITextFieldDelegate>

@end

@implementation forgotpass_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    _aforgotResetBtn.layer.cornerRadius=10;
//    _aForgotPasswordEmail.delegate=self;
//    _aForgotResetMessage.hidden=YES;
//    [self aforgotVcStyle];
    
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
    self.view.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
    self.navigationController.navigationBar.hidden=FALSE;
    
    self.navigationController.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName: [UIColor grayColor]};
    
    //UITextField *tfforgot = [[UITextField alloc] initWithFrame:CGRectMake(20, 240, 280,40)];
    self.aForgotPasswordEmail.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.aForgotPasswordEmail.layer.cornerRadius=7;
    self.aForgotPasswordEmail.font = [UIFont fontWithName:@"Avenir Book" size:15];
    self.aForgotPasswordEmail.backgroundColor=[UIColor whiteColor];
    self.aForgotPasswordEmail.placeholder=@" Enter Your Email Address";
    
    //[self.view addSubview:tfforgot];
    self.aForgotPasswordEmail.delegate=self;
    
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

//-(void)aforgotVcStyle
//{
//    _aforgotResetBtn.layer.cornerRadius=10;
//    _aForgotPasswordEmail.delegate=self;
//    _aForgotResetMessage.hidden=YES;
//    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
//    self.view.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
//    _aForgotPasswordEmail.layer.borderColor=[[UIColor  grayColor]CGColor];
//    _aForgotPasswordEmail.layer.borderWidth=1.0f;
//    [_aForgotPasswordEmail setTextColor:[UIColor grayColor]];
//    _aForgotPasswordEmail.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
//    _aforgotResetBtn.backgroundColor=[UIColor colorWithRed:5.0/255.0 green:159.0/255 blue:158.0/255 alpha:1.0];
//    
//    [ self.aForgotPasswordEmail setValue:[UIColor darkGrayColor]
//                              forKeyPath:@"_placeholderLabel.textColor"];
//}

- (IBAction)forgotPasswordAct:(UIButton *)sender {
    _aForgotResetMessage.text=@"Please check your Email to reset";
    _aForgotResetMessage.hidden=NO;
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.aForgotPasswordEmail resignFirstResponder];
    return YES;
}
@end
