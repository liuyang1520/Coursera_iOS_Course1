//
//  ViewController.m
//  currencyConverter
//
//  Created by Yang Liu on 2016-02-22.
//  Copyright © 2016 Macula Soft. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *eurLabel;
@property (weak, nonatomic) IBOutlet UILabel *gbpLabel;
@property (weak, nonatomic) IBOutlet UILabel *jpyLabel;

@end



@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled = YES;
    double inputValue = [self.inputField.text doubleValue];
    self.eurLabel.text = [NSString stringWithFormat:@"%.2f", inputValue * currencies.EUR];
    self.gbpLabel.text = [NSString stringWithFormat:@"%.2f", inputValue * currencies.GBP];
    self.jpyLabel.text = [NSString stringWithFormat:@"%.2f", inputValue * currencies.JPY];
}

@end
