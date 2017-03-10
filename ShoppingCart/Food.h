//
//  Food.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface Food : Product

@property int foodCalorie;
@property int foodSize;
@property NSArray<NSString *> *foodIngredients;


- (id) initWithFoodID:(int)foodID foodName:(NSString*)foodName foodPrice:(float)foodPrice foodMadeInCountry:(NSString*)foodMadeInCountry foodCalorie:(int)foodCalorie foodSize:(int)foodSize foodIngredients:(NSArray<NSString*>*)foodIngredients;

- (float) price;

@end
