//
//  ObjectiveCPlaygoundTests.m
//  ObjectiveCPlaygoundTests
//
//  Created by Mike Laursen on 10/15/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ObjectiveCPlaygoundTests : XCTestCase

@end

// ===== Stuff that would go in .h files =====

@protocol Ratable <NSObject>

@property (readonly) NSNumber *rating;

@end

@interface Foo: NSObject <Ratable>

@end

// ===== Stuff that would go in .m files s=====

@implementation Foo

- (NSNumber *)rating {
    NSNumber *rating = [NSNumber numberWithInt:5];
    return rating;
}

@end

@implementation ObjectiveCPlaygoundTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    Foo *foo = [[Foo alloc] init];
    NSNumber *rating = [foo rating];
    NSLog(@"====> %ld <=====", rating.integerValue);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
