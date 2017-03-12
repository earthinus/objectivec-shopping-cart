//
//  ItemViewController.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-12.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ItemViewController.h"

@implementation ItemViewController

- (void)viewWillAppear:(BOOL)animated {
    self.items = [self.delegate productItems];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemTableView.delegate = self;
    self.itemTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // TODO: dynamic
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 43;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    static NSString *cellIdentifier = @"ItemHeaderTableViewCellID";
    ItemHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    }
    if (section == 0) {
        cell.headerLabel.text = @"Food";
    } else if (section == 1) {
        cell.headerLabel.text = @"Drink";
    } else {
        cell.headerLabel.text = @"Cloth";
    }
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // TODO: Set product info to labels of table cell
    NSString *cellIdentifer;
    
    if (indexPath.section == 0) {
        cellIdentifer = @"FoodItemTableViewCellID";
        
        FoodItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        
        if (!cell) {
            cell = [[FoodItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        }
        
        cell.foodImageView.image = [UIImage imageNamed:@"icon_food.png"];
        cell.foodNameLabel.text = @"Checken";
        cell.foodPriceLabel.text = @"$10";
        return cell;
        
    } else if (indexPath.section == 1) {
        
        cellIdentifer = @"DrinkItemTableViewCellID";
        
        DrinkItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        
        if (!cell) {
            cell = [[DrinkItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        }
        
        cell.drinkImageView.image = [UIImage imageNamed:@"icon_drink.png"];
        cell.drinkNameLabel.text = @"Checken";
        cell.drinkPriceLabel.text = @"$10";
        return cell;
        
    } else {
        
        cellIdentifer = @"ClothItemTableViewCellID";
        
        ClothItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        
        if (!cell) {
            cell = [[ClothItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        }
        
        cell.clothImageView.image = [UIImage imageNamed:@"icon_cloth.png"];
        cell.clothNameLabel.text = @"Checken";
        cell.clothPriceLabel.text = @"$10";
        return cell;
    }
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
