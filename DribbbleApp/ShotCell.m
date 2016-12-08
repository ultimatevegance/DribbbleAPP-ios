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
    // Initialization code
    self.wrapperView.layer.cornerRadius = 8;
    self.userAvatarImageView.layer.cornerRadius = self.userAvatarImageView.frame.size.height / 2;
    self.userAvatarImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
