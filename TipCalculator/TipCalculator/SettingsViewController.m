//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Tim Chiang on 2015/6/9.
//  Copyright (c) 2015年 Tim Chiang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (nonatomic) NSInteger selectedIndex;

- (void)setTipSegment;
- (void)saveTipSetting;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTipSegment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
   
    [self saveTipSetting];
}

- (void)setTipSegment {
    
    [self.tipSegment setSelectedSegmentIndex:self.selectedIndex];
}

- (void)saveTipSetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setInteger:self.selectedIndex forKey:@"tipsIndex"];
    [defaults synchronize];
}

- (void)passData:(int)index {
   
    self.selectedIndex = index;
}

- (IBAction)clickSetting:(id)sender {
    self.selectedIndex = [sender selectedSegmentIndex];
   [self saveTipSetting];
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
