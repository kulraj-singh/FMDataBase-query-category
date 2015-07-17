//
//  FMDatabase+DatabaseManager.h
//  Hawker
//
//  Created by Kulraj Singh on 05/01/15.
//  Copyright (c) 2015 Kulraj Singh. All rights reserved.
//

#import "FMDatabase.h"
@class BaseDBModel;

@interface FMDatabase (DatabaseManager)

- (void)createTables;

//get all records satisfying gievn conditions in query
- (NSMutableArray*)getRecordsWithQuery:(NSString*)query targetObject:(BaseDBModel*)object;

//get single record, use this when single record is expected
- (id)getRecordWithQuery:(NSString*)query targetObject:(BaseDBModel*)object;

//update multiple records in table
- (void)updateRecords:(NSMutableArray*)records;

//pass query to update the records
- (void)updateWithQuery:(NSString*)query;
- (void)insertWithQuery:(NSString*)query;

//create objects and convert them into rows in table and insert
- (void)insertRecords:(NSMutableArray*)records;

//we can check with id if a record is existing then update else insert
- (void)insertOrReplaceRecords:(NSMutableArray*)records;

- (void)deleteWithQuery:(NSString*)query;

@end
