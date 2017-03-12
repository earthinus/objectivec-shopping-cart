//
//  ViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-07.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodViewController.h"
#import "itemsViewController.h"
#import "Product.h"
#import "homeTableViewCell.h"

@interface ViewController : UIViewController <FoodDelegate, ItemDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray<Product*> *items;
@property float sum;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (strong, nonatomic) NSMutableArray<UIImage*> *dataSourceForImage;
@property (strong, nonatomic) NSMutableArray<NSString*> *dataSourceForLabel;
@property (strong, nonatomic) NSMutableArray<NSString*> *dataSourceForButton;
@property(nonatomic) NSInteger indexPathRow;

- (void) showSumPrice:(Product *)item;

@end
