//
//  itemsViewController.m
//  ShoppingCart
//

#import "itemsViewController.h"

@implementation itemsViewController

- (void)viewWillAppear:(BOOL)animated {
    self.items = [self.delegate productItems];
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (Product *item in self.items) {
        [arr addObject:item.productName];
    }
    
    self.itemTextView.text = [arr componentsJoinedByString:@"\n"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
