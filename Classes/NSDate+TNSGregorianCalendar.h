//
//  NSDate+TNSGregorianCalendar.h
//  NSDate-TNSGregorianCalendar
//
//  Created by Takuji Nishibayashi on 2014/03/28.
//  Copyright (c) 2014年 Takuji Nishibayashi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TNSGregorianCalendarTruncateUnit) {
    TNSGregorianCalendarTruncateUnitMinute,
    TNSGregorianCalendarTruncateUnitHour,
    TNSGregorianCalendarTruncateUnitDay,
    TNSGregorianCalendarTruncateUnitMonth,
    TNSGregorianCalendarTruncateUnitYear,
};

@interface NSDate (TNSGregorianCalendar)

#pragma mark - Date component accessor property

@property(nonatomic, readonly) NSInteger era;
@property(nonatomic, readonly) NSInteger year;
@property(nonatomic, readonly) NSInteger currentCalendarYear;
@property(nonatomic, readonly) NSInteger month;
@property(nonatomic, readonly) NSInteger day;
@property(nonatomic, readonly) NSInteger hour;
@property(nonatomic, readonly) NSInteger minute;
@property(nonatomic, readonly) NSInteger seconds;
@property(nonatomic, readonly) NSInteger week;
@property(nonatomic, readonly) NSInteger weekday;
@property(nonatomic, readonly) NSInteger weekdayOrdinal;

#pragma mark - Calculate date methods

- (NSDate *)dateTruncatedTo:(TNSGregorianCalendarTruncateUnit)truncateUnit;

#pragma mark - Relative date methods

+ (NSDate *)dateToday;
+ (NSDate *)dateYesterday;
+ (NSDate *)dateTomorrow;
+ (NSDate *)dateEndOfToday;

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;
- (NSDate *)dateByAddingHours:(NSInteger)hours;
- (NSDate *)dateByAddingDays:(NSInteger)days;
- (NSDate *)dateByAddingMonths:(NSInteger)months;
- (NSDate *)dateByAddingYears:(NSInteger)years;

#pragma mark - Start and end of unit

- (NSDate *)dateAtStartOfDay;
- (NSDate *)dateAtEndOfDay;
- (NSDate *)dateAtStartOfMonth;
- (NSDate *)dateAtEndOfMonth;
- (NSDate *)dateAtStartOfYear;
- (NSDate *)dateAtEndOfYear;

#pragma mark - Date components

- (NSDateComponents *)tns_dateComponentsWithUnit:(NSCalendarUnit)unit;

#pragma mark - fast date format method
- (NSString *)ymdString;

- (NSString *)ymdStringWithSeparator:(NSString *)separator;

- (NSString *)dateTimeString;

@end
