//
//  NSDate+AJDate.m
//  AJDateHelper
//
//  Created by Mike Laursen on 10/18/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

#import "NSDate+AJDate.h"

const NSTimeInterval kTimeIntervalOneDay = 86400.0;
const NSTimeInterval kTimeIntervalOneWeek = 604800.0;

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

- (BOOL)isToday {
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)isTomorrow {
    return [self isEqualToDateIgnoringTime:[[NSDate date] dateByAddingTimeInterval:kTimeIntervalOneDay]];
}

- (BOOL)isYesterday {
    return [self isEqualToDateIgnoringTime:[[NSDate date] dateByAddingTimeInterval:-kTimeIntervalOneDay]];
}

- (BOOL)isSameWeekAsDate: (NSDate *)date {
    NSDateComponents *comp1 = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self];
    NSDateComponents *comp2 = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    
    // Must be the same week. 12/31 and 1/1 will both be week "1" if they are
    // in the same week.
    if (comp1.weekOfYear != comp2.weekOfYear)
        return NO;
    
    // Must have a time interval less than one week.
    return abs([self timeIntervalSinceDate:date] < kTimeIntervalOneWeek);
}

@end
