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
@property (weak, nonatomic) IBOutlet UILabel *TapsLbl;


@property (nonatomic) BOOL isPlaying;
@property (strong, nonatomic) NSNumber *tapsGoal;
@property (strong, nonatomic) NSNumber *taps;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _isPlaying = NO;
    _taps = 0;
    _tapsGoal = [NSNumber numberWithInteger:10];
    _goalStepper.value = 10;
    [self updateUI];
}

- (IBAction)onCoinBtnTapped:(UIButton *)sender {
    int intValue = _taps.intValue;
    _taps = [NSNumber numberWithInteger:++intValue];
    
    if (intValue >= _tapsGoal.intValue) {
        _isPlaying = NO;
    }

    [self updateUI];
}

- (IBAction)onPlayBtnTapped:(UIButton *)sender {
    _isPlaying = YES;
    _taps = [NSNumber numberWithInteger:0];
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
    _TapsLbl.text = [NSString stringWithFormat:@"%d", _taps.intValue];
}

@end
