//
//  PlaceInfo.h
//  SidebarDemo
//
//  Created by indianic on 06/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "ViewController.h"
#import "aSearch_vc.h"
#import <Parse/Parse.h>
@interface PlaceInfo : ViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *Mainviewscroll;
@property (weak, nonatomic) IBOutlet UICollectionView *mainviewcollection;
@property (weak, nonatomic) IBOutlet UIImageView *mainviewImageview;
@property (weak, nonatomic) IBOutlet UILabel *mainviewname;
@property (weak, nonatomic) IBOutlet UILabel *mainviewcity;

@property (weak, nonatomic) IBOutlet UITextView *mainplacedescription;

@property (weak, nonatomic) IBOutlet UILabel *mainviewlatitude;
@property (weak, nonatomic) IBOutlet UILabel *mainviewlongitude;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *mainviewbarbtn;

- (IBAction)mainviewbarbtnaction:(UIBarButtonItem *)sender;



@property (weak, nonatomic) IBOutlet UIImageView *aPlaceInfoImage;
@property (strong,nonatomic) PFObject *array;
@end
