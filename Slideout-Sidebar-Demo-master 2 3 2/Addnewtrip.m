//
//  Addnewtrip.m
//  SidebarDemo
//
//  Created by indianic on 13/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "Addnewtrip.h"
#import "SWRevealViewController.h"

@interface Addnewtrip ()

@end

@implementation Addnewtrip

- (void)viewDidLoad {
    [super viewDidLoad];
    
<<<<<<< HEAD
    _Addtriptextview.layer.borderColor = ([UIColor blackColor].CGColor);
    _Addtriptextview.layer.borderWidth = 2;
    _Addtriptextview.layer.cornerRadius = 5;
  
  
=======
  [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];
    AddTripObj =[[PFObject alloc]initWithClassName:@"Place_By_User"];
    
    

>>>>>>> 506553899d4e3830b754992c2cf585dcc496a65c
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.Addtripbarbtn setTarget: self.revealViewController];
        [self.Addtripbarbtn setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }


    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    self.downPicker = [[DownPicker alloc] initWithTextField:self.Addtripstate withData:stateArray];

    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [_Addtripcity resignFirstResponder];
    [_Addtripstate resignFirstResponder];
    return true;
    
}


- (IBAction)Uploadtripbtnaction:(UIButton *)sender {
    [AddTripObj addObject:self.addTripName.text forKey:@"Place_Name"];
    
    [AddTripObj addObject:[PFUser currentUser].objectId forKey:@"Connect_user_id"];
    NSLog(@"%@",[[PFUser currentUser]objectId]);
    [AddTripObj saveInBackground];
    
}

- (IBAction)Uploadimagebtnaction:(UIButton *)sender {
    
}
- (IBAction)Addtripbarbtnaction:(UIBarButtonItem *)sender {
}
@end
