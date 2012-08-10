//
//  RIORelativeDateTests.m
//  RIORelativeDateTests
//
//  Created by Christian Rasmussen on 10.08.12.
//  Copyright (c) 2012 Rasmussen I/O. All rights reserved.
//

#import "RIORelativeDateTests.h"
#import "RIORelativeDate.h"


typedef struct {
    NSInteger year;
    NSInteger month;
    NSInteger day;
} RIODateComponents;


@implementation RIORelativeDateTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    // Choosing a date in the middle of the year
    self.today = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


#pragma mark - Day

- (void)testToday
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertTrue([date isTodayRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testYesterday
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 5, 16}];
    STAssertTrue([date isYesterdayRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testTomorrow
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 5, 18}];
    STAssertTrue([date isTomorrowRelativeToDate:self.today inCalendar:self.gregorian], nil);
}


#pragma mark - Week

- (void)testThisWeek
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertTrue([date isThisWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testLastWeek
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 5, 10}];
    STAssertTrue([date isLastWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testNextWeek
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 5, 24}];
    STAssertTrue([date isNextWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

#pragma mark - Month

- (void)testThisMonth
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertTrue([date isThisMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testLastMonth
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 4, 17}];
    STAssertTrue([date isLastMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testNextMonth
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 6, 17}];
    STAssertTrue([date isNextMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

#pragma mark - Year

- (void)testThisYear
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertTrue([date isThisYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testLastYear
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){1999, 5, 17}];
    STAssertTrue([date isLastYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testNextYear
{
    NSDate *date = [self dateWithComponents:(RIODateComponents){2001, 5, 17}];
    STAssertTrue([date isNextYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
}


#pragma mark - Private methods

- (NSDate *)dateWithComponents:(RIODateComponents)dateComponents
{
    NSDateComponents *todayComponents = [[NSDateComponents alloc] init];
    todayComponents.year = dateComponents.year;
    todayComponents.month = dateComponents.month;
    todayComponents.day = dateComponents.day;
    return [self.gregorian dateFromComponents:todayComponents];
}

@end
