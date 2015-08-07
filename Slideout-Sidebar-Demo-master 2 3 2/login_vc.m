//
//  login_vc.m
//  MyTravelExperienceApp
//
//  Created by jigar on 19/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "login_vc.h"
#import <QuartzCore/QuartzCore.h>

@interface login_vc ()<UITextFieldDelegate>

{

//    UITextField *tf;
//    UITextField *tf1;
    

}

@end

@implementation login_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];

    _aLoginActivity.hidden=YES;
    //    self.navigationController.navigationBar.delegate=self;
    // Do any additional setup after loading the view.
    //    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
  //  self.view.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
    
    self.navigationController.navigationBar.hidden=FALSE;
    
//    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
//    
//    navbar.backgroundColor = [UIColor redColor];
//    
//    [self.view addSubview:navbar];
    
    // self.navigationController.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName: [UIColor grayColor]};
    
//    [tf setDelegate:self];
//    [tf1 setDelegate:self];
//    
    
    self.aLoginName.delegate=self;
    self.aLoginPassword.delegate=self;
    //_aDemoText.delegate=self;
    
    
   // self.aLoginName = [[UITextField alloc] initWithFrame:CGRectMake(16, 160, 276,40)];
    self.aLoginName.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.aLoginName.layer.cornerRadius=7;
    self.aLoginName.font = [UIFont fontWithName:@"Avenir Book" size:15];
    self.aLoginName.backgroundColor=[UIColor whiteColor];
    self.aLoginName.placeholder=@" Enter User Name";
    
    //second one
  //  self.aLoginPassword = [[UITextField alloc] initWithFrame:CGRectMake(16, 212, 276,40)];
    self.aLoginPassword.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.aLoginPassword.layer.cornerRadius=7;
    self.aLoginPassword.font = [UIFont fontWithName:@"Avenir Book" size:15];
    self.aLoginPassword.backgroundColor=[UIColor whiteColor];
    self.aLoginPassword.placeholder=@" Enter Password";
    

    [self.view addSubview:self.tf];
    [self.view addSubview:self.tf1];
    
    
    
//    [self.view addSubview:view];
    
//    _aLoginbtn.layer.cornerRadius=10;
//    _aSkipbtn.layer.cornerRadius=10;
//    _aLogSignUpbtn.layer.cornerRadius=10;
//    self.navigationItem.backBarButtonItem.tintColor=[UIColor whiteColor];
//    _aLoginbtn.backgroundColor=[UIColor colorWithRed:5.0/255.0 green:159.0/255 blue:158.0/255 alpha:1.0];
//    
//    _aLogSignUpbtn.backgroundColor=[UIColor colorWithRed:5.0/255.0 green:159.0/255 blue:158.0/255 alpha:1.0];
//    _aSkipbtn.backgroundColor=[UIColor colorWithRed:5.0/255.0 green:159.0/255 blue:158.0/255 alpha:1.0];
//    _aLopinForgotBtn.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
//    _aLoginName.textColor=[UIColor colorWithRed:214/255 green:220/255 blue:224/255 alpha:1.0];
//    _aLoginPassword.textColor=[UIColor colorWithRed:214/255 green:220/255 blue:224/255 alpha:1.0];
//    _aLoginName.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
//    _aLoginPassword.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
//    _aSkipbtn.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
//    
//    _aLoginName.layer.borderColor=[[UIColor  grayColor]CGColor];
//    _aLoginName.layer.borderWidth=1.0f;
//    [_aLoginName setTextColor:[UIColor grayColor]];
//    
//_aLoginPassword.layer.borderColor=[[UIColor  grayColor]CGColor];
//_aLoginPassword.layer.borderWidth=1.0f;
//[_aLoginPassword setTextColor:[UIColor grayColor]];
//    
//    
//[ self.aLoginName setValue:[UIColor darkGrayColor]
//                    forKeyPath:@"_placeholderLabel.textColor"];
//    [self.aLoginPassword setValue:[UIColor darkGrayColor]
//                       forKeyPath:@"_placeholderLabel.textColor"];

  


}







-(void)btnClicked {
   
    UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"trgv4t" message:@"t3w" delegate:self cancelButtonTitle:@"cancell" otherButtonTitles: nil];
    
    [alrt show];

}

//-(BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
//{
//    NSLog(@"Back button got pressed!");
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    return YES;
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *) textField
{
   
    [self.aLoginName resignFirstResponder];
    [self.aLoginPassword resignFirstResponder];
    //[_aDemoText resignFirstResponder];
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginAct:(UIButton *)sender {
    _aLoginActivity.hidden=NO;
    
    
    
    
    [PFUser logInWithUsernameInBackground:_aLoginName.text password:_aLoginPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            
                                            SWRevealViewController *swReveal=[self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
                                            [self presentViewController:swReveal animated:YES completion:nil];
                                        }
                                        else{
                                            UIAlertView *alr=[[UIAlertView alloc]initWithTitle:@"Usearname and password does not match" message:@"Please check your usename and password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
                                            [alr show];

                                        }
                                    }];
     
}

- (IBAction)aLogSignAct:(UIButton *)sender {
}

- (IBAction)skipAct:(UIButton *)sender {
}
@end
