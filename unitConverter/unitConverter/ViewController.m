//
//  ViewController.m
//  unitConverter
//
//  Created by Yang Liu on 2016-02-18.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UILabel *firstUnitLabel;

@property (weak, nonatomic) IBOutlet UILabel *secondUnitLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;

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

- (IBAction)updateButton:(id)sender {
    self.tipsLabel.text = @"Press to re-update";
    double inputValue = [self.inputField.text doubleValue];
    
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        self.secondUnitLabel.text = @"Yard";
        self.resultLabel.text = [@(inputValue * 1.0936) stringValue];
    }
    else if (self.segmentedControl.selectedSegmentIndex == 1) {
        self.secondUnitLabel.text = @"Inch";
        self.resultLabel.text = [@(inputValue * 39.3701) stringValue];
    }
    else {
        self.secondUnitLabel.text = @"Foot";
        self.resultLabel.text = [@(inputValue * 3.2808) stringValue];
    }
}

@end
