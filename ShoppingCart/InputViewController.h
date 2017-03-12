//
//  InputViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-12.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputTableViewCell.h"
#import "Food.h"
#import "Drink.h"
#import "Cloth.h"

@protocol InputDelegate <NSObject>

- (NSInteger) indexPathRow;

@required
- (void) item:(Product *)item;

@end

@interface InputViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) id<InputDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UITableView *inputTableView;

@end
