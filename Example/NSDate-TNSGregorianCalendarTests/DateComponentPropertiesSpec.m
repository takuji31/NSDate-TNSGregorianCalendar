//
//  DateComponentPropertiesSpec.m
//  NSDate-TNSGregorianCalendar
//
//  Created by Takuji Nishibayashi on 2014/03/28.
//  Copyright 2014 Takuji Nishibayashi. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <NSDate-TNSDateInitializer/NSDate+TNSDateInitializer.h>
#import "NSDate+TNSGregorianCalendar.h"


SPEC_BEGIN(DateComponentPropertiesSpec)

describe(@"TNSGregorianCalendar", ^{
    __block NSCalendar *gregorianCalendar;
    beforeAll(^{
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    });
    context(@"when date created", ^{
        __block NSDate* date;
        beforeAll(^{
            date = [NSDate dateWithYear:2014 month:3 day:28 hour:12 minute:34 second:56 calendar:gregorianCalendar];
        });
        it(@"year should be 2014", ^{
            [[theValue(date.year) should] equal:@2014];
        });
        it(@"month should be 3", ^{
            [[theValue(date.month) should] equal:@3];
        });
        it(@"day should be 28", ^{
            [[theValue(date.day) should] equal:@28];
        });
        it(@"hour should be 12", ^{
            [[theValue(date.hour) should] equal:@12];
        });
        it(@"minute should be 34", ^{
            [[theValue(date.minute) should] equal:@34];
        });
        it(@"seconds should be 56", ^{
            [[theValue(date.seconds) should] equal:@56];
        });
    });
});

SPEC_END
