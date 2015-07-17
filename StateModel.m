//
//  StateModel.m
//  CountryStates
//
//  Created by iOS Developer on 17/07/15.
//
//

#import "StateModel.h"

@implementation StateModel

- (id)initWithResultSet:(FMResultSet *)resultSet
{
    self = [super initWithResultSet:resultSet];
    if (self) {
        self.Id = [resultSet stringForColumn:colZoneId];
        self.countryId = [resultSet stringForColumn:colCountryId];
        self.code = [resultSet stringForColumn:colCode];
        
        //work for special characters
        NSString *encodedString = [resultSet stringForColumn:colName];
        self.name = [NSString stringWithUTF8String:[encodedString cStringUsingEncoding:[NSString defaultCStringEncoding]]];
    }
    return self;
}

@end
