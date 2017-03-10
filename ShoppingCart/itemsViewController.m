//
//  itemsViewController.m
//  ShoppingCart
//

#import "itemsViewController.h"

@implementation itemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((ViewController *)(segue.destinationViewController)).delegate = self;
}

- (void) items:(NSMutableArray<Product*>*)items {
    for (Product* item in items) {
        // TODO : add info
        self.itemsLabel.text = item.productName;
    }
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
