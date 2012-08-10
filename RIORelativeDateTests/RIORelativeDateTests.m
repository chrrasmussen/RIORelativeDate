//
//  RIORelativeDateTests.m
//  RIORelativeDateTests
//
//  Created by Christian Rasmussen on 10.08.12.
//  Copyright (c) 2012 Rasmussen I/O. All rights reserved.
//

#import "RIORelativeDateTests.h"
#import "RIORelativeDate.h"


@implementation RIORelativeDateTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    // Choosing a date in the middle of the year
    NSDateComponents *todayComponents = [[NSDateComponents alloc] init];
    todayComponents.year = 2000;
    todayComponents.month = 5;
    todayComponents.day = 4;
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
    STAssertTrue([self.today isTodayRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testYesterday
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = -4;
    NSDate *date = [self.gregorian dateByAddingComponents:components toDate:self.today options:0];
    
//    NSDateComponents *diff = [self.gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekOfYearCalendarUnit | NSDayCalendarUnit) fromDate:date];
//    NSDateComponents *diff2 = [self.gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekOfYearCalendarUnit | NSDayCalendarUnit) fromDate:self.today];
//    NSLog(@"y:%d m:%d w:%d d:%d", diff.year, diff.month, diff.weekOfYear, diff.day);
//    NSLog(@"y:%d m:%d w:%d d:%d", diff2.year, diff2.month, diff2.weekOfYear, diff2.day);
    
    STAssertTrue([date isYesterdayRelativeToDate:self.today inCalendar:self.gregorian], nil);
}

- (void)testTomorrow
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = +1;
    NSDate *date = [self.gregorian dateByAddingComponents:components toDate:self.today options:0];
    
    STAssertTrue([date isTomorrowRelativeToDate:self.today inCalendar:self.gregorian], nil);
}


#pragma mark - Week

- (void)testThisWeek
{
    
}

- (void)testLastWeek
{
    
}

- (void)testNextWeek
{
    
}

#pragma mark - Month

#pragma mark - Year

- (void)testLastYear
{
//    NSDateComponents *lastYearComponents = [[NSDateComponents alloc] init];
//    lastYearComponents.year = -1;
//    NSDate *lastYear = [self.gregorian dateByAddingComponents:lastYearComponents toDate:self.today options:<#(NSUInteger)#>]
//    
//    STAssertTrue([lastYear isLastYearComparedToDate:self.today], @"");
}

@end
