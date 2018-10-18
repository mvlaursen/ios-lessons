//
//  ViewController.m
//  Tapper
//
//  Created by Mike Laursen on 10/17/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *goalStepper;
@property (weak, nonatomic) IBOutlet UITextField *goalTxtFld;
@property (weak, nonatomic) IBOutlet UIButton *CoinBtn;
@property (weak, nonatomic) IBOutlet UIButton *PlayBtn;


@property (nonatomic) BOOL isPlaying;
@property (strong, nonatomic) NSNumber *currentTaps;
@property (strong, nonatomic) NSNumber *tapsGoal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _isPlaying = NO;
    _currentTaps = 0;
    _tapsGoal = [NSNumber numberWithInteger:10];
    _goalStepper.value = 10;
    [self updateUI];
}

- (IBAction)onCoinBtnTapped:(UIButton *)sender {
    if (_tapsGoal.intValue < 0)
        _tapsGoal = [NSNumber numberWithInteger:10];
    
    int intValue = _currentTaps.intValue;
    intValue++;
    _currentTaps = [NSNumber numberWithInteger:intValue];
    
    if (_currentTaps >= _tapsGoal) {
        _isPlaying = NO;
        [self updateUI];
    }
}

- (IBAction)onPlayBtnTapped:(UIButton *)sender {
    _isPlaying = YES;
    [self updateUI];
}

- (IBAction)onStepperValueChanged:(UIStepper *)sender {
    _tapsGoal = [NSNumber numberWithInteger:sender.value];
    [self updateUI];
}

#pragma mark Utility

- (void)updateUI {
    if (_isPlaying) {
        _CoinBtn.enabled = YES;
        _CoinBtn.hidden = NO;
        _PlayBtn.enabled = NO;
        _PlayBtn.hidden = YES;
        _goalStepper.enabled = NO;
    } else {
        _CoinBtn.enabled = NO;
        _CoinBtn.hidden = YES;
        _PlayBtn.enabled = YES;
        _PlayBtn.hidden = NO;
        _goalStepper.enabled = YES;
    }
    
    _goalStepper.value = _tapsGoal.intValue;
    _goalTxtFld.text = [NSString stringWithFormat:@"%d", _tapsGoal.intValue];
}

@end
