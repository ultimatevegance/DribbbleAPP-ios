//
//  MSShotData.m
//  DribbbleApp
//
//  Created by MonsterSucker on 17/12/2016.
//  Copyright © 2016 MonsterTech Studio. All rights reserved.
//

#import "MSShotData.h"
#import "MSTAPIManager.h"
@implementation MSShotData

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"avatarImageUrl" : @"user.avatar_url",
             @"shotId" : @"id",
             @"userName" : @"user.name",
             @"title" : @"title",
             @"viewsCount" : @"views_count",
             @"likesCount" : @"likes_count",
             @"commentsCount" : @"comments_count",
             @"shotAbout" : @"description",
             @"shotImageHidpiUrl" : @"images.hidpi",
             @"shotImageNormalUrl" : @"images.normal",
             @"shotImageTeaserUrl" : @"images.teaser",
             @"sourceUrl" : @"html_url",
             @"width" : @"width",
             @"height" : @"height",
             @"createdTime" : @"created_at",
             @"commentsUrl" : @"comments_url",
             @"likesUrl" : @"likes_url",
             @"projectsUrl" : @"projects_url"
             };
}

+(void)requestShotDataWithParams:(NSDictionary *)params callback:(void (^)(NSArray *, NSError *))block {
    [MSTAPIManager sharedManager ] ;
}
@end
