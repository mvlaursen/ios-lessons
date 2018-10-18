//
//  ViewController.m
//  Tapper
//
//  Created by Mike Laursen on 10/17/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *HowManyTapsTxt;
@property (strong, nonatomic) NSNumber *tapCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tapCount = 0;
    self.HowManyTapsTxt.text = [NSString stringWithFormat:@"%d", self.tapCount.intValue];
}

- (IBAction)onPlayBtnTapped:(UIButton *)sender {
    int tapCount = self.tapCount.intValue;
    tapCount++;
    self.tapCount = [NSNumber numberWithInteger:tapCount];
    self.HowManyTapsTxt.text = [NSString stringWithFormat:@"%d", self.tapCount.intValue];
}

@end
