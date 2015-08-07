//
//  aProfilevc.m
//  SidebarDemo
//
//  Created by patel Rahul on 25/07/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "aProfilevc.h"
#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"

@interface aProfilevc ()

@end

@implementation aProfilevc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.aProfilevcbarbtn setTarget: self.revealViewController];
        [self.aProfilevcbarbtn setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

    
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

@end
