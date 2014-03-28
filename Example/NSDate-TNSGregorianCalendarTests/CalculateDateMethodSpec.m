//
//  CalculateDateMethodSpec.m
//  NSDate-TNSGregorianCalendar
//
//  Created by Takuji Nishibayashi on 2014/03/28.
//  Copyright 2014 Takuji Nishibayashi. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <NSDate-TNSDateInitializer/NSDate+TNSDateInitializer.h>
#import "NSDate+TNSGregorianCalendar.h"


SPEC_BEGIN(CalculateDateMethodSpec)

describe(@"TNSGregorianCalendar", ^{
    __block NSCalendar *gregorianCalendar;
    __block NSDate *now;
    beforeAll(^{
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        now = [NSDate dateWithYear:2014 month:3 day:28 hour:12 minute:34 second:56 calendar:gregorianCalendar];
    });
    beforeEach(^{
        [NSDate stub:@selector(date) andReturn:now];
    });
    afterEach(^{
        [NSDate performSelector:@selector(clearStubs)];
    });
    context(@"when truncated to minute", ^{
        it(@"should truncated seconds", ^{
            [[[[NSDate date] dateTruncatedTo:TNSGregorianCalendarTruncateUnitMinute] should] equal:[NSDate dateWithYear:2014 month:3 day:28 hour:12 minute:34 second:0 calendar:gregorianCalendar]];
        });
    });
    context(@"when truncated to hour", ^{
        it(@"should truncated minute and seconds", ^{
            [[[[NSDate date] dateTruncatedTo:TNSGregorianCalendarTruncateUnitHour] should] equal:[NSDate dateWithYear:2014 month:3 day:28 hour:12 minute:0 second:0 calendar:gregorianCalendar]];
        });
    });
    context(@"when truncated to day", ^{
        it(@"should truncated hour, minute and seconds", ^{
            [[[[NSDate date] dateTruncatedTo:TNSGregorianCalendarTruncateUnitDay] should] equal:[NSDate dateWithYear:2014 month:3 day:28 hour:0 minute:0 second:0 calendar:gregorianCalendar]];
        });
    });
    context(@"when truncated to month", ^{
        it(@"should truncated day, hour, minute and seconds", ^{
            [[[[NSDate date] dateTruncatedTo:TNSGregorianCalendarTruncateUnitMonth] should] equal:[NSDate dateWithYear:2014 month:3 day:1 hour:0 minute:0 second:0 calendar:gregorianCalendar]];
        });
    });
    context(@"when truncated to year", ^{
        it(@"should truncated month, day, hour, minute and seconds", ^{
            [[[[NSDate date] dateTruncatedTo:TNSGregorianCalendarTruncateUnitYear] should] equal:[NSDate dateWithYear:2014 month:1 day:1 hour:0 minute:0 second:0 calendar:gregorianCalendar]];
        });
    });
});

SPEC_END
