//
//  MainViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "addTripHome_vc.h"
#import "aSearch_vc.h"

@interface MainViewController ()<UITextFieldDelegate, UIGestureRecognizerDelegate>

{
    
    UISearchBar *sBar;
    BOOL isSearchEnabled;
}

@end


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor=[UIColor colorWithRed:0.084 green:0.167 blue:0.249 alpha:1.000];
    
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapFrom:)];
    
    [self.view addGestureRecognizer:tapgesture];
    
    // Do any additional setup after loading the view.
    _aSearchtrip.layer.cornerRadius=_aSearchtrip.bounds.size.width/2;
    _aNearme.layer.cornerRadius=_aNearme.bounds.size.width/2;
    _aAddtrip.layer.cornerRadius=_aAddtrip.bounds.size.width/2;
    
    
    //to hide back button
    
    self.navigationItem.hidesBackButton=YES;
    
    sBar =[[UISearchBar alloc]initWithFrame: CGRectMake(45, 10, self.navigationController.navigationBar.bounds.size.width/1.5, self.navigationController.navigationBar.bounds.size.height/2)];
    
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
    UIButton *btn  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [btn setImage:[UIImage imageNamed:@"asearch.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(toggleSearchbutton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}


-(void)toggleSearchbutton:(UIBarButtonItem*)sender{
    if(!isSearchEnabled){
        UIButton *btn  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        [btn setImage:[UIImage imageNamed:@"acancel.png"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(toggleSearchbutton:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        sBar.hidden = NO;
        
        [self.navigationController.navigationBar addSubview:sBar];
        
    }else{
        UIButton *btn  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        [btn setImage:[UIImage imageNamed:@"asearch.png"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(toggleSearchbutton:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        sBar.hidden = YES;
        [sBar removeFromSuperview];
        
        
        
    }
    isSearchEnabled =  !isSearchEnabled;
}




-(void)reloadData:(UIButton*)sender{
    
    
}


-(void)handleTapFrom:(UITapGestureRecognizer*)sender

{
    
    [sBar removeFromSuperview];
    self.navigationItem.rightBarButtonItem.enabled= YES;
    UIButton *btn  = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [btn setImage:[UIImage imageNamed:@"asearch.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(toggleSearchbutton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    sBar.hidden = YES;
    [sBar removeFromSuperview];
    
}



- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    // self.navigationItem.rightBarButtonItem.enabled= NO;
    
    NSLog(@"CLICKED");
    
    //self.navigationItem.rightBarButtonItem.enabled = NO;
    
    //[searchBar setShowsCancelButton:YES animated:YES];
    
    
}


-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    //  [searchBar setShowsCancelButton:NO animated:YES];
    NSLog(@"start");
    //self.navigationItem.rightBarButtonItem.enabled = YES;
    //self.navigationItem.rightBarButtonItem.enabled = NO;
    
    
}


// called when cancel button pressed

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    NSLog(@"CLICKED");
    
    [sBar removeFromSuperview];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    
    
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
- (IBAction)aSearchbaritem:(UIBarButtonItem *)sender {
    
    
    sBar.hidden=FALSE;
    sBar.delegate = self;
    [self.navigationController.navigationBar addSubview:sBar];
    sBar.autoresizingMask = 0;
    [sBar setPlaceholder:@"Search Places"];
    
}
- (IBAction)aAddtrip:(UIButton *)sender {
}

- (IBAction)aNearme:(UIButton *)sender {
}

- (IBAction)aSearchtrip:(UIButton *)sender {
    
    UIStoryboard *aStory=[UIStoryboard storyboardWithName:@"Main2" bundle:nil];
    aSearch_vc *aSearch=[aStory instantiateViewControllerWithIdentifier:@"asearchtrip"];
    [self.navigationController pushViewController:aSearch animated:YES];

    
    
}




@end
