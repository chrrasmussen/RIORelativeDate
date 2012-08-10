//
//  RIORelativeDateTests.m
//  RIORelativeDateTests
//
//  Created by Christian Rasmussen on 10.08.12.
//  Copyright (c) 2012 Rasmussen I/O. All rights reserved.
//

#import "RIORelativeDateTests.h"
#import "RIORelativeDate.h"


#define RIOAssertDate(YEAR, MONTH, DAY, EXPECTED_RESULT) \
do { \
    NSDateComponents *todayComponents = [[NSDateComponents alloc] init]; \
    todayComponents.year = YEAR; \
    todayComponents.month = MONTH; \
    todayComponents.day = DAY; \
    NSDate *date = [self.gregorian dateFromComponents:todayComponents]; \
    STAssertEqualObjects([date relativeDateDescriptionRelativeToDate:self.today inCalendar:self.gregorian], EXPECTED_RESULT, nil); \
} while (0);


@implementation RIORelativeDateTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    // Choosing an arbitrary date (Norwegian Constitution Day in this case)
    NSDateComponents *todayComponents = [[NSDateComponents alloc] init];
    todayComponents.year = 2000;
    todayComponents.month = 5;
    todayComponents.day = 17;
    self.today = [self.gregorian dateFromComponents:todayComponents];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


#pragma mark - Day

- (void)testToday
{
    RIOAssertDate(2000, 5, 17, @"Today");
}

- (void)testYesterday
{
    RIOAssertDate(2000, 5, 16, @"Yesterday");
}

- (void)testTomorrow
{
    RIOAssertDate(2000, 5, 18, @"Tomorrow");
}


#pragma mark - Week

- (void)testThisWeek
{
    RIOAssertDate(2000, 5, 14, @"This week");
    RIOAssertDate(2000, 5, 20, @"This week");
}

- (void)testLastWeek
{
    RIOAssertDate(2000, 5, 10, @"Last week");
    RIOAssertDate(2000, 5, 7, @"Last week");
    RIOAssertDate(2000, 5, 13, @"Last week");
}

- (void)testNextWeek
{
    RIOAssertDate(2000, 5, 24, @"Next week");
    RIOAssertDate(2000, 5, 21, @"Next week");
    RIOAssertDate(2000, 5, 27, @"Next week");
}


#pragma mark - Month

- (void)testThisMonth
{
    RIOAssertDate(2000, 5, 1, @"This month");
    RIOAssertDate(2000, 5, 31, @"This month");
}

- (void)testLastMonth
{
    RIOAssertDate(2000, 4, 1, @"Last month");
    RIOAssertDate(2000, 4, 17, @"Last month");
    RIOAssertDate(2000, 4, 30, @"Last month");
}

- (void)testNextMonth
{
    RIOAssertDate(2000, 6, 1, @"Next month");
    RIOAssertDate(2000, 6, 17, @"Next month");
    RIOAssertDate(2000, 6, 30, @"Next month");
}


#pragma mark - Year

- (void)testThisYear
{
    RIOAssertDate(2000, 1, 1, @"This year");
    RIOAssertDate(2000, 12, 31, @"This year");
}

- (void)testLastYear
{
    RIOAssertDate(1999, 1, 1, @"Last year");
    RIOAssertDate(1999, 5, 17, @"Last year");
    RIOAssertDate(1999, 12, 31, @"Last year");
}

- (void)testNextYear
{
    RIOAssertDate(2001, 1, 1, @"Next year");
    RIOAssertDate(2001, 5, 17, @"Next year");
    RIOAssertDate(2001, 12, 31, @"Next year");
}


#pragma mark - Out of range

- (void)testOlder
{
    RIOAssertDate(1998, 12, 31, @"Older");
}

- (void)testNewer
{
    RIOAssertDate(2002, 1, 1, @"Newer");
}

@end
