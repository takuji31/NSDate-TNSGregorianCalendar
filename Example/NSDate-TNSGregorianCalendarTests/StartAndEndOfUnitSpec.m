//
//  StartAndEndOfUnitSpec.m
//  NSDate-TNSGregorianCalendar
//
//  Created by Takuji Nishibayashi on 2014/03/28.
//  Copyright 2014 Takuji Nishibayashi. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <NSDate-TNSDateInitializer/NSDate+TNSDateInitializer.h>
#import "NSDate+TNSGregorianCalendar.h"


SPEC_BEGIN(StartAndEndOfUnitSpec)

describe(@"TNSGregorianCalendar", ^{
    __block NSCalendar *gregorianCalendar;
    __block NSDate *date;
    beforeAll(^{
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        date = [NSDate dateWithYear:2014 month:3 day:28 hour:12 minute:34 second:56 calendar:gregorianCalendar];
    });
    context(@"when created date at start of day", ^{
        it(@"should equal 2014/03/28 00:00:00", ^{
            [[[date dateAtStartOfDay] should] equal:[NSDate dateWithYear:2014 month:3 day:28 calendar:gregorianCalendar]];
        });
    });
    context(@"when created date at end of day", ^{
        it(@"should equal 2014/03/28 23:59:59", ^{
            [[[date dateAtEndOfDay] should] equal:[NSDate dateWithYear:2014 month:3 day:28 hour:23 minute:59 second:59 calendar:gregorianCalendar]];
        });
    });
    context(@"when created date at start of month", ^{
        it(@"should equal 2014/03/01 00:00:00", ^{
            [[[date dateAtStartOfMonth] should] equal:[NSDate dateWithYear:2014 month:3 day:1 calendar:gregorianCalendar]];
        });
    });
    context(@"when created date at end of month", ^{
        it(@"should equal 2014/03/31 23:59:59", ^{
            [[[date dateAtEndOfMonth] should] equal:[NSDate dateWithYear:2014 month:3 day:31 hour:23 minute:59 second:59 calendar:gregorianCalendar]];
        });
    });
    context(@"when created date at start of year", ^{
        it(@"should equal 2014/01/01 00:00:00", ^{
            [[[date dateAtStartOfYear] should] equal:[NSDate dateWithYear:2014 month:1 day:1 calendar:gregorianCalendar]];
        });
    });
    context(@"when created date at end of year", ^{
        it(@"should equal 2014/12/31 23:59:59", ^{
            [[[date dateAtEndOfYear] should] equal:[NSDate dateWithYear:2014 month:12 day:31 hour:23 minute:59 second:59 calendar:gregorianCalendar]];
        });
    });
});

SPEC_END
