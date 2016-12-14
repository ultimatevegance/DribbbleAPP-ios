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
}

#pragma mark - UICollectionViewDelegate




#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *userCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UserCell" forIndexPath:indexPath];
    
    return userCell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
