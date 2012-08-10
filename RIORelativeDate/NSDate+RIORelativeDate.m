//
//  NSDate+RIORelativeDate.m
//  RIORelativeDate
//
//  Created by Christian Rasmussen on 10.08.12.
//  Copyright (c) 2012 Rasmussen I/O. All rights reserved.
//

#import "NSDate+RIORelativeDate.h"


@implementation NSDate (RIORelativeDate)

- (NSString *)relativeDateDescription
{
    // Day
    if ([self isToday]) {
        return NSLocalizedStringFromTable(@"Today", @"RIORelativeDate", nil);
    }
    else if ([self isYesterday]) {
        return NSLocalizedStringFromTable(@"Yesterday", @"RIORelativeDate", nil);
    }
    else if ([self isTomorrow]) {
        return NSLocalizedStringFromTable(@"Tomorrow", @"RIORelativeDate", nil);
    }
    
    // Week
    else if ([self isThisWeek]) {
        return NSLocalizedStringFromTable(@"This week", @"RIORelativeDate", nil);
    }
    else if ([self isLastWeek]) {
        return NSLocalizedStringFromTable(@"Last week", @"RIORelativeDate", nil);
    }
    else if ([self isNextWeek]) {
        return NSLocalizedStringFromTable(@"Next week", @"RIORelativeDate", nil);
    }
    
    // Month
    else if ([self isThisMonth]) {
        return NSLocalizedStringFromTable(@"This month", @"RIORelativeDate", nil);
    }
    else if ([self isLastMonth]) {
        return NSLocalizedStringFromTable(@"Last month", @"RIORelativeDate", nil);
    }
    else if ([self isNextMonth]) {
        return NSLocalizedStringFromTable(@"Next month", @"RIORelativeDate", nil);
    }
    
    // Year
    else if ([self isThisYear]) {
        return NSLocalizedStringFromTable(@"This year", @"RIORelativeDate", nil);
    }
    else if ([self isLastYear]) {
        return NSLocalizedStringFromTable(@"Last year", @"RIORelativeDate", nil);
    }
    else if ([self isNextYear]) {
        return NSLocalizedStringFromTable(@"Next year", @"RIORelativeDate", nil);
    }
    
    // Older
    else {
        return NSLocalizedStringFromTable(@"Older", @"RIORelativeDate", nil);
    }
}

#pragma mark - Day

- (BOOL)isTodayRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *sourceComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:self];
    NSDateComponents *targetComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:date];
    
    return (sourceComponents.year == targetComponents.year &&
            sourceComponents.month == targetComponents.month &&
            sourceComponents.day == targetComponents.day);
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

#pragma mark - Week

- (BOOL)isThisWeekRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *sourceComponents = [calendar components:(NSYearCalendarUnit | NSWeekOfYearCalendarUnit) fromDate:self];
    NSDateComponents *targetComponents = [calendar components:(NSYearCalendarUnit | NSWeekOfYearCalendarUnit) fromDate:date];
    
    return (sourceComponents.year == targetComponents.year &&
            sourceComponents.weekOfYear == targetComponents.weekOfYear);
}

- (BOOL)isLastWeekRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *targetComponents = [[NSDateComponents alloc] init];
    targetComponents.weekOfYear = -1;
    NSDate *targetDate = [calendar dateByAddingComponents:targetComponents toDate:date options:0];
    
    return [self isThisWeekRelativeToDate:targetDate inCalendar:calendar];
}

- (BOOL)isNextWeekRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *targetComponents = [[NSDateComponents alloc] init];
    targetComponents.weekOfYear = +1;
    NSDate *targetDate = [calendar dateByAddingComponents:targetComponents toDate:date options:0];
    
    return [self isThisWeekRelativeToDate:targetDate inCalendar:calendar];
}


#pragma mark - Month

- (BOOL)isThisMonthRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *sourceComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:self];
    NSDateComponents *targetComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit) fromDate:date];
    
    return (sourceComponents.year == targetComponents.year &&
            sourceComponents.month == targetComponents.month);
}

- (BOOL)isLastMonthRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *targetComponents = [[NSDateComponents alloc] init];
    targetComponents.month = -1;
    NSDate *targetDate = [calendar dateByAddingComponents:targetComponents toDate:date options:0];
    
    return [self isThisMonthRelativeToDate:targetDate inCalendar:calendar];
}

- (BOOL)isNextMonthRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *targetComponents = [[NSDateComponents alloc] init];
    targetComponents.month = +1;
    NSDate *targetDate = [calendar dateByAddingComponents:targetComponents toDate:date options:0];
    
    return [self isThisMonthRelativeToDate:targetDate inCalendar:calendar];
}


#pragma mark - Year

- (BOOL)isThisYearRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *sourceComponents = [calendar components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *targetComponents = [calendar components:NSYearCalendarUnit fromDate:date];
    
    return (sourceComponents.year == targetComponents.year);
}

- (BOOL)isLastYearRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *targetComponents = [[NSDateComponents alloc] init];
    targetComponents.year = -1;
    NSDate *targetDate = [calendar dateByAddingComponents:targetComponents toDate:date options:0];
    
    return [self isThisYearRelativeToDate:targetDate inCalendar:calendar];
}

- (BOOL)isNextYearRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    NSDateComponents *targetComponents = [[NSDateComponents alloc] init];
    targetComponents.year = +1;
    NSDate *targetDate = [calendar dateByAddingComponents:targetComponents toDate:date options:0];
    
    return [self isThisYearRelativeToDate:targetDate inCalendar:calendar];
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

- (BOOL)isThisWeek
{
    return [self isThisWeekRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isLastWeek
{
    return [self isLastWeekRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isNextWeek
{
    return [self isNextWeekRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isThisMonth
{
    return [self isThisMonthRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isLastMonth
{
    return [self isLastMonthRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isNextMonth
{
    return [self isNextMonthRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isThisYear
{
    return [self isThisYearRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isLastYear
{
    return [self isLastYearRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

- (BOOL)isNextYear
{
    return [self isNextYearRelativeToDate:[NSDate date] inCalendar:[NSCalendar currentCalendar]];
}

@end
