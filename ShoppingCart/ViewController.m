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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
