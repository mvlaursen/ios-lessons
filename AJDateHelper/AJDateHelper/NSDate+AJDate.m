//
//  NSDate+AJDate.m
//  AJDateHelper
//
//  Created by Mike Laursen on 10/18/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "NSDate+AJDate.h"

@implementation NSDate (AJDate)


/**
 Returns true if dates are equal while ignoring time.
 
 - Parameter date: The Date to compare.
 */
- (BOOL)isEqualToDateIgnoringTime: (NSDate *)date {
    NSDateComponents *comp1 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
    NSDateComponents *comp2 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    return ((comp1.year == comp2.year) && (comp1.month == comp2.month) && (comp1.day == comp2.day));
}

@end
