//
//  itemsViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-10.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@protocol ItemDelegate <NSObject>

@required
- (NSMutableArray<Product*>*) productItems;

@end


@interface itemsViewController : UIViewController

@property (weak, nonatomic) id<ItemDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextView *itemTextView;
@property (strong, nonatomic) NSMutableArray<Product*> *items;

@end
