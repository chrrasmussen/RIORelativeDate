//
//  RIORelativeDate.m
//  RIORelativeDate
//
//  Created by Christian Rasmussen on 10.08.12.
//  Copyright (c) 2012 Rasmussen I/O. All rights reserved.
//

#import "RIORelativeDate.h"


@implementation RIORelativeDate

+ (NSString *)descriptionForDateRelativeToNow:(NSDate *)date
{
    if ([date isToday]) {
        return NSLocalizedStringFromTable(@"Today", @"RIORelativeDate", nil);
    }
    else if ([date isYesterday]) {
        return NSLocalizedStringFromTable(@"Yesterday", @"RIORelativeDate", nil);
    }
//    else if ([date isTomorrow]) {
////        return NSLocalizedStringFromTable(@"Tomorrow", @"RIORelativeDate", nil);
//    }
//    else if ([date isThisWeek]) {
//        return NSLocalizedStringFromTable(@"This week", @"RIORelativeDate", nil);
//    }
//    else if ([date isLastWeek]) {
//        return NSLocalizedStringFromTable(@"Last week", @"RIORelativeDate", nil);
//    }
//    else if ([date isThisMonth]) {
//        return NSLocalizedStringFromTable(@"This month", @"RIORelativeDate", nil);
//    }
//    else if ([date isLastMonth]) {
//        return NSLocalizedStringFromTable(@"Last month", @"RIORelativeDate", nil);
//    }
//    else if ([date isThisYear]) {
//        return NSLocalizedStringFromTable(@"This year", @"RIORelativeDate", nil);
//    }
//    else if ([date isLastYear]) {
//        return NSLocalizedStringFromTable(@"Last year", @"RIORelativeDate", nil);
//    }
    else {
        return NSLocalizedStringFromTable(@"Older", @"RIORelativeDate", nil);
    }
}

@end
