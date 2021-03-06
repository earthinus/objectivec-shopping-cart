//
//  InputViewController.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-12.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@property (strong, nonatomic) Product *item;
@property (strong, nonatomic) NSArray<NSArray *> *dataSource;
@property (strong, nonatomic) NSArray<NSString *> *dataFoodLabel;
@property (strong, nonatomic) NSArray<NSString *> *dataFoodValue;
@property (strong, nonatomic) NSArray<NSString *> *dataDrinkLabel;
@property (strong, nonatomic) NSArray<NSString *> *dataDrinkValue;
@property (strong, nonatomic) NSArray<NSString *> *dataClothLabel;
@property (strong, nonatomic) NSArray<NSString *> *dataClothValue;
@property NSInteger index;

@end

@implementation InputViewController

- (void)viewWillAppear:(BOOL)animated {
    self.index = [self.delegate indexPathRow];
    self.inputTableView.delegate = self;
    self.inputTableView.dataSource = self;
    
    self.dataFoodLabel = [@[@"Food ID", @"Food name", @"Food Price", @"Food made in country", @"Food calorie", @"Food size", @"Food ingredients"] mutableCopy];
    self.dataFoodValue = [@[@"100", @"Chicken", @"8", @"Canada", @"350", @"4", @"chicken, oil, chees"] mutableCopy];
    self.dataDrinkLabel = [@[@"Drink ID", @"Drink name", @"Drink Price", @"Drink made in country", @"is Drink diet?", @"Drink size"] mutableCopy];
    self.dataDrinkValue = [@[@"412", @"Pepsi", @"2", @"USA", @"NO", @"150"] mutableCopy];
    self.dataClothLabel = [@[@"Cloth ID", @"Cloth name", @"Cloth Price", @"Cloth made in country", @"Cloth Materials"] mutableCopy];
    self.dataClothValue = [@[@"701", @"T-shirt", @"15", @"China", @"Cotton, Nylon"] mutableCopy];
    
    self.dataSource = [@[
                         [@[self.dataFoodLabel, self.dataFoodValue] mutableCopy],
                         [@[self.dataDrinkLabel, self.dataDrinkValue] mutableCopy],
                         [@[self.dataClothLabel, self.dataClothValue] mutableCopy]
                         ] mutableCopy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    switch (_index) {
        case 0:
            self.headerLabel.text = @"Food information";
            break;
            
        case 1:
            self.headerLabel.text = @"Drink information";
            break;
            
        case 2:
            self.headerLabel.text = @"Cloth information";
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arrLabel = self.dataSource[self.index][0];
    return arrLabel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellIdentifier = @"inputTableViewCellID";
    
    InputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[InputTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Set labels and default values of each textfield
    cell.inputTVCLabel.text = [self.dataSource[self.index][0] objectAtIndex:indexPath.row];
    cell.inputTVCTextField.text = [self.dataSource[self.index][1]  objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)submitData:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(item:)]) {
        
        // Get values from each textfield
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        NSIndexPath *indexPath;
        InputTableViewCell *cell;
        NSArray *arrLable = self.dataSource[self.index][0];
        
        for (int i = 0; i < arrLable.count; i++) {
            indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            cell = [_inputTableView cellForRowAtIndexPath:indexPath];
            [dict setObject:cell.inputTVCTextField.text forKey:_dataFoodLabel[i]];
        }
        
        
        switch (self.index) {
            case 0:
                self.item = [[Food alloc] initWithFoodID:[[dict valueForKey:_dataFoodLabel[0]] integerValue]
                                                foodName:[dict valueForKey:_dataFoodLabel[1]]
                                               foodPrice:[[dict valueForKey:_dataFoodLabel[2]] floatValue]
                                       foodMadeInCountry:[dict valueForKey:_dataFoodLabel[3]]
                                             foodCalorie:[[dict valueForKey:_dataFoodLabel[4]] integerValue]
                                                foodSize:[[dict valueForKey:_dataFoodLabel[5]] integerValue]
                                         foodIngredients:@[@"chicken", @"oil", @"chees"]]; // TODO: split by comma
                break;
                
            case 1:
                self.item = [[Drink alloc] initWithDrinkID:[[dict valueForKey:_dataFoodLabel[0]] integerValue]
                                                 drinkName:[dict valueForKey:_dataFoodLabel[1]]
                                                drinkPrice:[[dict valueForKey:_dataFoodLabel[2]] floatValue]
                                        drinkMadeInCountry:[dict valueForKey:_dataFoodLabel[3]]
                                               isDrinkDiet:[[dict valueForKey:_dataFoodLabel[4]] integerValue]
                                                 drinkSize:[[dict valueForKey:_dataFoodLabel[5]] integerValue]];
                break;
                
            case 2:
                self.item = [[Cloth alloc] initWithClothID:[[dict valueForKey:_dataFoodLabel[0]] integerValue]
                                                 clothName:[dict valueForKey:_dataFoodLabel[1]]
                                                clothPrice:[[dict valueForKey:_dataFoodLabel[2]] floatValue]
                                        clothMadeInCountry:[dict valueForKey:_dataFoodLabel[3]]
                                            clothMaterials:@[@"cotton"]]; // TODO: split by comma
                break;
                
            default:
                self.item = [[Product alloc] init];
                break;
        }
        
        [self.delegate item:self.item];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)goBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
