//
//  ClothViewController.h
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cloth.h"

@class ClothViewController;

@protocol ClothDelegate <NSObject>

@required
- (void) clothItem:(Cloth *)item;

@end


@interface ClothViewController : UIViewController

@property (weak, nonatomic) id<ClothDelegate> delegate;
@property (strong, nonatomic) Cloth *item;
@property (weak, nonatomic) IBOutlet UITextField *clothIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *clothNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *clothPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *clothMadeInCountryTextField;
@property (weak, nonatomic) IBOutlet UITextView *clothMaterialsTextView;

@end
