//
//  FirstViewController.m
//  DribbbleApp
//
//  Created by Monster on 06/12/2016.
//  Copyright © 2016 MonsterTech Studio. All rights reserved.
//

#import "TrendViewController.h"
#import "HMSegmentedControl.h"
@interface TrendViewController ()

@end

@implementation TrendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initialUIElements];
    
}

- (void)_initialUIElements{
    CGFloat screenwith = CGRectGetWidth(self.view.frame);

    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Trending",
                                @"Highlights",
                                @"Popular"]];
    
    segmentedControl.frame = CGRectMake(0, 20, screenwith, 40);
    segmentedControl.titleTextAttributes = @{
                                             NSForegroundColorAttributeName : [UIColor colorWithRed:0.569 green:0.557 blue:0.600 alpha:1.00],
                                             NSFontAttributeName : [UIFont fontWithName:@"Advent Pro" size:20]
                                             };
    segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:0.349 green:0.824 blue:0.976 alpha:1.00];
    segmentedControl.backgroundColor = [UIColor colorWithRed:0.102 green:0.090 blue:0.125 alpha:1.00];
    
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    

}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
