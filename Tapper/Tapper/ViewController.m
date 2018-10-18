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
    
    _HowManyTapsTxt.delegate = self;
    _isPlaying = NO;
    _currentTaps = 0;
    _maxTaps = 0;
    [self updateUI];
}

- (IBAction)onCoinBtnTapped:(UIButton *)sender {
    if (_maxTaps.intValue < 0)
        _maxTaps = [NSNumber numberWithInteger:10];
    
    int intValue = _currentTaps.intValue;
    intValue++;
    _currentTaps = [NSNumber numberWithInteger:intValue];
    
    if (_currentTaps >= _maxTaps) {
        _isPlaying = NO;
        [self updateUI];
    }
}

- (IBAction)onHowManyTapsDidEndOnExit:(UITextField *)sender {
    // It would be better to use a Stepper control, but the assignment is to
    // convert the Swift app as it was written.
    
    // If the contents of the text field cannot be converted to a double, zero
    // is returned.
    
    double doubleValue = [sender.text doubleValue];
    int intValue = floor(doubleValue);
    _maxTaps = [NSNumber numberWithInteger:intValue];
    _HowManyTapsTxt.text = [self formatMaxTaps];
}

- (IBAction)onPlayBtnTapped:(UIButton *)sender {
    _isPlaying = YES;
    [self updateUI];
}

#pragma mark Utility

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

- (NSString *)formatMaxTaps {
    int intValue = _maxTaps.intValue;
    
    if (intValue > 0)
        return [NSString stringWithFormat:@"%d", intValue];
    else
        return @"How many taps to win?";
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    _HowManyTapsTxt.text = [self formatMaxTaps];
    return YES;
}

@end
