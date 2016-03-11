//
//  ViewController.m
//  distanceCalculator
//
//  Created by Yang Liu on 2016-03-07.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *startField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSegControl;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UITextField *destField1;
@property (weak, nonatomic) IBOutlet UITextField *destField2;
@property (weak, nonatomic) IBOutlet UITextField *destField3;
@property (weak, nonatomic) IBOutlet UILabel *destLabel1;
@property (weak, nonatomic) IBOutlet UILabel *destLabel2;
@property (weak, nonatomic) IBOutlet UILabel *destLabel3;
//Define DGDistanceRequest instance.
@property (nonatomic) DGDistanceRequest *req;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)updateButtonTapped:(id)sender {
    self.updateButton.enabled = NO;
    
    self.req = [DGDistanceRequest alloc];
    NSString *start = self.startField.text;
    NSArray *dests = @[self.destField1.text, self.destField2.text, self.destField3.text];
    
    self.req = [self.req initWithLocationDescriptions:dests sourceDescription:start];
    
    __weak ViewController *weakSelf = self;
    
    self.req.callback = ^void(NSArray *result){
        if (!weakSelf) return;
        NSNull *noResult = [NSNull null];
        weakSelf.updateButton.enabled = YES;
        
        double divNum = 1000.0;
        if (self.unitSegControl.selectedSegmentIndex == 1) {
            divNum = 1609.34;
        }
        
        NSArray *destLabels = @[weakSelf.destLabel1, weakSelf.destLabel2, weakSelf.destLabel3];
        for (int i = 0; i < [result count]; i++){
            if (result[i] != noResult) {
                ((UILabel*) destLabels[i]).text = [NSString stringWithFormat:@"%.2f", [result[i] floatValue] / divNum];
            }
            else ((UILabel*) destLabels[i]).text = @"Error";
        }
        [weakSelf.view endEditing:YES];
    };
    
    [self.req start];
}

@end
