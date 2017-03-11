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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submitFoodData:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(foodItem:)]) {
        
        // Set values to the object
        self.item = [self.item initWithFoodID:[_foodIDTextField.text intValue]
                                     foodName:_foodNameTextField.text
                                    foodPrice:[_foodPriceTextField.text floatValue]
                            foodMadeInCountry:_foodMadeInCountryTextField.text
                                  foodCalorie:[_foodCalorieTextField.text intValue]
                                     foodSize:[_foodSizeTextField.text intValue]
                              foodIngredients:@[@"chicken", @"oil", @"chees"]]; // TODO: split by comma
        
        [self.delegate foodItem:self.item];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)goBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
