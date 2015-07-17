//
//  CountryModel.h
//  CountryStates
//
//  Created by kulraj singh on 17/07/15.
//
//

//table name
#define tblCountries @"countries"

//column names
#define colCountryId @"country_id"
#define colIsoCode2 @"iso_code_2"
#define colIsoCode3 @"iso_code_3"
#define colPostalCodeRequired @"post_code_required"


#import "BaseDBModel.h"

@interface CountryModel : BaseDBModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *isoCode2;
@property (strong, nonatomic) NSString *isoCode3;
@property (nonatomic) BOOL postalCodeRequired;

@end
