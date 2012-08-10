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
    
    // Choosing an arbitrary date (Norwegian Constitution Day in this case)
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
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertTrue([date isTodayRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 16}];
    STAssertFalse([date isTodayRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 18}];
    STAssertFalse([date isTodayRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testYesterday
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 16}];
    STAssertTrue([date isYesterdayRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 15}];
    STAssertFalse([date isYesterdayRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertFalse([date isYesterdayRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testTomorrow
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 18}];
    STAssertTrue([date isTomorrowRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertFalse([date isTomorrowRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 19}];
    STAssertFalse([date isTomorrowRelativeToDate:self.today inCalendar:self.gregorian], nil);
}


#pragma mark - Week

- (void)testThisWeek
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertTrue([date isThisWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 14}];
    STAssertTrue([date isThisWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 13}];
    STAssertFalse([date isThisWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 20}];
    STAssertTrue([date isThisWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 21}];
    STAssertFalse([date isThisWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testLastWeek
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 10}];
    STAssertTrue([date isLastWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 7}];
    STAssertTrue([date isLastWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 6}];
    STAssertFalse([date isLastWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 13}];
    STAssertTrue([date isLastWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 14}];
    STAssertFalse([date isLastWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testNextWeek
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 24}];
    STAssertTrue([date isNextWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 21}];
    STAssertTrue([date isNextWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 20}];
    STAssertFalse([date isNextWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 27}];
    STAssertTrue([date isNextWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 28}];
    STAssertFalse([date isNextWeekRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

#pragma mark - Month

- (void)testThisMonth
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertTrue([date isThisMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 1}];
    STAssertTrue([date isThisMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 4, 30}];
    STAssertFalse([date isThisMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 31}];
    STAssertTrue([date isThisMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 6, 1}];
    STAssertFalse([date isThisMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testLastMonth
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 4, 17}];
    STAssertTrue([date isLastMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 4, 1}];
    STAssertTrue([date isLastMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 3, 31}];
    STAssertFalse([date isLastMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 4, 30}];
    STAssertTrue([date isLastMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 1}];
    STAssertFalse([date isLastMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testNextMonth
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 6, 17}];
    STAssertTrue([date isNextMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 6, 1}];
    STAssertTrue([date isNextMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 31}];
    STAssertFalse([date isNextMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 6, 30}];
    STAssertTrue([date isNextMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 7, 1}];
    STAssertFalse([date isNextMonthRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

#pragma mark - Year

- (void)testThisYear
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2000, 5, 17}];
    STAssertTrue([date isThisYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 1, 1}];
    STAssertTrue([date isThisYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){1999, 12, 31}];
    STAssertFalse([date isThisYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 12, 31}];
    STAssertTrue([date isThisYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2001, 1, 1}];
    STAssertFalse([date isThisYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testLastYear
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){1999, 5, 17}];
    STAssertTrue([date isLastYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){1999, 4, 30}];
    STAssertTrue([date isLastYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){1998, 12, 31}];
    STAssertFalse([date isLastYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){1999, 12, 31}];
    STAssertTrue([date isLastYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 1, 1}];
    STAssertFalse([date isLastYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testNextYear
{
    NSDate *date = nil;
    
    date = [self dateWithComponents:(RIODateComponents){2001, 5, 17}];
    STAssertTrue([date isNextYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2001, 1, 1}];
    STAssertTrue([date isNextYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2000, 12, 31}];
    STAssertFalse([date isNextYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2001, 12, 31}];
    STAssertTrue([date isNextYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
    
    date = [self dateWithComponents:(RIODateComponents){2002, 1, 1}];
    STAssertFalse([date isNextYearRelativeToDate:self.today inCalendar:self.gregorian], nil);
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
