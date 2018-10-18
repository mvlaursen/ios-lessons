//
//  TapperUITests.m
//  TapperUITests
//
//  Created by Mike Laursen on 10/17/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TapperUITests : XCTestCase

@end

@implementation TapperUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testStepper {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *goalStepper = app.steppers[@"goal_stepper"];
    XCUIElement *goalTextEdit = app.textFields[@"goal_text_field"];
    
    XCTAssert([self tapsGoal:goalTextEdit] == 10);
    
    XCUIElement *incrementButton = goalStepper.buttons[@"Increment"];
    for (int i = 0; i < 11; i++)
        [incrementButton tap];

    XCTAssert([self tapsGoal:goalTextEdit] == 20);
}

#pragma mark Utility

- (int)tapsGoal: (XCUIElement *)goalTextEdit {
    NSString *goalText = (NSString *)goalTextEdit.value;
    int tapsGoal = goalText.intValue;
    return tapsGoal;
}

@end
