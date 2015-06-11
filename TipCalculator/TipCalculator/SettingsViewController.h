//
//  SettingsViewController.h
//  TipCalculator
//
//  Created by Tim Chiang on 2015/6/9.
//  Copyright (c) 2015年 Tim Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSegment;

- (void)passData:(int)index;
@end
