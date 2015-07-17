//
//  BaseDBModel.h
//  CountryStates
//
//  Created by iOS Developer on 17/07/15.
//
//

#define colName @"name"

#import <Foundation/Foundation.h>
#import "FMResultSet.h"

@interface BaseDBModel : NSObject

@property (strong, nonatomic) NSString *Id;

+ (NSString*)getCreateQuery;

- (id)initWithResultSet:(FMResultSet*)resultSet;

//in the insert query we will check if the id is existing
//if it is existing then we update the existing record else insert new record
- (NSString*)getInsertQuery;

- (NSString*)getUpdateQuery;


@end
