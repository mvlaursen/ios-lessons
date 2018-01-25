//
//  DetailViewController.m
//  ScaryBugs
//
//  Created by Mike Laursen on 1/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

#import "DetailViewController.h"
#import "RWTRateView.h"
#import "RWTScaryBugDoc.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet RWTRateView *rateView;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
- (IBAction)titleFieldTextChanged:(id)sender;

@end

@implementation DetailViewController

- (void)configureView {
    self.rateView.notSelectedImage = [UIImage imageNamed:@"shockedface2_empty.png"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"shockedface2_half.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"shockedface2_full.png"];
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    
    // Update the user interface for the detail item.
    if (self.detailItem) {
        RWTScaryBugDoc *bug = self.detailItem;
        self.detailDescriptionLabel.text = bug.title;
        self.imageView.image = bug.fullImage;
        self.rateView.rating = bug.rating;
        self.titleField.text = bug.title;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(RWTScaryBugDoc *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


- (IBAction)titleFieldTextChanged:(id)sender {
    self.detailItem.title = self.titleField.text;
}

#pragma mark RWTRateViewDelegate

- (void)rateView:(RWTRateView *)rateView ratingDidChange:(float)rating {
    self.detailItem.rating = rating;
}

@end
