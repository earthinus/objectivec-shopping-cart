//
//  ItemViewController.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-12.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

@property (strong, nonatomic) NSMutableArray<Food *> *foodItems;
@property (strong, nonatomic) NSMutableArray<Drink *> *drinkItems;
@property (strong, nonatomic) NSMutableArray<Cloth *> *clothItems;

@end


@implementation ItemViewController

- (void)viewWillAppear:(BOOL)animated {
    self.items = [self.delegate productItems];
    
    _foodItems = [[NSMutableArray<Food *> alloc] init];
    _drinkItems = [[NSMutableArray<Drink *> alloc] init];
    _clothItems = [[NSMutableArray<Cloth *> alloc] init];
    
    for (int i = 0; i < _items.count; i++) {
        
        if ([_items[i] isMemberOfClass:[Food class]]) {
            [_foodItems addObject:(Food *)_items[i]];
            
        } else if ([_items[i] isMemberOfClass:[Drink class]]) {
            [_drinkItems addObject:(Drink *)_items[i]];
            
        } else {
            [_clothItems addObject:(Cloth *)_items[i]];
        }
    }
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
    
    if (section == 0) {
        return _foodItems.count;
        
    } else if (section == 1) {
        return _drinkItems.count;
        
    } else {
        return _clothItems.count;
    }
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
        
        cell.foodImageView.image = [UIImage imageNamed:@"icon_food"];
        cell.foodNameLabel.text = _foodItems[indexPath.row].productName;
        cell.foodSumPriceLabel.text = [NSString stringWithFormat:@"$%.2f", _foodItems[indexPath.row].price];
        cell.foodPriceLabel.text = [NSString stringWithFormat:@"$%.2f", _foodItems[indexPath.row].productPrice];
        cell.foodSizeLabel.text = [NSString stringWithFormat:@"size: %ld", _foodItems[indexPath.row].foodSize];
        return cell;
        
    } else if (indexPath.section == 1) {
        
        cellIdentifer = @"DrinkItemTableViewCellID";
        DrinkItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        if (!cell) {
            cell = [[DrinkItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        }
        
        cell.drinkImageView.image = [UIImage imageNamed:@"icon_drink"];
        cell.drinkNameLabel.text = _drinkItems[indexPath.row].productName;
        cell.drinkPriceLabel.text = [NSString stringWithFormat:@"$%.2f", _drinkItems[indexPath.row].productPrice];
        cell.drinkSizeLabel.text = [NSString stringWithFormat:@"size: %ld", _drinkItems[indexPath.row].drinkSize];
        return cell;
        
    } else {
        
        cellIdentifer = @"ClothItemTableViewCellID";
        ClothItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
        if (!cell) {
            cell = [[ClothItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        }
        
        cell.clothImageView.image = [UIImage imageNamed:@"icon_cloth"];
        cell.clothNameLabel.text = _clothItems[indexPath.row].productName;
        cell.clothPriceLabel.text = [NSString stringWithFormat:@"$%.2f", _clothItems[indexPath.row].productPrice];
        return cell;
    }
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
