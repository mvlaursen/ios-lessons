//
//  NSDate+AJDate.h
//  AJDateHelper
//
//  Created by Mike Laursen on 10/18/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

// Based on the popular Swift library, AFDateHelper. I am porting parts of
// AFDateHelper as an exercise in learnig to port Swift code to Objective-C.

#import <Foundation/Foundation.h>

// TODO: Why was this added automatically?
NS_ASSUME_NONNULL_BEGIN

@interface NSDate (AJDate)

#pragma mark Comparing Dates

// TODO: Port the comment from Swift.
- (BOOL)isEqualToDateIgnoringTime: (NSDate *)date;

@end

NS_ASSUME_NONNULL_END

