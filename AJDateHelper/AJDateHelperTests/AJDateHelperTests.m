//
//  AJDateHelperTests.m
//  AJDateHelperTests
//
//  Created by Mike Laursen on 10/18/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+AJDate.h"

const NSTimeInterval kTimeIntervalOneDay = 86400.0;
const NSTimeInterval kTimeIntervalOneWeek = 604800.0;

@interface AJDateHelperTests : XCTestCase
@end

@implementation AJDateHelperTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testIsEqualToDateIgnoringTime {
    NSDate *now = [NSDate date];
    XCTAssert([now isEqualToDateIgnoringTime:now]);
    
    // This test could fail if it executes exactly when the day is changing.
    NSDate *almostNow = [now dateByAddingTimeInterval:1.0];
    XCTAssert([now isEqualToDateIgnoringTime:almostNow]);
    
    NSDate *datePast = [NSDate distantPast];
    NSDate *dateFuture = [NSDate distantFuture];
    XCTAssertFalse([datePast isEqualToDateIgnoringTime:dateFuture]);
}

- (void)testIsToday {
    NSDate *now = [NSDate date];
    XCTAssert([now isToday]);
    
    NSDate *yesterday = [now dateByAddingTimeInterval:-kTimeIntervalOneDay];
    XCTAssertFalse([yesterday isToday]);
}

- (void)testIsTomorrow {
    NSDate *now = [NSDate date];
    XCTAssertFalse([now isTomorrow]);
    
    NSDate *tomorrow = [now dateByAddingTimeInterval:kTimeIntervalOneDay];
    XCTAssert([tomorrow isTomorrow]);
}

- (void)testIsYesterday {
    NSDate *now = [NSDate date];
    XCTAssertFalse([now isYesterday]);
    
    NSDate *yesterday = [now dateByAddingTimeInterval:-kTimeIntervalOneDay];
    XCTAssert([yesterday isYesterday]);
}

- (void)testIsSameWeekAsDate {
    NSDate *now = [NSDate date];
    XCTAssert([now isSameWeekAsDate:now]);
    
    // This test could fail if it executes exactly when the week is changing.
    NSDate *almostNow = [now dateByAddingTimeInterval:1.0];
    XCTAssert([now isSameWeekAsDate:almostNow]);

    NSDate *oneWeekFromNow = [now dateByAddingTimeInterval:kTimeIntervalOneWeek];
    XCTAssertFalse([now isSameWeekAsDate:oneWeekFromNow]);
}

@end
