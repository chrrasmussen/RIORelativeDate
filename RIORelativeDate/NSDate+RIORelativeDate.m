//
//  NSDate+RIORelativeDate.m
//  RIORelativeDate
//
//  Created by Christian Rasmussen on 10.08.12.
//  Copyright (c) 2012 Rasmussen I/O. All rights reserved.
//

#import "NSDate+RIORelativeDate.h"


@implementation NSDate (RIORelativeDate)

- (BOOL)isTodayRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *sourceComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self];
    NSDateComponents *targetComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:date];
    
    BOOL isToday = (sourceComponents.year == targetComponents.year &&
                    sourceComponents.month == targetComponents.month &&
                    sourceComponents.day == targetComponents.day);
    return isToday;
}

- (BOOL)isYesterdayRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *targetComponents = [[NSDateComponents alloc] init];
    targetComponents.day = -1;
    NSDate *targetDate = [calendar dateByAddingComponents:targetComponents toDate:date options:0];
    
    return [self isTodayRelativeToDate:targetDate inCalendar:calendar];
}

- (BOOL)isTomorrowRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *targetComponents = [[NSDateComponents alloc] init];
    targetComponents.day = +1;
    NSDate *targetDate = [calendar dateByAddingComponents:targetComponents toDate:date options:0];
    
    return [self isTodayRelativeToDate:targetDate inCalendar:calendar];
}


#pragma mark - Convenience methods

- (BOOL)isToday
{
    return [self isTodayRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isYesterday
{
    return [self isYesterdayRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isTomorrow
{
    return [self isTomorrowRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

@end
