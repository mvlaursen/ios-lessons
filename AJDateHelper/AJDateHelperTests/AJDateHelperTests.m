//
//  AJDateHelperTests.m
//  AJDateHelperTests
//
//  Created by Mike Laursen on 10/18/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+AJDate.h"

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
    // An NSDate should always be equal to itself.
    NSDate *date = [NSDate date];
    XCTAssert([date isEqualToDateIgnoringTime:date]);
    
    // The distant past and distant future should definitely not be equal.
    NSDate *datePast = [NSDate distantPast];
    NSDate *dateFuture = [NSDate distantFuture];
    XCTAssert(![datePast isEqualToDateIgnoringTime:dateFuture]);
    
    // These are kind of dumb tests, but this framework is just being done as
    // an exercise.
}

@end
