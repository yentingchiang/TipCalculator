//
//  ViewController.m
//  TipCalculator
//
//  Created by Tim Chiang on 2015/6/8.
//  Copyright (c) 2015年 Tim Chiang. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()

@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic) float tipPercent;

- (void)loadTipSetting;
- (void)saveTipSetting;
- (void)loadInputAmount;
- (void)saveInputAmount;
- (void)setTipNumber;
- (void)setDisplayWithInputAmount:(float)inputAmount;
- (void)displayAmount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self loadTipSetting];
    [self loadInputAmount];
    [self setTipNumber];
    [self displayAmount];
    [self.inputAmount becomeFirstResponder];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self saveTipSetting];
    [self saveInputAmount];
}

- (void)loadTipSetting{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger index = [defaults integerForKey:@"tipsIndex"];
    if (!index) {
        [defaults setInteger:0 forKey:@"tipsIndex"];
        [defaults synchronize];
        self.selectedIndex = 0;
    } else {
        self.selectedIndex = [defaults integerForKey:@"tipsIndex"];
    }
    self.tipSegment.selectedSegmentIndex = self.selectedIndex;
}

- (void)saveTipSetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setInteger:self.selectedIndex forKey:@"tipsIndex"];
    [defaults synchronize];
}

- (void)loadInputAmount{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *inputAmountString = [defaults stringForKey:@"inputAmount"];
    float inputAmount = [inputAmountString floatValue];
    self.inputAmount.text = inputAmountString;
    [self setDisplayWithInputAmount:inputAmount];
}

- (void)saveInputAmount{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.inputAmount.text forKey:@"inputAmount"];
    [defaults synchronize];
}

- (void)setTipNumber {
    
    NSString *selectedText = [self.tipSegment titleForSegmentAtIndex:self.selectedIndex];
    self.tipPercent = [selectedText integerValue] * 0.01;
}

- (void)setDisplayWithInputAmount:(float)inputAmount {
    
    if (inputAmount > 0)  {
        float totalTip= self.tipPercent * inputAmount;
        float totalAmount= inputAmount+ totalTip;
       
        NSString *totalTipText = [NSString stringWithFormat:@"$%.02f", totalTip];
        NSString *totalAmountText = [NSString stringWithFormat:@"$%.02f", totalAmount];
        
        self.tipAmount.text = totalTipText;
        self.totalAmount.text = totalAmountText;
    }
    else {
        self.tipAmount.text = @"0";
        self.totalAmount.text = @"0";
    }
}

- (void)displayAmount {
    
    float input = [self.inputAmount.text floatValue];
    [self setDisplayWithInputAmount:input];
}

- (IBAction)caculateTips:(id)sender {
    
    [self displayAmount];
}

- (IBAction)selectedTip:(id)sender {

    self.selectedIndex = [sender selectedSegmentIndex];
    NSString *selectedText = [sender titleForSegmentAtIndex:self.selectedIndex];
    
    self.tipPercent = [selectedText integerValue] * 0.01;
   
    float input = [self.inputAmount.text integerValue];
    
    [self setDisplayWithInputAmount:input];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    SettingsViewController *view = [segue destinationViewController];
    int index = (int)self.selectedIndex;
    [view passData:index];

}

- (void)passSelectedIndexFromSetting:(int)index {
    
    self.selectedIndex = index;
}


- (IBAction)inputAmountEditChanged:(id)sender {
    [self saveInputAmount];
}


@end
