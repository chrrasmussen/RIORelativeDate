//
//  RIORelativeDate.h
//  RIORelativeDate
//
//  Created by Christian Rasmussen on 10.08.12.
//  Copyright (c) 2012 Rasmussen I/O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+RIORelativeDate.h"


@interface RIORelativeDate : NSObject

+ (NSString *)descriptionForDateRelativeToNow:(NSDate *)date;

@end
