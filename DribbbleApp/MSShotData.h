//
//  MSShotData.h
//  DribbbleApp
//
//  Created by MonsterSucker on 17/12/2016.
//  Copyright © 2016 MonsterTech Studio. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MSShotData : MTLModel <MTLJSONSerializing>

@property(nonatomic,copy)NSString *avatarImageUrl;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *shotId;
@property(nonatomic,copy)NSString *viewsCount;
@property(nonatomic,copy)NSString *likesCount;
@property(nonatomic,copy)NSString *commentsCount;
@property(nonatomic,copy)NSString *shotAbout;
@property(nonatomic,copy)NSString *shotImageHidpiUrl;
@property(nonatomic,copy)NSString *shotImageNormalUrl;
@property(nonatomic,copy)NSString *shotImageTeaserUrl;
@property(nonatomic,copy)NSString *sourceUrl;
@property(nonatomic,copy)NSString *width;
@property(nonatomic,copy)NSString *height;
@property(nonatomic,copy)NSString *createdTime;
@property(nonatomic,copy)NSString *bucketsUrl;
@property(nonatomic,copy)NSString *commentsUrl;
@property(nonatomic,copy)NSString *likesUrl;
@property(nonatomic,copy)NSString *projectsUrl;

// 
+ (void)requestShotDataWithParams:(NSDictionary *)params callback:(void(^)(NSArray *shotData,NSError *error))block;
@end
