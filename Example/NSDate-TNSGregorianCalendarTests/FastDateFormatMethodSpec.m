//
//  FastDateFormatMethodSpec.m
//  NSDate-TNSGregorianCalendar
//
//  Created by Takuji Nishibayashi on 2014/03/28.
//  Copyright 2014 Takuji Nishibayashi. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <NSDate-TNSDateInitializer/NSDate+TNSDateInitializer.h>
#import "NSDate+TNSGregorianCalendar.h"


SPEC_BEGIN(FastDateFormatMethodSpec)

describe(@"NSDate+TNSGregorianCalendar", ^{
    __block NSCalendar *gregorianCalendar;
    __block NSDate *date;
    beforeAll(^{
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        date = [NSDate dateWithYear:2014 month:3 day:28 hour:12 minute:34 second:56 calendar:gregorianCalendar];
    });
    context(@"when created", ^{
        it(@"ymdString should equal 2014/03/28", ^{
            [[[date ymdString] should] equal:@"2014/03/28"];
        });
        it(@"custom ymdString with . separator should equal 2014.03.28", ^{
            [[[date ymdStringWithSeparator:@"."] should] equal:@"2014.03.28"];
        });
        it(@"dateString should equal 2014/03/28 12:34:56", ^{
            [[[date dateTimeString] should] equal:@"2014/03/28 12:34:56"];
        });
    });
});

SPEC_END
