//
//  ViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-07.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodViewController.h"
#import "DrinkViewController.h"
#import "ClothViewController.h"
#import "Product.h"

@protocol ItemsDelegate <NSObject>

@required
- (void) items:(NSMutableArray<Product*>*)items;

@end


@interface ViewController : UIViewController <FoodDelegate, DrinkDelegate, ClothDelegate>

@property (weak, nonatomic) id<ItemsDelegate> delegate;
@property NSMutableArray<Product*> *items;
@property float sum;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

- (void) showSumPrice:(Product *)item;
- (IBAction)showItems:(UIButton *)sender;

@end
