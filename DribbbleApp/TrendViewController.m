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

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentControl;
@end

@implementation TrendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    [self _initialUIElements];
    
    
}

- (void)_initialUIElements{
    CGFloat screenwith = CGRectGetWidth(self.view.frame);
    CGFloat screenHight = CGRectGetHeight(self.view.frame);
    UIColor *mainThemeColor = [UIColor colorWithRed:0.102 green:0.090 blue:0.125 alpha:1.00];
    self.segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Trending",
                                @"Highlights",
                                @"Popular"]];
    
    _segmentControl.frame = CGRectMake(0, 24, screenwith, 40);
    _segmentControl.titleTextAttributes = @{
                                             NSForegroundColorAttributeName : [UIColor colorWithRed:0.569 green:0.557 blue:0.600 alpha:1.00],
                                             NSFontAttributeName : [UIFont fontWithName:@"Advent Pro" size:20.0f]
                                             };
    _segmentControl.selectionIndicatorColor = [UIColor colorWithRed:0.349 green:0.824 blue:0.976 alpha:1.00];
    _segmentControl.backgroundColor = mainThemeColor;
    _segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentControl.selectionIndicatorHeight = 2.0f;
    [_segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentControl];
    CGFloat segmentControlMaxY = CGRectGetHeight(_segmentControl.frame);
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, segmentControlMaxY + 24, screenwith, screenHight - segmentControlMaxY)];
    self.scrollView.backgroundColor = [UIColor yellowColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(3 * screenwith, screenHight - segmentControlMaxY);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(screenwith, 0, screenwith, screenHight) animated:YES];
    [self.view addSubview:self.scrollView];
    
    // add subview -setup tableviews
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenwith, screenHight - segmentControlMaxY)];
    [self setApperanceForLabel:label1];
    label1.text = @"Worldwide";
    [self.scrollView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(screenwith, 0, screenwith, screenHight - segmentControlMaxY)];
    [self setApperanceForLabel:label2];
    label2.text = @"Local";
    [self.scrollView addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(screenwith * 2, 0, screenwith, screenHight - segmentControlMaxY)];
    [self setApperanceForLabel:label3];
    label3.text = @"Headlines";
    [self.scrollView addSubview:label3];


    
    
}
//test method
- (void)setApperanceForLabel:(UILabel *)label {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    label.backgroundColor = color;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:21.0f];
    label.textAlignment = NSTextAlignmentCenter;
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
			 return UIStatusBarStyleLightContent;
}
#pragma mark - UIScrollViewDelegate
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    [self.segmentControl setSelectedSegmentIndex:page animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
