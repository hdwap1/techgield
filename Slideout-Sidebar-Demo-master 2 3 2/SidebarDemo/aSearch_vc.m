//
//  aSearch_vc.m
//  SidebarDemo
//
//  Created by indianic on 03/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import "aSearch_vc.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"
#import "UIImageView+WebCache.h"
#import "PlaceInfo.h"

@interface aSearch_vc ()
{
    
    UIView *geopointView;
    NSMutableArray *Mutearr;
    UISearchBar *sBar;
    BOOL isSearchEnabled;
    

}

@end

@implementation aSearch_vc






- (void)viewDidLoad {
    [super viewDidLoad];
   
    [Parse setApplicationId:@"aRdKtgCLpKk9PTOpPgZUHIUutAFDxxOs9vCPIz93" clientKey:@"tAGtNESX10C3fa2sboyMOwO1JMTV9RhMvdyhIjvY"];
    
    aPlaceData=[[NSArray alloc]init];
    
    PFQuery *aQuery=[[PFQuery alloc]initWithClassName:@"Place_Default"];
    
       ////    [aQuery whereKey:@"State" equalTo:@"Rajasthan"];
    //    [aQuery setLimit:400];
    //    aQuery.cachePolicy=kPFCachePolicyNetworkElseCache;
    
    [aQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            aPlaceData=[NSArray arrayWithArray:objects] ;
            NSLog(@"%@",aPlaceData);
            
            [_AcollectionView reloadData];
            [_Acollectionviewslider reloadData];
            self.aLoadActivity.hidden=YES;
        }}];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(City ==  %@)", @"Ahmedabad"];
    
    NSArray *filteredArray = [aPlaceData filteredArrayUsingPredicate:predicate];
    
    
    
    self.navigationItem.hidesBackButton=YES;
    
    sBar =[[UISearchBar alloc]initWithFrame: CGRectMake(45, 10, self.navigationController.navigationBar.bounds.size.width/1.5, self.navigationController.navigationBar.bounds.size.height/2)];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.aSearchtripbarbtn setTarget: self.revealViewController];
        [self.aSearchtripbarbtn setAction: @selector( revealToggle: )];
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


//  [_aScrollview setContentSize:(CGSizeMake(1600, _aScrollview.frame.size.height))];
//    
//    NSLog(@"%f",_aScrollview.frame.size.height);
//    
//    _aScrollview.backgroundColor = [UIColor blueColor];
//





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



//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    
//    return 10;
//
//}
//
//// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    static NSString *identifier = @"Acollectionview";
//    
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    
//    //UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
//    
//   // collectionImageView.image = [UIImage imageNamed:[Mutearr objectAtIndex:indexPath.row]];
//    return cell;
//}





- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    if(view.tag==2)
    {
   
    return aPlaceData.count;
}
else if(aPlaceData.count>0)
{
    return 4;
}
else{
    return 0;
}


}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
   if(cv.tag==2)
   {
    aPlaceListCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"Acollectionview" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
 
   
    cell.aPlaceCity.text=[[aPlaceData objectAtIndex:indexPath.row] objectForKey:@"City"];
    cell.aPlaceName.text=[[aPlaceData objectAtIndex:indexPath.row] objectForKey:@"Name"];
    
    
    PFFile *imageFile=[[aPlaceData objectAtIndex:indexPath.row] objectForKey:@"Images"];
    NSLog(@"%@",imageFile.url);
    
   
    [cell.aPlaceImage sd_setImageWithURL:[NSURL URLWithString:imageFile.url] placeholderImage:[UIImage imageNamed:@"search.png"]];
    
       return cell;
   }
   
    
    aScrollCell *cell=[cv dequeueReusableCellWithReuseIdentifier:@"scrollcell" forIndexPath:indexPath];
    
    
    cell.aScrollCity.text=[[aPlaceData objectAtIndex:indexPath.row] objectForKey:@"City"];
    cell.aScrollName.text=[[aPlaceData objectAtIndex:indexPath.row] objectForKey:@"Name"];
    
    
    PFFile *imageFile=[[aPlaceData objectAtIndex:indexPath.row] objectForKey:@"Images"];
    NSLog(@"%@",imageFile.url);
    
    
    [cell.aScrollImage sd_setImageWithURL:[NSURL URLWithString:imageFile.url] placeholderImage:[UIImage imageNamed:@"search.png"]];
    
    
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

    
    
    
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(collectionView.tag==2)
    {
    return CGSizeMake(145, 145);  // will be w120xh100 or w190x100
    }
    return CGSizeMake(320, 210);
    // if the width is higher, only one image will be shown in a line
}




#pragma mark collection view cell paddings
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if(collectionView.tag==2)
    {
    return UIEdgeInsetsMake(10, 10, 5, 10); // top, left, bottom, right
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
    }

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 5.0;
}

- (IBAction)testbarbtn:(UIBarButtonItem *)sender {
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

   
    
    
    UIStoryboard *aStory=[UIStoryboard storyboardWithName:@"Main2" bundle:nil];
    
    PlaceInfo *placeDetail=[aStory instantiateViewControllerWithIdentifier:@"placeinfo"];
    
    placeDetail.array=[aPlaceData objectAtIndex:indexPath.row];
    
    
    [self.navigationController pushViewController:placeDetail animated:YES];


}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    //Remove all objects first.
   // [self sea:_searchtext];

}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    // self.navigationItem.rightBarButtonItem.enabled= NO;
    
    NSLog(@"CLICKED");
    
    //self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [searchBar setShowsCancelButton:YES animated:YES];
    
    
}


-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
      [searchBar setShowsCancelButton:NO animated:YES];
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


- (IBAction)aSearchbaritem:(UIBarButtonItem *)sender {
    
    
    sBar.hidden=FALSE;
    sBar.delegate = self;
    [self.navigationController.navigationBar addSubview:sBar];
    sBar.autoresizingMask = 0;
    [sBar setPlaceholder:@"Search Places"];
    
}


@end
