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
        self.name = [resultSet stringForColumn:colName];
    }
    return self;
}

@end
