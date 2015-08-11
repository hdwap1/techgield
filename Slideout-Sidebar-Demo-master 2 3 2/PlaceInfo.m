//
//  PlaceInfo.m
//  SidebarDemo
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "PlaceInfo.h"
#import "SWRevealViewController.h"
#import "aMapview_VC.h"

@interface PlaceInfo ()
{
    CLGeocoder *geo;


    CLLocationManager *aManager;
    

}

@end

@implementation PlaceInfo


- (void)viewDidLoad {
    [super viewDidLoad];

    
    aManager=[[CLLocationManager alloc]init];
    aManager.delegate=self;
    if([aManager respondsToSelector:@selector(requestAlwaysAuthorization)])
    {
        [aManager requestAlwaysAuthorization];
    }
    
    [aManager startUpdatingLocation];
    geo=[[CLGeocoder alloc]init];
    
    _aPlacemap.layer.cornerRadius=5;
    _aPlacemap.layer.borderWidth=50;
    _aPlacemap.layer.borderColor= (__bridge CGColorRef)([UIColor colorWithRed:0.168 green:0.493 blue:1.000 alpha:1.000]);
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.mainviewbarbtn setTarget: self.revealViewController];
        [self.mainviewbarbtn setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
    
    _mainplacedescription.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    
    [_Mainviewscroll setContentSize:(CGSizeMake(_Mainviewscroll.frame.size.width,980))];
    
    _Mainviewscroll.backgroundColor = [UIColor whiteColor];
    
    
    //    NSLog(@"%@",aSearch.aselectedPlace);
    
    //NSLog(@"%@",aSearch.aselectedPlace);
    
    self.mainviewname.text=[self.array objectForKey:@"Name"];
    self.mainviewcity.text=[self.array objectForKey:@"City"];
    
    self.mainplacedescription.text=[self.array objectForKey:@"Description"];
    self.mainviewlatitude.text=[NSString stringWithFormat:@"%@",[self.array objectForKey:@"Lattitude"]];
    self.mainviewlongitude.text=[NSString stringWithFormat:@"%@",[self.array objectForKey:@"Longitude"]];
    
    
    
    PFFile *aFile=[self.array objectForKey:@"Images"];
    
    [aFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        
        self.mainviewImageview.image=[UIImage imageWithData:data];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return 5;
    
}



- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)maincv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    aPlaceListCell *cell = [maincv dequeueReusableCellWithReuseIdentifier:@"maincollectionview" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    
    return cell;
}



//    PFFile *aFile=object[@"Images"];
//                 [aFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//
//                cell.aPlaceImage.image=[UIImage imageWithData:data];
//
//                }];

// NSData *aData=object[@"Images"];

//cell.aPlaceImage.image=[UIImage imageWithData:aData];
//
//                PFFile *aFile=object[@"Images"];
//                [aFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//
//                cell.aPlaceImage.image=[UIImage imageWithData:data];
//
//                }];


//
//            NSLog(@"%@",objects);
//        } else {
//            // Log details of the failure
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//    }];
//




- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return CGSizeMake(145, 145);  // will be w120xh100 or w190x100
    
    // if the width is higher, only one image will be shown in a line
}




#pragma mark collection view cell paddings
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    {
        return UIEdgeInsetsMake(5, 10, 5, 10); // top, left, bottom, right
    }
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 5.0;
}





- (IBAction)mainviewbarbtnaction:(UIBarButtonItem *)sender {
    
    
}

#pragma mark - Navigation


- (IBAction)aSwitchaction:(UISwitch *)sender {
    
    
    CLLocation *locate = [[CLLocation alloc]
                          initWithLatitude:[self.mainviewlatitude.text doubleValue] longitude: [self.mainviewlongitude.text doubleValue]];
    
    [geo reverseGeocodeLocation:locate completionHandler:^(NSArray *placemarks, NSError *error) {
        CLLocationCoordinate2D coordinate=locate.coordinate;
        MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
        annot.coordinate=coordinate;
        CLPlacemark *mark=[placemarks objectAtIndex:0];
        
        annot.title = mark.name;
        annot.subtitle = mark.country;

        [self.aPlacemap addAnnotation:annot];

        //        [self.aPlacemap addAnnotation:annot];
        //        [_aPlacemap setCenterCoordinate:coordinate animated:YES];
        
        
        [self.aMapviewoutlet addAnnotation:annot];
       // [self.SecondMapview addAnnotation:annot];
        
        //[_SecondMapview setCenterCoordinate:coordinate animated:YES];
        
        
        // mapview controller
        
        
        
        
//         map view as a sub view
        
        [_aMapviewoutlet setCenterCoordinate:coordinate animated:YES];
        [_aMapUIview addSubview:_aMapviewoutlet];
        [self.view addSubview:_aMapUIview];
        
        //        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(toggleSearchbutton:)];
        //        self.navigationItem.leftBarButtonItem = backButton;
        
        
        

    }];
    
}

-(void)toggleSearchbutton:(UIBarButtonItem*)sender{
    [_aMapUIview removeFromSuperview];
    
    [_aSwitchoutlet setOn:NO animated:YES];
    
    
}

-(void)viewWillDisappear:(BOOL)animated{

[_aSwitchoutlet setOn:NO animated:YES];
    NSLog(@"viewWillDisappear");
}



@end
