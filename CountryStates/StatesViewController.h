//
//  StatesViewController.h
//  CountryStates
//
//  Created by kulraj singh on 17/07/15.
//
//

#import <UIKit/UIKit.h>
@class CountryModel;

@interface StatesViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *states;
@property (strong, nonatomic) CountryModel *country;

@end
