//
//  FoodTableViewCell.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-11.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *foodTVCLabel;
@property (weak, nonatomic) IBOutlet UITextField *foodTVCTextField;

@end
