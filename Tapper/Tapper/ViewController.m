//
//  ViewController.m
//  Tapper
//
//  Created by Mike Laursen on 10/17/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *coinBtn;
@property (weak, nonatomic) IBOutlet UIButton *PlayBtn;
@property (weak, nonatomic) IBOutlet UITextField *HowManyTapsTxt;

@property (strong, nonatomic) NSNumber *currentTaps;
@property (strong, nonatomic) NSNumber *maxTaps;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _currentTaps = 0;
    _maxTaps = 0;
}

- (IBAction)onCoinBtnTapped:(UIButton *)sender {
}

- (IBAction)onPlayBtnTapped:(UIButton *)sender {
    
}

@end
