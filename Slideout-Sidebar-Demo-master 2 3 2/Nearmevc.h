//
//  Nearmevc.h
//  SidebarDemo
//
//  Created by jigar on 12/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NearMeTable.h"
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface Nearmevc : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *aNearMePlacesArry;
}
@property (strong,nonatomic) NSString *aUserState;
@property (weak, nonatomic) IBOutlet UITableView *aNearMeTable;
@property (strong,nonatomic) UILabel *lblLat;
@property (strong,nonatomic) NSString *strLong;
@property (strong,nonatomic) NSString *strLat;
@property (weak, nonatomic) IBOutlet MKMapView *aPlaceMap;

@end
