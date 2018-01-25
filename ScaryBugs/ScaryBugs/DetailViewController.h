//
//  DetailViewController.h
//  ScaryBugs
//
//  Created by Mike Laursen on 1/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWTRateView.h"

@class RWTScaryBugDoc;

@interface DetailViewController : UIViewController <RWTRateViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) RWTScaryBugDoc *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

