//
//  ShotCell.m
//  DribbbleApp
//
//  Created by MonsterSucker on 08/12/2016.
//  Copyright © 2016 MonsterTech Studio. All rights reserved.
//

#import "ShotCell.h"
#import "MSShotData.h"
#import "UIImageView+YYWebImage.h"
@implementation ShotCell

- (void)setShotData:(MSShotData *)shotData {
    _shotData = shotData;
    _titleLabel.text = _shotData.title;
    _userNameLabel.text = _shotData.userName;
    [_userAvatarImageView yy_setImageWithURL:[NSURL URLWithString:_shotData.avatarImageUrl] placeholder:[UIImage imageNamed:@"defaultAvatar"]];
    //TODO: 先使用normal的图片 然后下载完HIPI的图片后将图片换成高清的图片；
    [_shotImageView yy_setImageWithURL:[NSURL URLWithString:_shotData.shotImageNormalUrl] placeholder:nil];
    _viewCountLabel.text = _shotData.viewsCount;
    _likesCountLabel.text = _shotData.likesCount;
    _commentsCountLabel.text = _shotData.commentsCount;

}

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
