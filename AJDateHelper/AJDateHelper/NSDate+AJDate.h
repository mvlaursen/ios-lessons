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

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (AJDate)

#pragma mark Comparing Dates

/*
 Returns true if dates are equal, ignoring time of day.
 @param NSDate to compare
 @return YES if dates are equal, ignoring time of day
 */
- (BOOL)isEqualToDateIgnoringTime: (NSDate *)date;

@end

NS_ASSUME_NONNULL_END

