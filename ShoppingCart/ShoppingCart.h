//
//  ShoppingCart.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface ShoppingCart : UIViewController

@property NSMutableArray<Product*> *items;

- (id) initWithItems:(NSMutableArray<Product*>*)items;

- (void) addItem:(Product*)item;

- (void) calculate;

- (void) showItems;

@end
