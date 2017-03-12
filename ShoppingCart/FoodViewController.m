//
//  FoodViewController.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-08.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "FoodViewController.h"

@implementation FoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create an empty object
    self.item = [[Food alloc] init];
    
    self.foodTableView.delegate = self;
    self.foodTableView.dataSource = self;
    
    self.dataSourceForLabel = [@[@"Food ID", @"Food name", @"Food Price", @"Food made in country", @"Food calorie", @"Food size", @"Food ingredients"] mutableCopy];
    self.dataSourceForTextField = [@[@"100", @"Chicken", @"8", @"Canada", @"350", @"4", @"chicken, oil, chees"] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceForLabel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellIdentifier = @"foodTableViewCellID";
    
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[FoodTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Set labels and default values of each textfield
    cell.foodTVCLabel.text = [self.dataSourceForLabel objectAtIndex:indexPath.row];
    cell.foodTVCTextField.text = [self.dataSourceForTextField objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)submitFoodData:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(foodItem:)]) {
        
        // Get values from each textfield
        NSMutableDictionary *foodDict = [NSMutableDictionary dictionary];
        NSIndexPath *indexPath;
        FoodTableViewCell *cell;
        
        for (int i = 0; i < self.dataSourceForLabel.count; i++) {
            indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            cell = [_foodTableView cellForRowAtIndexPath:indexPath];
            [foodDict setObject:cell.foodTVCTextField.text forKey:_dataSourceForLabel[i]];
        }
        
        self.item = [self.item initWithFoodID:[[foodDict valueForKey:_dataSourceForLabel[0]] integerValue]
                                     foodName:[foodDict valueForKey:_dataSourceForLabel[1]]
                                    foodPrice:[[foodDict valueForKey:_dataSourceForLabel[2]] floatValue]
                            foodMadeInCountry:[foodDict valueForKey:_dataSourceForLabel[3]]
                                  foodCalorie:[[foodDict valueForKey:_dataSourceForLabel[4]] integerValue]
                                     foodSize:[[foodDict valueForKey:_dataSourceForLabel[5]] integerValue]
                              foodIngredients:@[@"chicken", @"oil", @"chees"]]; // TODO: split by comma
        
        [self.delegate foodItem:self.item];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)goBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
