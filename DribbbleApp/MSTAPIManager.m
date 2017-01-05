//
//  MSTAPIManager.m
//  DribbbleApp
//
//  Created by MonsterSucker on 06/01/2017.
//  Copyright © 2017 MonsterTech Studio. All rights reserved.
//

#import "MSTAPIManager.h"

static NSString *const kBaseUrl = @"https://api.dribbble.com";
static dispatch_once_t onceToken;

@implementation MSTAPIManager

+ (id)sharedManager {
    static MSTAPIManager *_sharedManager = nil;
        dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
        _sharedManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedManager.requestSerializer = [AFJSONRequestSerializer serializer];
    });
    return _sharedManager;
}
@end
