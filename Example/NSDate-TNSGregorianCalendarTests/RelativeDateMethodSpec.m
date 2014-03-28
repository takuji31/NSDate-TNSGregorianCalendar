//
//  RelativeDateMethodSpec.m
//  NSDate-TNSGregorianCalendar
//
//  Created by Takuji Nishibayashi on 2014/03/28.
//  Copyright 2014 Takuji Nishibayashi. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <NSDate-TNSDateInitializer/NSDate+TNSDateInitializer.h>
#import "NSDate+TNSGregorianCalendar.h"


SPEC_BEGIN(RelativeDateMethodSpec)

describe(@"TNSGregorianCalendar", ^{
    __block NSCalendar *gregorianCalendar;
    __block NSDate *now;
    __block NSDate* date;
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
    context(@"when today created", ^{
        beforeAll(^{
            date = [NSDate dateToday];
        });
        it(@"should times truncated", ^{
            [[date should] equal:[NSDate dateWithYear:2014 month:3 day:28 calendar:gregorianCalendar]];
        });
    });
    context(@"when yesterday created", ^{
        beforeAll(^{
            date = [NSDate dateYesterday];
        });
        it(@"should be yesterday", ^{
            [[date should] equal:[NSDate dateWithYear:2014 month:3 day:27 calendar:gregorianCalendar]];
        });
    });
    context(@"when tommorow created", ^{
        beforeAll(^{
            date = [NSDate dateTomorrow];
        });
        it(@"should be tommorow", ^{
            [[date should] equal:[NSDate dateWithYear:2014 month:3 day:29 calendar:gregorianCalendar]];
        });
    });
    context(@"when end of day created", ^{
        beforeAll(^{
            date = [NSDate dateEndOfToday];
        });
        it(@"should be end of day", ^{
            [[date should] equal:[NSDate dateWithYear:2014 month:3 day:28 hour:23 minute:59 second:59 calendar:gregorianCalendar]];
        });
    });
    context(@"when 1 minute added", ^{
        it(@"should be 2014/3/28 12:35:56", ^{
            [[[[NSDate date] dateByAddingMinutes:1] should] equal:[NSDate dateWithYear:2014 month:3 day:28 hour:12 minute:35 second:56 calendar:gregorianCalendar]];
        });
    });
    context(@"when 1 hour added", ^{
        it(@"should be 2014/3/28 13:34:56", ^{
            [[[[NSDate date] dateByAddingHours:1] should] equal:[NSDate dateWithYear:2014 month:3 day:28 hour:13 minute:34 second:56 calendar:gregorianCalendar]];
        });
    });
    context(@"when 1 day added", ^{
        it(@"should be 2014/3/29 12:34:56", ^{
            [[[[NSDate date] dateByAddingDays:1] should] equal:[NSDate dateWithYear:2014 month:3 day:29 hour:12 minute:34 second:56 calendar:gregorianCalendar]];
        });
    });
    context(@"when 1 month added", ^{
        it(@"should be 2014/4/28 12:34:56", ^{
            [[[[NSDate date] dateByAddingMonths:1] should] equal:[NSDate dateWithYear:2014 month:4 day:28 hour:12 minute:34 second:56 calendar:gregorianCalendar]];
        });
    });
    context(@"when 1 year added", ^{
        it(@"should be 2015/3/28 12:34:56", ^{
            [[[[NSDate date] dateByAddingYears:1] should] equal:[NSDate dateWithYear:2015 month:3 day:28 hour:12 minute:34 second:56 calendar:gregorianCalendar]];
        });
    });
});

SPEC_END
