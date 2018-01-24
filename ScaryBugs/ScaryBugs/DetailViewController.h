//
//  DetailViewController.h
//  ScaryBugs
//
//  Created by Mike Laursen on 1/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RWTScaryBugDoc;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) RWTScaryBugDoc *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
