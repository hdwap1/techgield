//
//  Nearmevc.m
//  SidebarDemo
//
//  Created by jigar on 12/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "Nearmevc.h"

@interface Nearmevc ()
{
    CLGeocoder *geo;
    
    
    CLLocationManager *aManager;
    
    NSArray *latArry;
    NSArray *longArry;

}

@end

@implementation Nearmevc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFUser *user=[PFUser currentUser];
    self.aUserState=user[@"State"];
    NSLog(@"%@",self.aUserState);
    PFQuery *aQuery=[[PFQuery alloc]initWithClassName:@"Place_Default"];
    
        [aQuery whereKey:@"State" equalTo:user[@"State"]];
    //    [aQuery setLimit:400];
    //    aQuery.cachePolicy=kPFCachePolicyNetworkElseCache;
    
    [aQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            aNearMePlacesArry=[[NSArray alloc]initWithArray:objects];
             NSLog(@"%@",aNearMePlacesArry);
            [self.aNearMeTable reloadData];
            
            
            
        }
        else{
            NSLog(@"error");
        }
    }];
    
   
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(aNearMePlacesArry.count>0)
    {
    return aNearMePlacesArry.count;
    }
    return 0;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NearMeTable *cell=[tableView dequeueReusableCellWithIdentifier:@"nearme"];
    cell.aNearMePlaceName.text=[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"Name"];
    cell.aNearMePlaceCity.text=[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"City"];
    
    
    self.strLat=[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"Lattitude"];
    self.strLong=[[aNearMePlacesArry objectAtIndex:indexPath.row]objectForKey:@"Longitude"];
    
     CLLocation *locate = [[CLLocation alloc]
                          initWithLatitude:[self.strLat doubleValue] longitude: [self.strLong doubleValue]];
    
    [geo reverseGeocodeLocation:locate completionHandler:^(NSArray *placemarks, NSError *error) {
        CLLocationCoordinate2D coordinate=locate.coordinate;
        MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
        annot.coordinate=coordinate;
        CLPlacemark *mark=[placemarks objectAtIndex:0];
        
        annot.title = mark.name;
        annot.subtitle = mark.country;
        
        [self.aPlaceMap addAnnotation:annot];
        
        [self.aPlaceMap addAnnotation:annot];
        [_aPlaceMap setCenterCoordinate:coordinate animated:YES];
        
        
        [self.aPlaceMap addAnnotation:annot];
        // [self.SecondMapview addAnnotation:annot];
        
        //[_SecondMapview setCenterCoordinate:coordinate animated:YES];
        
        
        // mapview controller
        
        
        
        
        //         map view as a sub view
        
        [_aPlaceMap setCenterCoordinate:coordinate animated:YES];
    }];
    return cell;
    
}
@end
