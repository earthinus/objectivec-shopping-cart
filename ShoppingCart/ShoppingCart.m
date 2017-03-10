//
//  ShoppingCart.m
//  ShoppingCart
//
//  Created by 戸田 真紀 on 2017-03-09.
//  Copyright © 2017 CICCC. All rights reserved.
//

#import "ShoppingCart.h"

@implementation ShoppingCart

- (id) initWithItems:(NSMutableArray<Product*>*)items {
    self = [super init];
    if (self) {
        self.items = items;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) addItem:(Product*)item {
    
    [self.items addObject:item];
    NSLog(@"You added: %@\n", item.productName);
    NSLog(@"\n\n");
}

- (float) calculate:(Product*)item {
    NSLog(@"Total: $%f\n", [item price]);
    return [item price];
}

- (void) showItems {
    NSLog(@"----- Item list -----");
    for (Product *item in self.items) {
        NSLog(@"%@\n", item.productName);
    }
    NSLog(@"\n\n");
}

@end
