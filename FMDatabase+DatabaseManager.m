//
//  FMDatabase+DatabaseManager.m
//
//  Created by Kulraj Singh on 05/01/15.
//  Copyright (c) 2015 Kulraj Singh. All rights reserved.
//

#import "FMDatabase+DatabaseManager.h"
#import "BaseDBModel.h"
#import "CountryModel.h"

@implementation FMDatabase (DatabaseManager)

- (void)createTables
{
  [self open];
  NSString *createVendorsQuery = [CountryModel getCreateQuery];
  //for table modification update update wuld work, execute query would work only for reading
  [self executeUpdate:createVendorsQuery];
  [self close];
}

- (NSMutableArray*)getRecordsWithQuery:(NSString *)sqlSelectQuery targetObject:(BaseDBModel *)object
{
  [self open];
  // Query result
  NSMutableArray *array = [[NSMutableArray alloc]init];
  
  FMResultSet *resultsWithNameLocation = [self executeQuery:sqlSelectQuery];
  while([resultsWithNameLocation next]) {
    //map to object and add
    BaseDBModel *databaseObject = [[[object class]alloc]initWithResultSet:resultsWithNameLocation];
    [array addObject:databaseObject];
  }
  [self close];
  
  return array;
}

- (id)getRecordWithQuery:(NSString *)query targetObject:(BaseDBModel *)object
{
  NSMutableArray *array = [self getRecordsWithQuery:query targetObject:object];
  if (array.count > 0) {
    return array[0];
  }
  return nil;
}

- (void)updateRecords:(NSMutableArray *)records
{
  [self open];
  for (BaseDBModel *object in records) {
    NSString *updateQuery = [object getUpdateQuery];
    [self executeUpdate:updateQuery];
  }
  [self close];
}

- (void)updateWithQuery:(NSString *)query
{
  [self open];
  [self executeUpdate:query];
  [self close];
}

- (void)insertWithQuery:(NSString *)query
{
  [self updateWithQuery:query];
}

- (void)insertRecords:(NSMutableArray *)records
{
  [self insertOrReplaceRecords:records];
}

- (void)insertOrReplaceRecords:(NSMutableArray *)records
{
  [self open];
  for (BaseDBModel *object in records) {
    NSString *insertQuery = [object getInsertQuery];
    [self executeUpdate:insertQuery];
  }
  [self close];
}

- (void)deleteWithQuery:(NSString *)query
{
  [self updateWithQuery:query];
}

@end
