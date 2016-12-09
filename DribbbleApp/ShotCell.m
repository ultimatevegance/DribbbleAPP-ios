//
//  ShotCell.m
//  DribbbleApp
//
//  Created by MonsterSucker on 08/12/2016.
//  Copyright © 2016 MonsterTech Studio. All rights reserved.
//

#import "ShotCell.h"

@implementation ShotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization Cell UI
    self.wrapperView.layer.cornerRadius = 8;
//    self.wrapperView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
//    self.wrapperView.layer.shadowOffset = CGSizeMake(0, 5);
//    self.wrapperView.layer.shadowOpacity = 0.6;
//    self.wrapperView.layer.shadowRadius = 1.0;
    
    self.userAvatarImageView.layer.cornerRadius = self.userAvatarImageView.frame.size.height / 2;
    self.userAvatarImageView.layer.masksToBounds = YES;
    self.shotImageView.image = [UIImage imageNamed:@"sampleShot"];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
