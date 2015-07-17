//
//  StatesViewController.m
//  CountryStates
//
//  Created by kulraj singh on 17/07/15.
//
//

#import "StatesViewController.h"
#import "StateModel.h"
#import "CountryModel.h"

@interface StatesViewController ()<UITableViewDataSource>

@end

@implementation StatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self showCountry];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showCountry
{
    self.navigationItem.title = self.country.name;
    
    //show country flag
    NSString *imageName = [NSString stringWithFormat:@"CountryPicker.bundle/%@", _country.isoCode2];
    UIImage *image = [UIImage imageNamed:imageName];
    
    //create button
    UIImageView *imageFlag = [[UIImageView alloc]initWithImage:image];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:imageFlag];
}

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _states.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    StateModel *state = _states[indexPath.row];
    cell.textLabel.text = state.name;
    
    return cell;
}

@end
