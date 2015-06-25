//
//  LRDDetailViewController.m
//  Homepwner
//
//  Created by 张林 on 15/6/25.
//  Copyright (c) 2015年 张林. All rights reserved.
//

#import "LRDDetailViewController.h"
#import "LRDItem.h"
#import "ChangeDateViewController.h"

@interface LRDDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *changeDateButton;


@end

@implementation LRDDetailViewController

- (void)setItem:(LRDItem *)item {
    _item = item;
    self.navigationItem.title = item.itemName;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"viewDidLoad");
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action: @selector(saveChange:)];
    self.navigationItem.rightBarButtonItem = saveItem;
}

- (void)loadView {
    [super loadView];
    NSLog(@"loadView");
}
- (IBAction) changeDate:(id) sender {
    ChangeDateViewController *changeDateController = [[ChangeDateViewController alloc] init];
    changeDateController.item = self.item;
    [self.navigationController pushViewController:changeDateController animated:YES];
}
- (void) saveChange:(id) sender{
    [self.view endEditing:NO];
    
    LRDItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.nameField.text;
    item.valueInDollars = [self.nameField.text intValue];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
    [super viewWillAppear:animated];
    
    self.nameField.text = self.item.itemName;
    self.serialField.text=  self.item.serialNumber;
    self.valueField.text =  [NSString stringWithFormat:@"%d", self.item.valueInDollars];
    self.dateLabel.text = [self.item.dateCreated description];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear");
    [self saveChange:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
