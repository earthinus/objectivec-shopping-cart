//
//  ViewController.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-07.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ViewController.h"
#import "itemList.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    }
}

- (void) foodView:(FoodViewController *)foodView item:(Food *)item {
    
    self.sum += item.productPrice;
    
    self.priceLabel.text = [@"$" stringByAppendingString:@(self.sum).stringValue];
}

- (void) drinkView:(DrinkViewController *)drinkView item:(Drink *)item {
    
    self.sum += item.productPrice;
    
    self.priceLabel.text = [@"$" stringByAppendingString:@(self.sum).stringValue];
}

- (void) clothView:(ClothViewController *)clothView item:(Cloth *)item {
    
    self.sum += item.productPrice;
    
    self.priceLabel.text = [@"$" stringByAppendingString:@(self.sum).stringValue];
}

- (IBAction)showItems:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"showItems" sender:self];
}

@end
