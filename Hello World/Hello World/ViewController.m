//
//  ViewController.m
//  Hello World
//
//  Created by Yang Liu on 2016-02-09.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLable;

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

- (IBAction)testButton:(id)sender {
    double height = 10;
    self.testLable.text = [NSString stringWithFormat:@"%f", height];
}

@end
