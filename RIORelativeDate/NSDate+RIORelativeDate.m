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
    return [self relativeDateDescriptionRelativeToDate:[NSDate date]];
}

- (NSString *)relativeDateDescriptionRelativeToDate:(NSDate *)date
{
    return [self relativeDateDescriptionRelativeToDate:date inCalendar:[NSCalendar currentCalendar]];
}

- (NSString *)relativeDateDescriptionRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar
{
    // Day
    if ([self isTodayRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"Today", @"RIORelativeDate", nil);
    }
    else if ([self isYesterdayRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"Yesterday", @"RIORelativeDate", nil);
    }
    else if ([self isTomorrowRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"Tomorrow", @"RIORelativeDate", nil);
    }
    
    // Week
    else if ([self isThisWeekRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"This week", @"RIORelativeDate", nil);
    }
    else if ([self isLastWeekRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"Last week", @"RIORelativeDate", nil);
    }
    else if ([self isNextWeekRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"Next week", @"RIORelativeDate", nil);
    }
    
    // Month
    else if ([self isThisMonthRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"This month", @"RIORelativeDate", nil);
    }
    else if ([self isLastMonthRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"Last month", @"RIORelativeDate", nil);
    }
    else if ([self isNextMonthRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"Next month", @"RIORelativeDate", nil);
    }
    
    // Year
    else if ([self isThisYearRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"This year", @"RIORelativeDate", nil);
    }
    else if ([self isLastYearRelativeToDate:date inCalendar:calendar]) {
        return NSLocalizedStringFromTable(@"Last year", @"RIORelativeDate", nil);
    }
    else if ([self isNextYearRelativeToDate:date inCalendar:calendar]) {
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

@end
