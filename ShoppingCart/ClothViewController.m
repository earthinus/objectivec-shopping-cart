//
//  ClothViewController.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ClothViewController.h"

@implementation ClothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create an empty object
    self.item = [[Cloth alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submitClothData:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(clothItem:)]) {
        
        self.item = [self.item initWithClothID:[_clothIDTextField.text integerValue]
                                     clothName:_clothNameTextField.text
                                    clothPrice:[_clothPriceTextField.text floatValue]
                            clothMadeInCountry:_clothMadeInCountryTextField.text
                                clothMaterials:@[@"cotton"]];
        //_clothMaterialsTextView.text
        
        [self.delegate clothItem:self.item];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)goBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
