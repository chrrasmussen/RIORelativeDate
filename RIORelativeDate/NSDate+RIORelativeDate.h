//
//  NSDate+RIORelativeDate.h
//  RIORelativeDate
//
//  Created by Christian Rasmussen on 10.08.12.
//  Copyright (c) 2012 Rasmussen I/O. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (RIORelativeDate)

- (BOOL)isTodayRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isYesterdayRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
- (BOOL)isTomorrowRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;
//- (BOOL)isThisWeekRelativeToDate:(NSDate *)date;
//- (BOOL)isLastWeekRelativeToDate:(NSDate *)date;
//- (BOOL)isNextWeekRelativeToDate:(NSDate *)date;
//- (BOOL)isThisMonthRelativeToDate:(NSDate *)date;
//- (BOOL)isLastMonthRelativeToDate:(NSDate *)date;
//- (BOOL)isNextMonthRelativeToDate:(NSDate *)date;
//- (BOOL)isThisYearRelativeToDate:(NSDate *)date;
//- (BOOL)isLastYearRelativeToDate:(NSDate *)date;
//- (BOOL)isNextYearRelativeToDate:(NSDate *)date;

// Convenience methods
- (BOOL)isToday;
- (BOOL)isYesterday;
- (BOOL)isTomorrow;
//- (BOOL)isThisWeek;
//- (BOOL)isLastWeek;
//- (BOOL)isNextWeek;
//- (BOOL)isThisMonth;
//- (BOOL)isLastMonth;
//- (BOOL)isNextMonth;
//- (BOOL)isThisYear;
//- (BOOL)isLastYear;
//- (BOOL)isNextYear;

@end
