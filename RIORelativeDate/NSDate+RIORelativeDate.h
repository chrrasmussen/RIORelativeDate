//
//  NSDate+RIORelativeDate.h
//  RIORelativeDate
//
//  Created by Christian Rasmussen on 10.08.12.
//  Copyright (c) 2012 Rasmussen I/O. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (RIORelativeDate)

- (NSString *)relativeDateDescription;

- (BOOL)isTodayRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isYesterdayRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isTomorrowRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isThisWeekRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isLastWeekRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isNextWeekRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isThisMonthRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isLastMonthRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isNextMonthRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isThisYearRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isLastYearRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isNextYearRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;

// Convenience methods
- (BOOL)isToday;
- (BOOL)isYesterday;
- (BOOL)isTomorrow;
- (BOOL)isThisWeek;
- (BOOL)isLastWeek;
- (BOOL)isNextWeek;
- (BOOL)isThisMonth;
- (BOOL)isLastMonth;
- (BOOL)isNextMonth;
- (BOOL)isThisYear;
- (BOOL)isLastYear;
- (BOOL)isNextYear;

@end
