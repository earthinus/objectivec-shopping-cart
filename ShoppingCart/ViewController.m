//
//  ViewController.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-07.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = [[NSMutableArray<Product*> alloc] init];
    self.sum = 0;
    
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
    
    self.dataSourceForImage = [@[[UIImage imageNamed:@"icon_food.png"], [UIImage imageNamed:@"icon_drink.png"], [UIImage imageNamed:@"icon_cloth.png"]] mutableCopy];
    self.dataSourceForLabel = [@[@"Food", @"Drink", @"Cloth"] mutableCopy];
    //self.dataSourceForButton = [@[] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellIdentifier = @"homeTableViewCellID";
    
    homeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[homeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.homeTVCImageView.image = [self.dataSourceForImage objectAtIndex:indexPath.row];
    cell.homeTVCLabel.text = [self.dataSourceForLabel objectAtIndex:indexPath.row];
    
    // Button
    [cell.homeTVCButton addTarget:self action:@selector(onMyButtonTouch:event:)
            forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
}

// Tap event for buttons
- (void) onMyButtonTouch:(UIButton *)sendar event:(UIEvent *)event{
    
    // Get the index of the tapped button
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:_homeTableView];
    NSIndexPath *indexPath = [_homeTableView indexPathForRowAtPoint:point];
    
    NSLog(@"%ld\n", (long)indexPath.row);
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceForImage.count;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"foodSegue"]) {
        ((FoodViewController*)(segue.destinationViewController)).delegate = self;
        
    } else if ([segue.identifier isEqualToString:@"drinkSegue"]) {
        ((DrinkViewController*)(segue.destinationViewController)).delegate = self;
        
    } else if ([segue.identifier isEqualToString:@"clothSegue"]) {
        ((ClothViewController*)(segue.destinationViewController)).delegate = self;
        
    } else if ([segue.identifier isEqualToString:@"itemsSegue"]) {
        ((itemsViewController*)(segue.destinationViewController)).delegate = self;
    }
}

- (void) foodItem:(Food *)item {
    [self.items addObject:item];
    [self showSumPrice:item];
}

- (void) drinkItem:(Drink *)item {
    [self.items addObject:item];
    [self showSumPrice:item];
}

- (void) clothItem:(Cloth *)item {
    [self.items addObject:item];
    [self showSumPrice:item];
}

- (NSMutableArray<Product*>*)productItems {
    return self.items;
}

- (void) showSumPrice:(Product *)item {
    self.sum += [item price];
    self.priceLabel.text = [@"$" stringByAppendingString:@(self.sum).stringValue];
}


@end
