//
//  ViewController.m
//  ThrowawayDateTest
//
//  Created by Mike Laursen on 10/18/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "ViewController.h"
#import <AJDateHelper/AJDateHelper.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDate *date = [NSDate date];
    BOOL isEqual = [date isEqualToDateIgnoringTime:date];
    BOOL isEqual2 = isEqual;
}


@end
