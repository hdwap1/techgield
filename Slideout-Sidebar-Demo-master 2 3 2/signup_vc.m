//
//  signup_vc.m
//  MyTravelExperienceApp
//
//  Created by jigar on 19/07/15.
//  Copyright (c) 2015 MTE. All rights reserved.
//

#import "signup_vc.h"
#import "AppDelegate.h"
#import "DownPicker.h"

@interface signup_vc ()
{

    NSArray *pickerData;
    NSInteger pickerrow;
    NSString *Pickerstr;

}

@end

@implementation signup_vc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
//    Pickerstr = [[NSString alloc]init];
//    
//    
//    pickerData = @[
//    @"Andaman and Nicobar Islands",
//    @"Andhra Pradesh",
//    @"Arunachal Pradesh",
//    @"Assam",
//    @"Bihar",
//    @"Chandigarh",
//    @"Chhattisgarh",
//    @"Dadra and Nagar Haveli",
//    @"Daman and Diu",
//    @"Delhi",
//    @"Goa",
//    @"Gujarat",
//    @"Haryana",
//    @"Himachal Pradesh",
//    @"Jammu and Kashmir",
//    @"Jharkhand",
//    @"Karnataka",
//    @"Kerala",
//    @"Lakshadweep",
//    @"Madhya Pradesh",
//    @"Maharashtra",
//    @"Manipur",
//    @"Meghalaya",
//    @"Mizoram",
//    @"Nagaland",
//    @"Odisha",
//    @"Puducherry",
//    @"Punjab",
//    @"Rajasthan",
//    @" Sikkim",
//    @"Telangana",
//    @"Tripura",
//    @"Uttar Pradesh",
//    @"Uttarakhand",
//    @"West Bengal"
//    ];
//    
//    self.aPickerviewoutlet.dataSource = self;
//    self.aPickerviewoutlet.delegate = self;
    
    [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];
   
    _aSignuBbtn.layer.cornerRadius=10;
    
    
    [_aProfileOptionSelection addTarget:self
                                 action:@selector(segmentAction)
               forControlEvents:UIControlEventValueChanged];
    
//    self.navigationItem.backBarButtonItem.tintColor=[UIColor blackColor];
//    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
  // self.view.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
//    
//    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.138 green:0.623 blue:0.209 alpha:1.000]];
    
   self.navigationController.navigationBar.hidden=FALSE;
    
    
    [self aSignup_vcstyle];
    
    
    
}


-(void)viewDidAppear:(BOOL)animated

