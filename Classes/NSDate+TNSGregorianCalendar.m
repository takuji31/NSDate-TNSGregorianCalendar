//
//  NSDate+TNSGregorianCalendar.m
//  NSDate-TNSGregorianCalendar
//
//  Created by Takuji Nishibayashi on 2014/03/28.
//  Copyright (c) 2014年 Takuji Nishibayashi. All rights reserved.
//

#import "NSDate+TNSGregorianCalendar.h"

@implementation NSDate (TNSGregorianCalendar)

#pragma mark - Date component accessor property

- (NSInteger)era {
    return [[self tns_dateComponentsWithUnit:NSCalendarUnitEra] era];
}

- (NSInteger)year {
    return [[self tns_dateComponentsWithUnit:NSYearCalendarUnit] year];
}

- (NSInteger)currentCalendarYear {
    return [[[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:self] year];
}

- (NSInteger)month {
    return [[self tns_dateComponentsWithUnit:NSMonthCalendarUnit] month];
}

- (NSInteger)day {
    return [[self tns_dateComponentsWithUnit:NSDayCalendarUnit] day];
}

- (NSInteger)hour {
    return [[self tns_dateComponentsWithUnit:NSHourCalendarUnit] hour];
}

- (NSInteger)minute {
    return [[self tns_dateComponentsWithUnit:NSMinuteCalendarUnit] minute];
}

- (NSInteger)seconds {
    return [[self tns_dateComponentsWithUnit:NSSecondCalendarUnit] second];
}

- (NSInteger)week {
    return [[self tns_dateComponentsWithUnit:NSWeekCalendarUnit] week];
}

- (NSInteger)weekday {
    return [[self tns_dateComponentsWithUnit:NSWeekdayCalendarUnit] weekday];
}

- (NSInteger)weekdayOrdinal {
    return [[self tns_dateComponentsWithUnit:NSWeekdayOrdinalCalendarUnit] weekdayOrdinal];
}


#pragma mark - Calculate date methods

- (NSDate *)dateTruncatedTo:(TNSGregorianCalendarTruncateUnit)truncateUnit {
    NSCalendarUnit unit = NSCalendarUnitEra | NSCalendarUnitCalendar | NSCalendarUnitTimeZone | NSCalendarUnitYear;
    switch (truncateUnit) {
        case TNSGregorianCalendarTruncateUnitMinute:
            unit |= NSCalendarUnitMinute;
        case TNSGregorianCalendarTruncateUnitHour:
            unit |= NSCalendarUnitHour;
        case TNSGregorianCalendarTruncateUnitDay:
            unit |= NSCalendarUnitDay;
        case TNSGregorianCalendarTruncateUnitMonth:
            unit |= NSCalendarUnitMonth;
        case TNSGregorianCalendarTruncateUnitYear:
            break;
    }
    NSDateComponents *components = [self tns_dateComponentsWithUnit:unit];
    return [components date];
}

+ (NSDate *)dateToday {
    return [[NSDate date] dateTruncatedTo:TNSGregorianCalendarTruncateUnitDay];
}

+ (NSDate *)dateYesterday {
    return [[[NSDate date] dateByAddingDays:-1] dateTruncatedTo:TNSGregorianCalendarTruncateUnitDay];
}

+ (NSDate *)dateTomorrow {
    return [[[NSDate date] dateByAddingDays:1] dateTruncatedTo:TNSGregorianCalendarTruncateUnitDay];
}

+ (NSDate *)dateEndOfToday {
    //TODO call
    NSDateComponents *components = [[NSDate date] tns_dateComponentsWithUnit:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond];
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    return [[self tns_gregorianCalendar] dateFromComponents:components];
}


- (NSDate *)dateByAddingMinutes:(NSInteger)minutes {
    return [NSDate dateWithTimeInterval:60 * minutes sinceDate:self];
}

- (NSDate *)dateByAddingHours:(NSInteger)hours {
    return [NSDate dateWithTimeInterval:3600 * hours sinceDate:self];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
    return [NSDate dateWithTimeInterval: 86400 * days sinceDate:self];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [[NSDate tns_gregorianCalendar] dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingYears:(NSInteger)years {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [[NSDate tns_gregorianCalendar] dateByAddingComponents:components toDate:self options:0];
}


#pragma mark - Date components

- (NSDateComponents *)tns_dateComponentsWithUnit:(NSCalendarUnit)unit {
    return [[NSDate tns_gregorianCalendar] components:unit fromDate:self];
}


#pragma mark - fast date format method

- (NSString *)dateTimeString {
    NSDateComponents *components = [self tns_dateComponentsWithUnit:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond];
    return [NSString stringWithFormat:@"%04d/%02d/%02d %02d:%02d:%02d", (int) [components year], (int) [components month], (int) [components day], (int) [components hour], (int) [components minute], (int) [components second]];
}

- (NSString *)ymdString {
    return [self ymdStringWithSeparator:@"/"];
}

- (NSString *)ymdStringWithSeparator:(NSString *)separator {
    NSDateComponents *components = [self tns_dateComponentsWithUnit:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay];
    return [NSString stringWithFormat:@"%04d%@%02d%@%02d", (int) [components year], separator, (int) [components month], separator, (int) [components day]];
}


#pragma mark - Private methods

+ (NSCalendar *)tns_gregorianCalendar {
    static dispatch_once_t onceToken;
    static NSCalendar *gregorianCalendar;
    dispatch_once(&onceToken, ^{
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    });
    return gregorianCalendar;
}

@end
