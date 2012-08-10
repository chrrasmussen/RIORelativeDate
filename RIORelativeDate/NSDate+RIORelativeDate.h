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
- (NSString *)relativeDateDescriptionRelativeToDate:(NSDate *)date;
- (NSString *)relativeDateDescriptionRelativeToDate:(NSDate *)date inCalendar:(NSCalendar *)calendar;

@end
