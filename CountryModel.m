//
//  CountryModel.m
//  CountryStates
//
//  Created by Kulraj Singh on 17/07/15.
//
//

#import "CountryModel.h"

@implementation CountryModel

+ (NSString*)getCreateQuery
{
    NSString *createQuery = @"CREATE TABLE countries (country_id INTEGER PRIMARY KEY, name TEXT, iso_code_2 TEXT, iso_code_3 TEXT, post_code_required NUMERIC)";
    return createQuery;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.isoCode2 = @"";
        self.isoCode3 = @"";
        self.postalCodeRequired = YES;
    }
    return self;
}

- (id)initWithResultSet:(FMResultSet *)resultSet
{
    self = [super initWithResultSet:resultSet];
    if (self) {
        self.name = [resultSet stringForColumn:colName];
        self.Id = [resultSet stringForColumn:colCountryId];
        self.isoCode2 = [resultSet stringForColumn:colIsoCode2];
        self.isoCode3 = [resultSet stringForColumn:colIsoCode3];
        self.postalCodeRequired = [resultSet boolForColumn:colPostalCodeRequired];
    }
    return self;
}

- (NSString*)getInsertQuery
{
    //sample query
    //insert into countries values ('my country', 'CX', 'CXX', 0)
    //this is just for explaining
    //given table does not have autoincrement id so this insert query wont work
    //here we will have to insert id manually
    NSString *insertQuery;
    if (self.Id.length == 0) {
        insertQuery = [NSString stringWithFormat:@"insert into %@ values ('%@', '%@', '%@', %d)",tblCountries, self.name, self.isoCode2, self.isoCode3, self.postalCodeRequired];
    } else {
        return [self getUpdateQuery];
    }
    return insertQuery;
}

- (NSString*)getUpdateQuery
{
    //sample query
    //update countries set name = 'new country', iso_code_2 = 'XX', iso_code_3 = 'XXX', post_code_required = 1 where country_id = '250'
    NSString *updateQuery = [NSString stringWithFormat:@"update %@ set %@ = '%@', %@ = '%@', %@ = '%@', %@ = %d where %@ = '%@'", tblCountries, colName, self.name, colIsoCode2, self.isoCode2, colIsoCode3, self.isoCode3, colPostalCodeRequired, self.postalCodeRequired, colCountryId, self.Id];
    return updateQuery;
}

@end
