//
//  ItemViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-12.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItemTableViewCell.h"
#import "DrinkItemTableViewCell.h"
#import "ClothItemTableViewCell.h"
#import "ItemHeaderTableViewCell.h"
#import "Product.h"

@protocol ItemDelegate <NSObject>

@required
- (NSMutableArray<Product*>*) productItems;

@end


@interface ItemViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<ItemDelegate> delegate;
@property (strong, nonatomic) NSMutableArray<Product*> *items;
@property (weak, nonatomic) IBOutlet UITableView *itemTableView;

@end
