//
//  ViewController.h
//  TipCalculator
//
//  Created by Tim Chiang on 2015/6/8.
//  Copyright (c) 2015年 Tim Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


    

@property (weak, nonatomic) IBOutlet UITextField *inputAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipSegment;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalAmount;


- (void)passSelectedIndexFromSetting:(int)index;

@end

