//
//  FoodViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-08.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"
#import "Drink.h"
#import "Cloth.h"
#import "FoodTableViewCell.h"

@class FoodViewController;

@protocol FoodDelegate <NSObject>

- (NSInteger) indexPathRow;

@required
- (void) foodItem:(Product *)item;

@end


@interface FoodViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<FoodDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *foodTableView;
@property (strong, nonatomic) NSArray<NSString *> *dataFoodLabel;
@property (strong, nonatomic) NSArray<NSString *> *dataFoodValue;
@property (strong, nonatomic) NSArray<NSString *> *dataDrinkLabel;
@property (strong, nonatomic) NSArray<NSString *> *dataDrinkValue;
@property (strong, nonatomic) NSArray<NSString *> *dataClothLabel;
@property (strong, nonatomic) NSArray<NSString *> *dataClothValue;

@end
