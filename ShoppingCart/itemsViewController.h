//
//  itemsViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-10.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "Product.h"

@interface itemsViewController : UIViewController <ItemsDelegate>

@property (weak, nonatomic) id<ItemsDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *itemsLabel;
@property (strong, nonatomic) NSMutableArray<Product*> *items;

@end
