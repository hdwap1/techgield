//
//  Addnewtrip.h
//  SidebarDemo
//
//  Created by indianic on 13/08/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownPicker.h"
#import <Parse/Parse.h>

<<<<<<< HEAD
@interface Addnewtrip : UIViewController <UIScrollViewDelegate, UITextFieldDelegate>
=======
@interface Addnewtrip : UIViewController <UIScrollViewDelegate>
{
    PFObject *AddTripObj;
}
>>>>>>> 506553899d4e3830b754992c2cf585dcc496a65c

@property (strong, nonatomic) DownPicker *downPicker;
@property (weak, nonatomic) IBOutlet UITextField *Addtripstate;
@property (weak, nonatomic) IBOutlet UITextField *Addtripcity;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *Addtripbarbtn;
- (IBAction)Addtripbarbtnaction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UILabel *Placenameoutlet;
@property (weak, nonatomic) IBOutlet UILabel *Placestateoutlet;
@property (weak, nonatomic) IBOutlet UILabel *Placecityoutlet;
@property (weak, nonatomic) IBOutlet UILabel *Aboutplaceoutlet;
@property (weak, nonatomic) IBOutlet UITextView *Addtriptextview;
- (IBAction)Uploadtripbtnaction:(UIButton *)sender;

- (IBAction)Uploadimagebtnaction:(UIButton *)sender;
@property (strong,nonatomic)PFObject *obj;
@property (weak, nonatomic) IBOutlet UIImageView *addTripImage;
@property (weak, nonatomic) IBOutlet UITextField *addTripName;


@end