{
    
    NSMutableArray* stateArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [stateArray addObject:@"Andaman and Nicobar Islands"];
    [stateArray addObject: @"Andhra Pradesh"];
    [stateArray addObject:@"Arunachal Pradesh"];
    [stateArray addObject:@"Assam"];
    [stateArray addObject:@"Bihar"];
    [stateArray addObject:@"Chandigarh"];
    [stateArray addObject:@"Chhattisgarh"];
    [stateArray addObject:@"Dadra and Nagar Haveli"];
    [stateArray addObject:@"Daman and Diu"];
    [stateArray addObject:@"Delhi"];
    [stateArray addObject:@"Goa"];
    [stateArray addObject:@"Gujarat"];
    [stateArray addObject:@"Haryana"];
    [stateArray addObject:@"Himachal Pradesh"];
    [stateArray addObject:@"Jammu and Kashmir"];
    [stateArray addObject:@"Jharkhand"];
    [stateArray addObject:@"Karnataka"];
    [stateArray addObject:@"Kerala"];
    [stateArray addObject:@"Lakshadweep"];
    [stateArray addObject:@"Madhya Pradesh"];
    [stateArray addObject:@"Maharashtra"];
    [stateArray addObject:@"Manipur"];
    [stateArray addObject:@"Meghalaya"];
    [stateArray addObject:@"Mizoram"];
    [stateArray addObject:@"Nagaland"];
    [stateArray addObject:@"Odisha"];
    [stateArray addObject:@"Puducherry"];
    [stateArray addObject:@"Punjab"];
    [stateArray addObject:@"Rajasthan"];
    [stateArray addObject:@"Sikkim"];
    [stateArray addObject:@"Telangana"];
    [stateArray addObject:@"Tripura"];
    [stateArray addObject:@"Uttar Pradesh"];
    [stateArray addObject:@"Uttarakhand"];
    [stateArray addObject:@"West Bengal"];
    
    // bind yourTextField to DownPicker
    self.downPicker = [[DownPicker alloc] initWithTextField: self.Addstatetextfield withData:stateArray];
    
    
    
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

-(void)aSignup_vcstyle{

    
    //UITextField *aUsername = [[UITextField alloc] initWithFrame:CGRectMake(16,100,288,40)];
    self.aSignupName.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.aSignupName.layer.cornerRadius=7;
    self.aSignupName.font = [UIFont fontWithName:@"Avenir Book" size:15];
    self.aSignupName.backgroundColor=[UIColor whiteColor];
    self.aSignupName.placeholder=@" Enter User Name";
    
    //second one
   // UITextField *aEmail = [[UITextField alloc] initWithFrame:CGRectMake(16, 160, 288,40)];
    self.aSignupEmail.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.aSignupEmail.layer.cornerRadius=7;
    self.aSignupEmail.font = [UIFont fontWithName:@"Avenir Book" size:15];
    self.aSignupEmail.backgroundColor=[UIColor whiteColor];
    self.aSignupEmail.placeholder=@" Enter Email Address";
    
    
    UITextField *aPassword = [[UITextField alloc] initWithFrame:CGRectMake(16, 220, 288,40)];
    aPassword.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    aPassword.layer.cornerRadius=7;
    aPassword.font = [UIFont fontWithName:@"Avenir Book" size:15];
    aPassword.backgroundColor=[UIColor whiteColor];
    aPassword.placeholder=@" Enter Your Password";
    
    
    //UITextField *aCity = [[UITextField alloc] initWithFrame:CGRectMake(16, 280, 288,40)];

    
    //_aSignupCity.frame = CGRectMake(16, 280, 288, 60);
    
    self.aSignupCity.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    self.aSignupCity.layer.cornerRadius=7;
    self.aSignupCity.font = [UIFont fontWithName:@"Avenir Book" size:15];
    self.aSignupCity.backgroundColor=[UIColor whiteColor];
    self.aSignupCity.placeholder=@" Enter State";
    
    
    
    [self.view addSubview:self.aSignupName];
    [self.view addSubview:self.aSignupEmail];
    [self.view addSubview:self.aSignupPassword];
    [self.view addSubview:self.aSignupCity];

    
}

- (IBAction)signupAct:(UIButton *)sender {
    
    if([_aSignupName.text length]>5 &&[_aSignupPassword.text length]>5)
    {
    
    PFUser *user=[PFUser user];
    user.username=_aSignupName.text;
    user.password=_aSignupPassword.text;
    user.email=_aSignupEmail.text;
    
        
        pickerrow = [_aPickerviewoutlet selectedRowInComponent:0];
        Pickerstr = [pickerData objectAtIndex:pickerrow];
        user[@"State"]=_Addstatetextfield.text;
        
    user[@"Gender"]=[_aSignupGender titleForSegmentAtIndex:[_aSignupGender selectedSegmentIndex]];
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if(!error)
         {
             [user saveInBackground];
             NSLog(@"%@",user);
              SWRevealViewController *swReveal=[self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
           [self presentViewController:swReveal animated:YES completion:nil];

             //[self.navigationController pushViewController:profile animated:YES];
             //[self presentViewController:profile animated:YES completion:nil];
            

         }
     }];
      
        
//        AppDelegate *appDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
//        
//        appDelegate.userstate = TRUE;
        

}
    else
    {
        if([_aSignupName.text length]<5)
        {
            UIAlertView *alr=[[UIAlertView alloc]initWithTitle:@"Name not valid" message:@"Please enter username with more than 5 character" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: nil];
                   [alr show];

        }
        else if([_aSignupPassword.text length]<5)
        {
            UIAlertView *alr=[[UIAlertView alloc]initWithTitle:@"Password error" message:@"Please enter password with more than 5 character" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: nil];
            [alr show];

        }
        
    }
}
-(void)segmentAction
{
    if(_aProfileOptionSelection.selectedSegmentIndex==0)
    {
        NSLog(@"first");
    }
    else
    {
        NSLog(@"second");
    }
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}


- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}




- (IBAction)addstateaction:(UIButton *)sender {
    
    _aPickerviewoutlet.hidden = FALSE;
    
    
}
@end
