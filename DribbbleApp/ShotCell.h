//
//  ShotCell.h
//  DribbbleApp
//
//  Created by MonsterSucker on 08/12/2016.
//  Copyright © 2016 MonsterTech Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MSShotData;

@interface ShotCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *wrapperView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userAvatarImageView;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *shotImageView;
@property (strong, nonatomic) IBOutlet UILabel *viewCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *likesCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentsCountLabel;
@property (strong, nonatomic) MSShotData *shotData;
@end
