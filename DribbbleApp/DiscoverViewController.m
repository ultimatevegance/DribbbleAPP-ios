//
//  SecondViewController.m
//  DribbbleApp
//
//  Created by Monster on 06/12/2016.
//  Copyright © 2016 MonsterTech Studio. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *headerCollectionView;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.headerCollectionView registerNib:[UINib nibWithNibName:@"UserCell" bundle:nil] forCellWithReuseIdentifier:@"UserCell"];
    [self.headerCollectionView setContentInset:UIEdgeInsetsMake(-16, 10, 2, 0)];
   }
//test method
- (void)setApperanceForCell:(UICollectionViewCell *)cell{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    cell.backgroundColor = color;
}

#pragma mark - UICollectionViewDelegate




#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *userCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UserCell" forIndexPath:indexPath];
    [self setApperanceForCell:userCell];
    return userCell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
