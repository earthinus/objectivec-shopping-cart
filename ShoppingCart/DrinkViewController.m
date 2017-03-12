//
//  DrinkViewController.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "DrinkViewController.h"

@implementation DrinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create empty object
    self.item = [[Drink alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submitDrinkData:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(drinkItem:)]) {
        
        self.item = [self.item initWithDrinkID:[_drinkIDTextField.text integerValue]
                                     drinkName:_drinkNameTextField.text
                                    drinkPrice:[_drinkPriceTextField.text floatValue]
                            drinkMadeInCountry:_drinkMadeInCountryTextField.text
                                   isDrinkDiet:_drinkIsDrinkDiet.canBecomeFirstResponder
                                     drinkSize:[_drinkSizeTextField.text integerValue]];
        
        [self.delegate drinkItem:self.item];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (IBAction)goBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
