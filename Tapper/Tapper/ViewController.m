//
//  ViewController.m
//  Tapper
//
//  Created by Mike Laursen on 10/17/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *CoinBtn;
@property (weak, nonatomic) IBOutlet UIButton *PlayBtn;
@property (weak, nonatomic) IBOutlet UITextField *HowManyTapsTxt;

@property (nonatomic) BOOL isPlaying;
@property (strong, nonatomic) NSNumber *currentTaps;
@property (strong, nonatomic) NSNumber *maxTaps;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _isPlaying = NO;
    _currentTaps = 0;
    _maxTaps = 0;
    [self updateUI];
}

- (IBAction)onCoinBtnTapped:(UIButton *)sender {
}

- (IBAction)onPlayBtnTapped:(UIButton *)sender {
    _isPlaying = YES;
    [self updateUI];
}

- (void)updateUI {
    if (_isPlaying) {
        _CoinBtn.enabled = YES;
        _CoinBtn.hidden = NO;
        _PlayBtn.enabled = NO;
        _PlayBtn.hidden = YES;
    } else {
        _CoinBtn.enabled = NO;
        _CoinBtn.hidden = YES;
        _PlayBtn.enabled = YES;
        _PlayBtn.hidden = NO;
    }
}

@end
