//
//  StateModel.h
//  CountryStates
//
//  Created by iOS Developer on 17/07/15.
//
//

#define tblStates @"zone"

//column names
#define colZoneId @"zone_id"
#define colCountryId @"country_id"
#define colCode @"code"
#define colName @"name"

#import "BaseDBModel.h"

@interface StateModel : BaseDBModel

@property (strong, nonatomic) NSString *countryId;
@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *name;

@end
