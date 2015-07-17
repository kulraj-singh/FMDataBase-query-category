//
//  CountriesViewController.m
//  CountryStates
//
//  Created by kulraj singh on 17/07/15.
//
//

#import "CountriesViewController.h"
#import "FMDatabase+DatabaseManager.h"
#import "StatesViewController.h"
#import "StateModel.h"
#import "CountryModel.h"

@interface CountriesViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_countries;
    FMDatabase *_db;
}

@end

@implementation CountriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fetchCountries];
    self.navigationItem.title = @"Countries";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchCountries
{
    NSString *dbPath = [[NSBundle mainBundle]pathForResource:@"Country" ofType:@"sqlite"];
    _db = [FMDatabase databaseWithPath:dbPath];
    
    NSString *countriesQuery = [NSString stringWithFormat:@"select * from %@", tblCountries];
    _countries = [_db getRecordsWithQuery:countriesQuery targetObject:[[CountryModel alloc]init]];
}

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _countries.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    CountryModel *country = _countries[indexPath.row];
    cell.textLabel.text = country.name;
    
    NSString *imageName = [NSString stringWithFormat:@"CountryPicker.bundle/%@", country.isoCode2];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CountryModel *selectedCountry = _countries[indexPath.row];
    NSString *statesQuery = [NSString stringWithFormat:@"select * from %@ where %@ = '%@'", tblStates, colCountryId, selectedCountry.Id];
    NSMutableArray *states = [_db getRecordsWithQuery:statesQuery targetObject:[[StateModel alloc]init]];
    
    if (states.count == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"There are nop states in the selected country" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        return;
    }
    
    StatesViewController *statesVc = [[StatesViewController alloc]initWithNibName:@"StatesViewController" bundle:nil];
    statesVc.states = states;
    [self.navigationController pushViewController:statesVc animated:YES];
}

@end
