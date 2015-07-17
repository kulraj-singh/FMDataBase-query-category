//
//  BaseDBModel.m
//  CountryStates
//
//  Created by iOS Developer on 17/07/15.
//
//

#import "BaseDBModel.h"

@implementation BaseDBModel

+ (NSString*)getCreateQuery
{
    //handle missing function in the base class
    NSString *query = [NSString stringWithFormat:@"create query missing in %@", [self class]];
    NSLog(@"%@", query);
    return query;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.Id = @"";
    }
    return self;
}

- (id)initWithResultSet:(FMResultSet *)resultSet
{
    self = [super init];
    if (self) {
        //we can initialize some common properties here
    }
    return self;
}

- (NSString*)getInsertQuery
{
    NSString *query = [NSString stringWithFormat:@"insert query missing in %@", [self class]];
    NSLog(@"%@", query);
    return query;
}

- (NSString*)getUpdateQuery
{
    NSString *query = [NSString stringWithFormat:@"update query missing in %@", [self class]];
    NSLog(@"%@", query);
    return query;
}

@end
