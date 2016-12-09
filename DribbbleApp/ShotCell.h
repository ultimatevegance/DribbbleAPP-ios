//
//  ShotCell.h
//  DribbbleApp
//
//  Created by MonsterSucker on 08/12/2016.
//  Copyright © 2016 MonsterTech Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShotCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *wrapperView;
@property (strong, nonatomic) IBOutlet UIImageView *userAvatarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shotImageView;

@end
