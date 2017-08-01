//
//  CWOneTests.m
//  CWOneTests
//
//  Created by Coulson_Wang on 2017/8/1.
//  Copyright © 2017年 Coulson_Wang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+CWTranslate.h"

@interface CWOneTests : XCTestCase

@end

@implementation CWOneTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSString *str = [self getCurrentDateString];
    NSLog(@"%@",str);
    XCTAssert([str isEqualToString:@"地球历二〇一七年八月一日"],@"错误");
    
}


- (NSString *)getCurrentDateString {
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    
    NSInteger year = components.year;
    NSMutableString *yearStr = [NSMutableString string];
    [yearStr appendString:[NSString chineseNumberWithNumber:year/1000]];
    [yearStr appendString:[NSString chineseNumberWithNumber:(year%1000)/100]];
    [yearStr appendString:[NSString chineseNumberWithNumber:(year%100)/10]];
    [yearStr appendString:[NSString chineseNumberWithNumber:year%10]];
    
    
    NSInteger month = components.month;
    NSMutableString *monStr = [NSMutableString string];
    if (month>=10) {
        [monStr appendString:[NSString chineseNumberWithNumber:month/10]];
    }
    [monStr appendString:[NSString chineseNumberWithNumber:month%10]];
    
    
    NSInteger day = components.day;
    NSMutableString *dayStr = [NSMutableString string];
    if (day>=10) {
        [dayStr appendString:[NSString chineseNumberWithNumber:day/10]];
    }
    [dayStr appendString:[NSString chineseNumberWithNumber:day%10]];
    
    NSString *str = [NSString stringWithFormat:@"地球历%@年%@月%@日",yearStr,monStr,dayStr];
    return str;
}

@end