//
//  DrinkViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drink.h"

@class DrinkViewController;

@protocol DrinkDelegate <NSObject>

@optional

- (void) drinkItem:(Drink *)item;

@end


@interface DrinkViewController : UIViewController

@property (weak, nonatomic) id<DrinkDelegate> delegate;
@property (strong, nonatomic) Drink *item;
@property (weak, nonatomic) IBOutlet UITextField *drinkIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *drinkNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *drinkPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *drinkMadeInCountryTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *drinkIsDrinkDiet;
@property (weak, nonatomic) IBOutlet UITextField *drinkSizeTextField;

@end
