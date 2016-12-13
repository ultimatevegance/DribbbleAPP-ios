//
//  FirstViewController.m
//  DribbbleApp
//
//  Created by Monster on 06/12/2016.
//  Copyright © 2016 MonsterTech Studio. All rights reserved.
//

#import "TrendViewController.h"
#import "HMSegmentedControl.h"
#import "ShotCell.h"
#import "MJRefresh.h"
#import "MSRereshGifHeader.h"
#define kScreenWidth CGRectGetWidth(self.view.frame)
#define KScreenHight CGRectGetHeight(self.view.frame)
#define AppThemeColorMain [UIColor colorWithRed:0.102 green:0.090 blue:0.125 alpha:1.00]
@interface TrendViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentControl;
@property (nonatomic, strong) NSMutableArray *columns;

@end

@implementation TrendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    [self _initialUIElements];
    
}

- (void)_initialUIElements{
    self.columns = [NSMutableArray arrayWithObjects:@"Trending",@"Popular",@"Gifs", nil];
    self.segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:self.columns];
    
    _segmentControl.frame = CGRectMake(0, 24, kScreenWidth, 40);
    _segmentControl.titleTextAttributes = @{
                                             NSForegroundColorAttributeName : [UIColor colorWithRed:0.569 green:0.557 blue:0.600 alpha:1.00],
                                             NSFontAttributeName : [UIFont fontWithName:@"Advent Pro" size:18.5f]
                                             };
    _segmentControl.selectedTitleTextAttributes = @{
                                                    NSForegroundColorAttributeName : [UIColor whiteColor],
                                                    NSFontAttributeName : [UIFont fontWithName:@"Advent Pro" size:20.0f]
                                                    };
    _segmentControl.selectionIndicatorColor = [UIColor colorWithRed:0.349 green:0.824 blue:0.976 alpha:1.00];
    _segmentControl.backgroundColor = AppThemeColorMain;
    _segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentControl.selectionIndicatorHeight = 2.0f;
    [_segmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [_segmentControl setSelectedSegmentIndex:1];
    [self.view addSubview:_segmentControl];
    
    __weak typeof(self) weakSelf = self;

    [self.segmentControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(kScreenWidth * index, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height) animated:YES];
    }];

    CGFloat segmentControlMaxY = CGRectGetHeight(_segmentControl.frame);
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, segmentControlMaxY + 24, kScreenWidth, KScreenHight - segmentControlMaxY)];
    self.scrollView.backgroundColor = AppThemeColorMain;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(3 * kScreenWidth, KScreenHight - segmentControlMaxY);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(kScreenWidth, 0, kScreenWidth, KScreenHight) animated:YES];
    [self.view addSubview:self.scrollView];
    
    for (int i = 0; i < 3; i ++) {
        UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth,KScreenHight - segmentControlMaxY) style:UITableViewStylePlain];
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.backgroundColor = AppThemeColorMain;
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableview.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.tabBarController.tabBar.frame.size.height + 20)];
        [tableview registerNib:[UINib nibWithNibName:@"ShotCell" bundle:nil] forCellReuseIdentifier:@"ShotCell" ];
        [self.scrollView addSubview:tableview];
        tableview.tag = 1000 + i;
        MSRereshGifHeader *header = [MSRereshGifHeader headerWithRefreshingBlock:^{
            // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                //refresh data method
                
                
                
                // 结束刷新
                [tableview.mj_header endRefreshing];
            });

        }];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        tableview.mj_header = header;
        
        
    }


    
    
}


//test method
//- (void)setApperanceForTableview:(UITableView *)tableview {
//    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
//    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
//    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
//    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
//    tableview.backgroundColor = color;
//}
- (void)refreshData{
    
   [NSThread sleepForTimeInterval:2.0];
    
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
    NSInteger page = self.scrollView.contentOffset.x / pageWidth;
    [self.segmentControl setSelectedSegmentIndex:page animated:YES];
}


#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShotCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    

    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 390;
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
