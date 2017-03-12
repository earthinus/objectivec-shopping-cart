//
//  ViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-07.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "InputViewController.h"
#import "itemsViewController.h"
#import "HomeTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, InputDelegate, ItemDelegate>

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
